unit uDaoCnsFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDaoCnsPessoa, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDaoCnsFornecedor = class(TDaoCnsPessoa)
    SqlFindFornecedorTemp: TSQLDataSet;
    SqlCredorConta: TSQLDataSet;
    SqlFindFornecedor: TSQLDataSet;
    DspCredorConta: TDataSetProvider;
    CdsCredorConta: TClientDataSet;
    DspEstado: TDataSetProvider;
    SqlEstado: TSQLDataSet;
    SqlFindMunicipio: TSQLDataSet;
    SqlFindTpLogradouro: TSQLDataSet;
    SQLConsultaFornecedor: TSQLDataSet;
    DspConsultaFornecedor: TDataSetProvider;
    SQLConsultaFornecedorRAZAO: TStringField;
    SQLConsultaFornecedorFANTASIA: TStringField;
    SQLConsultaFornecedorFONE1: TStringField;
    SQLConsultaFornecedorFONE2: TStringField;
    SQLConsultaFornecedorFAX: TStringField;
    SQLConsultaFornecedorCEL: TStringField;
    SQLConsultaFornecedorEMAIL: TStringField;
    SQLConsultaFornecedorTIPODOC: TStringField;
    SQLConsultaFornecedorDOCUMENTO: TStringField;
    SQLConsultaFornecedorORIGEM: TStringField;
    SQLConsultaFornecedorENTIDADE: TStringField;
    SQLConsultaFornecedorID_RAMO_ATIVIDADE: TIntegerField;
    SQLConsultaFornecedorID_GRUPO: TIntegerField;
    SQLConsultaFornecedorID_GRUPO_SERVICO: TIntegerField;
    SQLConsultaFornecedorID_MATERIAL: TIntegerField;
    SQLConsultaFornecedorID_MUNICIPIO: TIntegerField;
    SQLConsultaFornecedorEMPENHO: TIntegerField;
    DspFornecedorPregao: TDataSetProvider;
    SqlFornecedorPregao: TSQLDataSet;
    procedure DspConsultaFornecedorBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
  protected
    function GetNomeTabelaPapel: string; override;
    function GetCamposTabelaPapel: string; override;

    function RetirarFormatacao(ATexto: string): string;

    function GetFornecedor(    ACNPJ, ACPF: string; var AIdFornecedor, AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia,AUFIE: OleVariant): Boolean;
    function GetFornecedorTemp(ACNPJ, ACPF: string; var AIdFornecedor, AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail,                AUFIE: OleVariant): Boolean;
  public
    function GetFornecedorPessoaJuridica(ACNPJ: string; var Temporario: boolean; var AIdFornecedor,AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE: OleVariant): Boolean;
    function GetFornecedorPessoaFisica(ACPF: string; var Temporario: boolean; var AIdFornecedor, AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE: OleVariant): Boolean;
    function GetCredorConta(AIdCredor: Integer): TDataSet;
    function GetMunicipio(AMunicipio, AUF: string): Integer;
    function GetTipoLogradouro(var ADs_Logradouro: string): Integer;
  private
    CmtConsultaFornecedor: string;
  end;

implementation



{$R *.dfm}

uses StrUtils;

{ TDaoCnsFornecedor }

procedure TDaoCnsFornecedor.DspConsultaFornecedorBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if (not SqlConsultaFornecedor.Active) then
  begin
    if (CmtConsultaFornecedor = '') then CmtConsultaFornecedor := SqlConsultaFornecedor.CommandText;
    SqlConsultaFornecedor.CommandText := CmtConsultaFornecedor;

    OwnerData := IfThen(OwnerData = '', '', ' WHERE ' + OwnerData);
    SqlConsultaFornecedor.CommandText := StringReplace(SqlConsultaFornecedor.CommandText, '/*FILTRO*/', OwnerData, [rfReplaceAll]);

    SqlConsultaFornecedor.Params.AssignValues(DspConsultaFornecedor.Params);
  end;

end;

