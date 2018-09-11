unit uDaoCnsPessoa;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, uDaoPoolConexao,
  DBClient;

type
  TDaoCnsPessoa = class(TDaoPoolConexao)
    DspPapel: TDataSetProvider;
    SqlPapel: TSQLDataSet;
    DspEstadoCivil: TDataSetProvider;
    SqlEstadoCivil: TSQLDataSet;
    DspSexo: TDataSetProvider;
    SqlSexo: TSQLDataSet;
    DspTipoGenerico: TDataSetProvider;
    SqlTipoGenerico: TSQLDataSet;
    DspLogradouro: TDataSetProvider;
    SqlLogradouro: TSQLDataSet;
    SqlExistePapelPorDoc: TSQLDataSet;
    SqlExistePapelPorNome: TSQLDataSet;
    SqlPessoaPorDoc: TSQLDataSet;
    DspPessoaPorDoc: TDataSetProvider;
    CdsPessoaPorDoc: TClientDataSet;
    DspEnquadramento: TDataSetProvider;
    SqlEnquadramento: TSQLDataSet;
    procedure DspPapelBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DSServerModuleCreate(Sender: TObject);
  private
    CmtPapel: string;
  protected
    function GetNomeTabelaPapel: string; virtual;
    function GetCamposTabelaPapel: string; virtual;
  public
    function ExistePapel(AIdTpEntidade: Integer; ADocumento: string): Boolean;
    function ExistePapelNome(ANome: string; var ATpEntidade: Integer): Boolean;
    function GetPessoaPorDoc(ATpEntidade: Integer; ADocumento: string): TDataSet;
  end;

implementation

uses UteisGeral, uServerCnsPessoa, ConstGeral;

{$R *.dfm}

{ TDaoCnsPessoa }

procedure TDaoCnsPessoa.DspPapelBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  if (not SqlPapel.Active) then
  begin
    if (CmtPapel = '') then
    begin
      CmtPapel := SqlPapel.CommandText;
    end;
    SqlPapel.CommandText := DataSetGerenciador.InserirClausulaWhereNaSqlText(CmtPapel, OwnerData);
    SqlPapel.Params.AssignValues(DspPapel.Params);
  end;
end;

procedure TDaoCnsPessoa.DSServerModuleCreate(Sender: TObject);
begin
  inherited;
  SqlPapel.CommandText := StringReplace(SqlPapel.CommandText, 'TABELA_PAPEL', GetNomeTabelaPapel, [rfReplaceAll]);
  SqlPapel.CommandText := StringReplace(SqlPapel.CommandText, 'CAMPOS_PAPEL', GetCamposTabelaPapel, [rfReplaceAll]);

  SqlExistePapelPorDoc.CommandText := StringReplace(SqlExistePapelPorDoc.CommandText, 'TABELA_PAPEL', GetNomeTabelaPapel, [rfReplaceAll]);
  SqlExistePapelPorDoc.Params.CreateParam(ftString, 'CPF', ptInput);
  SqlExistePapelPorDoc.Params.CreateParam(ftString, 'CNPJ', ptInput);

  SqlExistePapelPorNome.CommandText := StringReplace(SqlExistePapelPorNome.CommandText, 'TABELA_PAPEL', GetNomeTabelaPapel, [rfReplaceAll]);
  SqlExistePapelPorNome.Params.CreateParam(ftString, 'NOME_RAZAO', ptInput);
end;

function TDaoCnsPessoa.ExistePapel(AIdTpEntidade: Integer;
  ADocumento: string): Boolean;
begin
  Result := TCnsPessoa.ExistePapel(AIdTpEntidade, ADocumento, Self);
end;

function TDaoCnsPessoa.ExistePapelNome(ANome: string;
  var ATpEntidade: Integer): Boolean;
begin
  SqlExistePapelPorNome.Close;
  SqlExistePapelPorNome.ParamByName('NOME_RAZAO').AsString := ANome;
  SqlExistePapelPorNome.Open;

  Result := (not SqlExistePapelPorNome.IsEmpty);
  if Result then
  begin
    ATpEntidade := SqlExistePapelPorNome.FieldByName('ID_TP_ENTIDADE').AsInteger;
  end;

  SqlExistePapelPorNome.Close;
end;

function TDaoCnsPessoa.GetCamposTabelaPapel: string;
begin
  Result := 'A.ID_PESSOA';
end;

function TDaoCnsPessoa.GetNomeTabelaPapel: string;
begin
  Result := 'SIS_PESSOA A';
end;

function TDaoCnsPessoa.GetPessoaPorDoc(ATpEntidade: Integer;
  ADocumento: string): TDataSet;
begin
  CdsPessoaPorDoc.Close;

  CdsPessoaPorDoc.Params.ParamByName('CPF').AsString := '-';
  CdsPessoaPorDoc.Params.ParamByName('CNPJ').AsString := '-';

  if (ATpEntidade = TipoEntidade.Fisica) then
  begin
    CdsPessoaPorDoc.Params.ParamByName('CPF').AsString := ADocumento;
  end
  else if (ATpEntidade = TipoEntidade.Juridica) then
  begin
    CdsPessoaPorDoc.Params.ParamByName('CNPJ').AsString := ADocumento;
  end;

  CdsPessoaPorDoc.Open;

  Result := CdsPessoaPorDoc;
end;

end.
