unit uDaoCnsContrato;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider,
  uDaoPoolConexao, DbClient;

type
  TDaoCnsContrato = class(TDaoPoolConexao)
    DspContratante: TDataSetProvider;
    SqlContratante: TSQLDataSet;
    DspContratanteSaldoSE: TDataSetProvider;
    SqlContratanteSaldoSE: TSQLDataSet;
    DspContratanteSaldoAF: TDataSetProvider;
    SqlContratanteSaldoAF: TSQLDataSet;
    DspContratado: TDataSetProvider;
    SqlContratado: TSQLDataSet;
    SqlTemEmpenho: TSQLDataSet;
    SqlTemLancamento: TSQLDataSet;
    SqlTemReceita: TSQLDataSet;
    DspAditivo: TDataSetProvider;
    SqlAditivo: TSQLDataSet;
    SqlMovEmpenho: TSQLDataSet;
    DspMovEmpenho: TDataSetProvider;
    SqlAvisoVigencia: TSQLDataSet;
    DspAvisoVigencia: TDataSetProvider;
    SqlAvisoPublicacao: TSQLDataSet;
    DspAvisoPublicacao: TDataSetProvider;
    SqlAvisoEsgotarQtd: TSQLDataSet;
    DspAvisoEsgotarQtd: TDataSetProvider;
    SqlRetornaInfoContrato: TSQLDataSet;
    SqlAvisoUtilizacao: TSQLDataSet;
    DspAvisoUtilizacao: TDataSetProvider;
    DspObras: TDataSetProvider;
    SqlObras: TSQLDataSet;
    DspRelacaoContrato: TDataSetProvider;
    SqlRelacaoContrato: TSQLDataSet;
    SqlAvisoEmail: TSQLDataSet;
    DspAvisoEmail: TDataSetProvider;
    SqlAvisoEmailID_CONTRATO: TIntegerField;
    SqlAvisoEmailNR_CONTRATO: TStringField;
    SqlAvisoEmailANO_CONTRATO: TSmallintField;
    SqlAvisoEmailID_PROCESSO_COMPRA: TIntegerField;
    SqlAvisoEmailID_CREDOR: TIntegerField;
    SqlAvisoEmailDS_TP_CONTRATO: TStringField;
    SqlAvisoEmailNR_PROCESSO_COMPRA: TIntegerField;
    SqlAvisoEmailANO_PROCESSO_COMPRA: TSmallintField;
    SqlAvisoEmailNR_MODALIDADE: TIntegerField;
    SqlAvisoEmailANO_MODALIDADE: TSmallintField;
    SqlAvisoEmailNR_EDITAL: TStringField;
    SqlAvisoEmailANO_EDITAL: TIntegerField;
    SqlAvisoEmailFORNECEDOR: TStringField;
    SqlAvisoEmailCPF: TStringField;
    SqlAvisoEmailCNPJ: TStringField;
    SqlAvisoEmailCPF_RESP: TStringField;
    SqlAvisoEmailNOME_RESP: TStringField;
    SqlAvisoEmailEMAIL: TStringField;
    SqlAvisoEmailCOMPRADOR: TStringField;
    SqlAvisoEmailDT_ULTIMO_ENVIO: TSQLTimeStampField;
    SqlAvisoEmailDT_FINAL: TSQLTimeStampField;
    SqlAvisoEmailDIAS: TFloatField;
    SqlAvisoEmailEMAIL_VENCCONTRATO: TIntegerField;
    SqlAvisoEmailEMAIL_VENCFREQUENCIA: TIntegerField;
    SqlAvisoEmailSELECAO: TStringField;
    DspContratoRegraVencimento: TDataSetProvider;
    SqlContratoRegraVencimento: TSQLDataSet;
    SqlAvisoEmailDS_TP_RENOVACAO: TStringField;
    DspContratoItem: TDataSetProvider;
    SqlContratoItem: TSQLDataSet;
    DspItemDescricao: TDataSetProvider;
    SqlItemDescricao: TSQLDataSet;
    procedure DspContratanteBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DspContratadoBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DspRelacaoContratoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DspRelacaoContratoGetData(Sender: TObject; DataSet: TCustomClientDataSet);
  private
    CmtContratado: string;
    CmtContratante: string;
    CmtRelacaoContrato: string;
  public
    function TemEmpenhos(AIdContrato: Integer): boolean;
    function TemReceitas(AIdContrato: Integer): boolean;
    function TemLancamentos(AIdOrgao: Integer; ANumero: string; AAno: Integer): Boolean;
    function RetornaInfoContrato(AIdProcessoCompra, AIdFornecedor: Integer; var AIdContrato, AAnoContrato: Integer; var ANrContrato: string): Boolean;
  end;

implementation

uses
  UteisGeral, Constsuprimento;

