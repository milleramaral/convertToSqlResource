unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.RegularExpressions;

const
  REGEX_TSQLDATASET_MATCH = '((?:object|inherited) \w+: )TSQLDataSet\b$';
  REGEX_CLASS_NAME = '(?:object|inherited) \w+: (?<className>T\w+)$';
  REGEX_GET_TSQLDATASET_CONTENT = '(?:object|inherited) (?<componentName>\w+): TSQLDataSet\R(?<componentContent>[\s\S]*?)(?=\R.*?end)';

  REGEX_GET_SQL_NO_FORMATTED = 'CommandText = {0,}\R?(?<componentContent>[\s\S]*?)(?=\R.*? {4}(?:DataSource|DbxCommandType|MaxBlobSize|Params))';

  REGEX_REMOVE_DELPHI_IDENT = '^ {6}';
  REGEX_JOIN_DELPHIS_LINE_BREAK_1 = '(?<enterBefore>(?:#13#10|#13|#10){1,}) \+$\R';
  REGEX_JOIN_DELPHIS_LINE_BREAK_2 = ' \+$\R(?<enterBefore>(?:#13#10|#13|#10){1,})';
  REGEX_JOIN_DELPHIS_LINE_BREAK_3 = ''' \+$\R''';

  REGEX_REMOVE_SINGLE_QUOTE_1 = '('')?((?:#\d{1,3}))('')?';
  REGEX_REMOVE_SINGLE_QUOTE_2 = '''';

  REGEX_GET_CODE_ASCI = '(?<=#)\d+';

  REGEX_GET_SQL_EXPRE = '(SqlExpr {0,})([,;])';
  REGEX_REPLACE_TSQLDATASET = '(\w+: )TSQLDataSet(;)$';

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    edtDfmFilesPath: TLabeledEdit;
    btnLoad: TButton;
    edtSqlFilesPath: TLabeledEdit;
    btnCreate: TButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    lblTitleDfmFiles: TLabel;
    mmoDfmFiles: TMemo;
    Panel3: TPanel;
    lblSqlFiles: TLabel;
    mmoSqlFiles: TMemo;
    Panel4: TPanel;
    lblErrors: TLabel;
    mmoErrors: TMemo;
    Splitter2: TSplitter;
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    procedure setTitles;
    procedure ConvertFile(ADfmFilename: string);
    procedure CreateSqlFile(ClassName: string; groups: TGroupCollection; var sqlFileName: string);
    function ConvertCodeAsciiToString(AText: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  System.Types;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  setTitles;
  edtDfmFilesPath.Text := TPath.Combine(TDirectory.GetCurrentDirectory, 'DfmFiles');
  edtSqlFilesPath.Text := TPath.Combine(TDirectory.GetCurrentDirectory, 'SqlFiles');
end;

procedure TfrmPrincipal.setTitles;
begin
  lblTitleDfmFiles.Caption := Format('dfm files founded (%d)', [mmoDfmFiles.Lines.Count]);
  lblSqlFiles.Caption := Format('sql files created (%d)', [mmoSqlFiles.Lines.Count]);
  lblErrors.Caption := Format('dfm files with errors (%d)', [mmoErrors.Lines.Count]);
end;

procedure TfrmPrincipal.btnCreateClick(Sender: TObject);
var
  dfmFile: string;
begin
  mmoSqlFiles.Clear;
  mmoErrors.Clear;

  if mmoDfmFiles.Lines.Count = 0 then
    btnLoadClick(btnLoad);

  for dfmFile in mmoDfmFiles.Lines do
  begin
    try
      ConvertFile(dfmFile);
    except

    end;
    setTitles;
  end;
  ShowMessage('Finished.');
end;

procedure ConvertPasFile(ADfmFilename: string);
var
  pasFileName: string;
  archiveContent : TStringList;
begin
  archiveContent := TStringList.Create;
  try
    pasFileName := ChangeFileExt(ADfmFilename, '.pas');
    archiveContent.LoadFromFile(pasFileName);
    archiveContent.Text := TRegex.Replace(archiveContent.Text, REGEX_GET_SQL_EXPRE, '$1, SqlResource$2', [roIgnoreCase]);
    archiveContent.Text := TRegex.Replace(archiveContent.Text, REGEX_REPLACE_TSQLDATASET, '$1TSQLResource$2', [roMultiLine, roIgnoreCase]);
    archiveContent.SaveToFile(pasFileName, TEncoding.UTF8);
  finally
    FreeAndNil(archiveContent);
  end;
end;

procedure TFrmPrincipal.CreateSqlFile(ClassName: string; groups: TGroupCollection; var sqlFileName: string);
var
  ComponentName: string;
  ComponentContent: string;
  contentMatches: TMatchCollection;

  sqlFile: TStringList;
begin
  ForceDirectories(edtSqlFilesPath.Text);

  ComponentName := Groups['componentName'].Value;
  ComponentContent := Groups['componentContent'].Value;

  sqlFileName := Format('%s%s.sql', [ClassName, ComponentName]);
  if ComponentContent <> '' then
  begin
    sqlFile := TStringList.Create;
    try
      contentMatches := TRegex.Matches(ComponentContent, REGEX_GET_SQL_NO_FORMATTED, []);

      if (contentMatches.Count = 0) then
        exit;

      groups := contentMatches.Item[0].Groups;
      sqlFile.Text := Groups['componentContent'].Value;

      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_REMOVE_DELPHI_IDENT, '', [roMultiLine]);

      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_JOIN_DELPHIS_LINE_BREAK_1, '$1', [roMultiLine]);
      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_JOIN_DELPHIS_LINE_BREAK_2, '$1', [roMultiLine]);
      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_JOIN_DELPHIS_LINE_BREAK_3, '', [roMultiLine]);

      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_REMOVE_SINGLE_QUOTE_1, '@$2@', []);
      sqlFile.Text := TRegex.Replace(sqlFile.Text, REGEX_REMOVE_SINGLE_QUOTE_2, '', []);
      sqlFile.Text := ConvertCodeAsciiToString(sqlFile.Text);

      sqlFile.SaveToFile(TPath.Combine(edtSqlFilesPath.Text, sqlFileName), TEncoding.UTF8);
    finally
      FreeAndNil(sqlFile);
    end;
  end;

  FreeAndNil(sqlFile);
end;

procedure TfrmPrincipal.ConvertFile(ADfmFilename: string);
var
  archiveContent: TStringList;
  ClassName: string;

  matches: TMatchCollection;
  match: TMatch;

  sqlFileName: string;
begin
  archiveContent := TStringList.Create;
  try
    try
      archiveContent.LoadFromFile(ADfmFilename, TEncoding.UTF8);

      if archiveContent.Count <= 2 then
        exit;

      if (not TRegex.Match(archiveContent.Text, REGEX_TSQLDATASET_MATCH, [roIgnoreCase, roMultiLine]).Success) then
        exit;

      matches := TRegex.Matches(archiveContent.Strings[0], REGEX_CLASS_NAME);
      if (matches.Count = 0) then
        exit;
      ClassName := matches.Item[0].Groups['className'].Value;

      matches := TRegex.Matches(archiveContent.Text, REGEX_GET_TSQLDATASET_CONTENT, []);
      if (matches.Count = 0) then
        exit;

      for match in Matches do
      begin
        if not match.Success then
          Continue;

        CreateSqlFile(ClassName, match.Groups, sqlFileName);
        archiveContent.Text := TRegex.Replace(archiveContent.Text, REGEX_TSQLDATASET_MATCH, '$1TSQLResource', [roIgnoreCase, roMultiLine]);
        archiveContent.SaveToFile(ADfmFilename, TEncoding.UTF8);

        mmoSqlFiles.Lines.Add(sqlFileName);
        setTitles;
        Application.ProcessMessages;
      end;

      ConvertPasFile(ADfmFilename);

     except
      on E: Exception do
      begin
          mmoErrors.Lines.Add(Format('%s - %s', [ADfmFilename, E.Message]));
          exit
      end;
    end;
  finally
    FreeAndNil(archiveContent);
  end;
end;

function TfrmPrincipal.ConvertCodeAsciiToString(AText: string):string;
var
  matches: TMatchCollection;
  match: TMatch;
  codeAscii: string;
  charAscii: string;
begin
  Result := AText;

  matches := TRegex.Matches(AText, REGEX_GET_CODE_ASCI, []);
  if (matches.Count = 0) then
    exit;

  for match in Matches do
  begin
    try
      charAscii := Char(Ord(StrToInt(match.Value)));
      codeAscii := Format('@#%s@',[match.Value]);

      Result := TRegex.Replace(Result, codeAscii, charAscii);
    except
      ShowMessage(match.Value);
    end;
  end;
end;

procedure TfrmPrincipal.btnLoadClick(Sender: TObject);
var
  LList: TStringDynArray;
  fileFound: string;
begin
  mmoDfmFiles.Clear;
  mmoSqlFiles.Clear;
  mmoErrors.Clear;

  setTitles;

  LList := TDirectory.GetFiles(edtDfmFilesPath.Text, '*.dfm', TSearchOption.soAllDirectories);

  for fileFound in LList do
  begin
    mmoDfmFiles.Lines.Add(fileFound);
    setTitles;
    Application.ProcessMessages;
  end;
end;

end.