function TDaoCnsFornecedor.GetCamposTabelaPapel: string;
begin
  Result :=
    'A1.ID_FORNECEDOR, ' +
    'A1.ID_CREDOR, ' +
    '(SELECT IIF(COUNT(1) > 0, 1, 0) FROM SUP_SANCAO_FORNECEDOR AA WHERE AA.ID_FORNECEDOR = A1.ID_FORNECEDOR AND CAST(''TODAY'' AS DATE) BETWEEN AA.DT_INICIO AND AA.DT_FIM) AS SANCAO, ' +
    '(                                                                                                                                                                                  ' +
    '  SELECT FIRST 1                                                                                                                                                                   ' +
    '     1 AS IMPEDITIVO                                                                                                                                                               ' +
    '   FROM                                                                                                                                                                            ' +
    '     SUP_SANCAO_FORNECEDOR AA                                                                                                                                                      ' +
    '     LEFT JOIN SUP_TP_SANCAO BB ON BB.ID_TP_SANCAO = AA.ID_TP_SANCAO                                                                                                               ' +
    '   WHERE                                                                                                                                                                           ' +
    '     BB.IMPEDITIVO = 1                                                                                                                                                             ' +
    '     AND AA.ID_FORNECEDOR = A1.ID_FORNECEDOR                                                                                                                                       ' +
    '     AND CAST(''TODAY'' AS DATE) BETWEEN AA.DT_INICIO AND AA.DT_FIM                                                                                                                ' +
    ' ) AS IMPEDITIVO                                                                                                                                                                   ';
end;

function TDaoCnsFornecedor.GetCredorConta(AIdCredor: Integer): TDataSet;
begin
  CdsCredorConta.Close;
  CdsCredorConta.Params.ParamByName('ID_CREDOR').AsInteger := AIdCredor;
  CdsCredorConta.Open;
  Result := CdsCredorConta;
end;

function TDaoCnsFornecedor.GetTipoLogradouro(var ADs_Logradouro: string): Integer;
begin
  SqlFindTpLogradouro.ParamByName('DS_LOGRADOURO').AsString:= ADs_Logradouro;
  SqlFindTpLogradouro.Open;
  if not SqlFindTpLogradouro.Eof then
  begin
    ADs_Logradouro:= SqlFindTpLogradouro.FieldByName('DS_LOGRADOURO').AsString;
    Result:= SqlFindTpLogradouro.FieldByName('ID_TP_LOGRADOURO').AsInteger;
  end
  else
    Result:= 0;
  SqlFindTpLogradouro.Close;
end;

function TDaoCnsFornecedor.GetMunicipio(AMunicipio, AUF: string): Integer;
begin
  SqlFindMunicipio.ParamByName('DS_MUNICIPIO').AsString:= AMunicipio;
  SqlFindMunicipio.ParamByName('UF').AsString:= AUF;
  SqlFindMunicipio.Open;
  if not SqlFindMunicipio.Eof then
    Result:= SqlFindMunicipio.FieldByName('ID_MUNICIPIO').AsInteger
  else
    Result:= -1;
  SqlFindMunicipio.Close;
end;

function TDaoCnsFornecedor.GetFornecedorTemp(ACNPJ, ACPF: string;
  var AIdFornecedor,AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail,AUFIE: OleVariant): Boolean;
begin
  ACNPJ := RetirarFormatacao(ACNPJ);
  ACPF  := RetirarFormatacao(ACPF);

  SqlFindFornecedorTemp.Close;

  SqlFindFornecedorTemp.ParamByName('CNPJ').Clear;
  if (ACNPJ <> '') then
  begin
    SqlFindFornecedorTemp.ParamByName('CNPJ').AsString := ACNPJ;
  end;

  SqlFindFornecedorTemp.ParamByName('CPF').Clear;
  if (ACPF <> '') then
  begin
    SqlFindFornecedorTemp.ParamByName('CPF').AsString := ACPF;
  end;

  SqlFindFornecedorTemp.Open;
  Result := (not SqlFindFornecedorTemp.IsEmpty);
  if (Result) then
  begin
    AIdFornecedor := SqlFindFornecedorTemp.FieldByName('ID_FORNECEDOR_TEMP').AsInteger;
    ANome := SqlFindFornecedorTemp.FieldByName('NOME').AsString;
    AIE := SqlFindFornecedorTemp.FieldByName('IE').AsString;
    ATelefone := SqlFindFornecedorTemp.FieldByName('TELEFONE').AsString;
    AFax := SqlFindFornecedorTemp.FieldByName('FAX').AsString;
    AEmail := SqlFindFornecedorTemp.FieldByName('EMAIL').AsString;
    AIdUFIE := SqlFindFornecedorTemp.FieldByName('ID_ESTADO_IE').asInteger;
    AUFIE := SqlFindFornecedorTemp.FieldByName('UF').AsString;
  end;

  SqlFindFornecedorTemp.Close;