{$R *.dfm}

function TDaoCnsContrato.TemEmpenhos(AIdContrato: Integer): boolean;
begin
  SqlTemEmpenho.Close;
  SqlTemEmpenho.ParamByName('ID_CONTRATO').AsInteger:=AIdContrato;
  SqlTemEmpenho.ParamByName('ST_PEDIDO_COMPOSICAO_CANCELADO').AsInteger:= SituacaoPedidoComposicao.Cancelado;
  SqlTemEmpenho.Open;
  Result:= not(SqlTemEmpenho.IsEmpty);
  SqlTemEmpenho.Close;
end;

function TDaoCnsContrato.TemReceitas(AIdContrato: Integer): boolean;
begin
  SqlTemReceita.Close;
  SqlTemReceita.ParamByName('ID_CONTRATO').AsInteger:=AIdContrato;
  SqlTemReceita.Open;
  Result:=(not SqlTemReceita.FieldByName('NR_RECEITAS').IsNull);
  SqlTemReceita.Close;

  if (Result) then
  begin
    raise Exception.Create('Não é possível alterar o contrato pois ele já está vinculado ao(s) lote(s) de receita:'+#13+SqlTemReceita.FieldByName('NR_RECEITAS').AsString);
  end;
end;


function TDaoCnsContrato.TemLancamentos(AIdOrgao: Integer; ANumero: string; AAno: Integer): Boolean;
begin
  SqlTemLancamento.Close;
  SqlTemLancamento.ParamByName('ID_ORGAO').AsInteger := AIdOrgao;
  SqlTemLancamento.ParamByName('NR_CONTRATO').AsString := ANumero;
  SqlTemLancamento.ParamByName('ANO_CONTRATO').AsInteger:= AAno;
  SqlTemLancamento.Open;
  Result:=(not SqlTemLancamento.IsEmpty);
  SqlTemLancamento.Close;

  if (Result) then
  begin
    raise Exception.Create('Não é possível alterar o contrato pois ele já está vinculado à lançamentos no CONT');
  end;
end;

procedure TDaoCnsContrato.DspContratanteBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  if (not SqlContratante.Active) then
  begin
    if (CmtContratante = '') then
    begin
      CmtContratante := SqlContratante.CommandText;
    end;
    SqlContratante.CommandText := DataSetGerenciador.InserirClausulaWhereNaSqlText(CmtContratante, OwnerData);
    SqlContratante.Params.AssignValues(DspContratante.Params);
  end;
end;

procedure TDaoCnsContrato.DspRelacaoContratoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if (not SqlRelacaoContrato.Active) then
  begin
    if (CmtRelacaoContrato = '') then
    begin
      CmtRelacaoContrato := SqlRelacaoContrato.CommandText;
    end;
    SqlRelacaoContrato.CommandText := StringReplace(CmtRelacaoContrato, '/*FILTRO*/', OwnerData, []);
    SqlRelacaoContrato.Params.AssignValues(DspRelacaoContrato.Params);
  end;
end;

procedure TDaoCnsContrato.DspRelacaoContratoGetData(Sender: TObject; DataSet: TCustomClientDataSet);
begin
  inherited;
  DataSetGerenciador.ReplaceTabMemoField(DataSet);
end;

function TDaoCnsContrato.RetornaInfoContrato(AIdProcessoCompra, AIdFornecedor: Integer; var AIdContrato, AAnoContrato: Integer; var ANrContrato: string): Boolean;
begin
  SqlRetornaInfoContrato.Close;
  SqlRetornaInfoContrato.ParamByName('ID_PROCESSO_COMPRA').AsInteger := AIdProcessoCompra;
  SqlRetornaInfoContrato.ParamByName('ID_FORNECEDOR').AsInteger := AIdFornecedor;
  SqlRetornaInfoContrato.Open;
  Result := (not SqlRetornaInfoContrato.IsEmpty);
  if (Result) then
  begin
    AIdContrato := SqlRetornaInfoContrato.FieldByName('ID_CONTRATO').AsInteger;
    AAnoContrato := SqlRetornaInfoContrato.FieldByName('ANO_CONTRATO').AsInteger;
    ANrContrato := SqlRetornaInfoContrato.FieldByName('NR_CONTRATO').AsString;
  end;
  SqlRetornaInfoContrato.Close;
end;

procedure TDaoCnsContrato.DspContratadoBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  if (not SqlContratado.Active) then
  begin
    if (CmtContratado = '') then
    begin
      CmtContratado := SqlContratado.CommandText;
    end;
    SqlContratado.CommandText := DataSetGerenciador.InserirClausulaWhereNaSqlText(CmtContratado, OwnerData);
    SqlContratado.Params.AssignValues(DspContratado.Params);
  end;
end;

end.