end;

function TDaoCnsFornecedor.GetNomeTabelaPapel: string;
begin
  Result :=
    'SUP_FORNECEDOR A1 ' +
    '       LEFT JOIN SIS_PESSOA   A ON A.ID_PESSOA      = A1.ID_CREDOR' +
    '       LEFT JOIN SUP_COTACAO A2 ON A2.ID_FORNECEDOR = A1.ID_FORNECEDOR AND A2.PROPOSTA = 1 ';
end;

function TDaoCnsFornecedor.RetirarFormatacao(ATexto: string): string;
begin
  ATexto := StringReplace(ATexto, '.', '', [rfReplaceAll]);
  ATexto := StringReplace(ATexto, '-', '', [rfReplaceAll]);
  ATexto := StringReplace(ATexto, '/', '', [rfReplaceAll]);
  ATexto := StringReplace(ATexto, '\', '', [rfReplaceAll]);
  Result := Trim(ATexto);
end;

function TDaoCnsFornecedor.GetFornecedor(ACNPJ, ACPF: string;
  var AIdFornecedor,AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE: OleVariant): Boolean;
begin
  ACNPJ := RetirarFormatacao(ACNPJ);
  ACPF  := RetirarFormatacao(ACPF);

  SqlFindFornecedor.Close;

  SqlFindFornecedor.ParamByName('CNPJ').Clear;
  if (ACNPJ <> '') then
  begin
    SqlFindFornecedor.ParamByName('CNPJ').AsString := ACNPJ;
  end;

  SqlFindFornecedor.ParamByName('CPF').Clear;
  if (ACPF <> '') then
  begin
    SqlFindFornecedor.ParamByName('CPF').AsString := ACPF;
  end;

  SqlFindFornecedor.Open;
  Result := (not SqlFindFornecedor.IsEmpty);
  if (Result) then
  begin
    AIdFornecedor := SqlFindFornecedor.FieldByName('ID_FORNECEDOR').AsInteger;
    ANome := SqlFindFornecedor.FieldByName('NOME_USR').AsString;
    AIE := SqlFindFornecedor.FieldByName('IE').AsString;
    ATelefone := SqlFindFornecedor.FieldByName('FONE1').AsString;
    AFax := SqlFindFornecedor.FieldByName('FAX').AsString;
    AEmail := SqlFindFornecedor.FieldByName('EMAIL').AsString;
    AIM := SqlFindFornecedor.FieldByName('IM').AsString;
    AFantasia := SqlFindFornecedor.FieldByName('FANTASIA').AsString;
    AIdUFIE := SqlFindFornecedor.FieldByName('ID_ESTADO_IE').asInteger;
    AUFIE := SqlFindFornecedor.FieldByName('UF').AsString;
  end;

  SqlFindFornecedor.Close;
end;

function TDaoCnsFornecedor.GetFornecedorPessoaFisica(ACPF: string; var Temporario: boolean; var AIdFornecedor, AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE: OleVariant): Boolean;
begin
  ACPF  := RetirarFormatacao(ACPF);

  if (GetFornecedor('', ACPF, AIdFornecedor, AIdUFIE, ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE)) then
  begin
    Temporario := False;
    Result := True;
  end
  else if (GetFornecedorTemp('', ACPF, AIdFornecedor, AIdUFIE, ANome, AIE, ATelefone, AFax, AEmail, AUFIE)) then
  begin
    Temporario := True;
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function TDaoCnsFornecedor.GetFornecedorPessoaJuridica(ACNPJ: string; var Temporario: boolean; var AIdFornecedor,AIdUFIE: Integer; var ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE: OleVariant): Boolean;
begin
  ACNPJ := RetirarFormatacao(ACNPJ);

  if (GetFornecedor(ACNPJ, '', AIdFornecedor, AIdUFIE, ANome, AIE, ATelefone, AFax, AEmail, AIM, AFantasia, AUFIE)) then
  begin
    Temporario := False;
    Result := True;
  end
  else if (GetFornecedorTemp(ACNPJ, '', AIdFornecedor, AIdUFIE, ANome, AIE, ATelefone, AFax, AEmail, AUFIE)) then
  begin
    Temporario := True;
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

end.
