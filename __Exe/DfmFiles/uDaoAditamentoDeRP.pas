unit uDaoAditamentoDeRP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDaoPoolConexao, FMTBcd, DB, SqlExpr, Provider, DBClient,
  uDaoCnsProcessoCompra, uDaoDefinirUnidadeAdmDosItensRatificados;

type
  TDaoAditamentoDeRP = class(TDaoPoolConexao)
    DspProcessoCompra: TDataSetProvider;
    SqlAditamentoRPQtd: TSQLDataSet;
    SqlAditamentoRPQtdID_RATIF_ITEM: TIntegerField;
    SqlAditamentoRPQtdORDEM: TSmallintField;
    SqlAditamentoRPQtdQUANTITATIVO: TSmallintField;
    SqlAditamentoRPQtdUN_SERVICO: TStringField;
    SqlAditamentoRPQtdCD_MATERIAL: TIntegerField;
    SqlAditamentoRPQtdDS_MATERIAL: TStringField;
    SqlAditamentoRPQtdDS_COMPLETA: TStringField;
    SqlAditamentoRPQtdUN_MATERIAL: TStringField;
    SqlAditamentoRPQtdTP_MATERIAL: TSmallintField;
    SqlAditamentoRPQtdCD_SUBGRUPO: TIntegerField;
    SqlAditamentoRPQtdCD_GRUPO: TIntegerField;
    SqlAditamentoRPQtdCD_SUBGRUPO_SERVICO: TIntegerField;
    SqlAditamentoRPQtdCD_GRUPO_SERVICO: TIntegerField;
    SqlAditamentoRPQtdESPECIFICACAO: TMemoField;
    SqlAditamentoRPQtdCD_CATALOGO: TIntegerField;
    SqlAditamentoRPQtdDS_CATALOGO: TStringField;
    SqlAditamentoRPQtdQTD_INICIAL: TFloatField;
    SqlAditamentoRPQtdVL_INICIAL: TFloatField;
    SqlAditamentoRPQtdQTD_ATUAL: TFloatField;
    SqlAditamentoRPQtdVL_ATUAL: TFloatField;
    SqlAditamentoRPQtdQTD_EMPENHADA: TFloatField;
    SqlAditamentoRPQtdVL_EMPENHADO: TFloatField;
    SqlAditamentoRPQtdQTD_ADITAR: TFloatField;
    SqlAditamentoRPQtdVL_ADITAR: TFloatField;
    SqlAditarRPQuantidadeValor: TSQLDataSet;
    SqlRegPrecoUnidadeAdm: TSQLDataSet;
    SqlRegPrecoUnidadeAdmID_PC_RP_UNIDADE_ADM: TIntegerField;
    SqlRegPrecoUnidadeAdmID_UNIDADE_ADM: TIntegerField;
    SqlRegPrecoUnidadeAdmCD_UNIDADE_ADM: TIntegerField;
    SqlRegPrecoUnidadeAdmDS_UNIDADE_ADM: TStringField;
    SqlRegPrecoUnidadeAdmQUANTITATIVO: TSmallintField;
    SqlRegPrecoUnidadeAdmQTD_INICIAL: TFloatField;
    SqlRegPrecoUnidadeAdmVL_TOTAL_INICIAL: TFloatField;
    SqlRegPrecoUnidadeAdmQTD: TFloatField;
    SqlRegPrecoUnidadeAdmVL_TOTAL: TFloatField;
    SqlRegPrecoUnidadeAdmSALDO_DA_UNIDADE: TFloatField;
    SqlRegPrecoUnidadeAdmUTILIZADO: TFloatField;
    DtsProcessoCompra: TDataSource;
    SqlAditamentoRPQtdID_PROC_COMPRA_ITEM: TIntegerField;
    SqlAditamentoRPQtdCP_ANO: TSmallintField;
    SqlAditamentoRPQtdID_PROCESSO_COMPRA: TIntegerField;
    SqlRegPrecoUnidadeAdmID_RATIF_ITEM: TIntegerField;
    SqlProcessoCompra: TSQLDataSet;
    SqlProcessoCompraID_PROCESSO_COMPRA: TIntegerField;
    SqlProcessoCompraID_CONTRATO: TIntegerField;
    SqlProcessoCompraID_FORNECEDOR: TIntegerField;
    SqlRegPrecoUnidadeAdmID_PROCESSO_COMPRA: TIntegerField;
    procedure DspProcessoCompraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure SqlRegPrecoUnidadeAdmCalcFields(DataSet: TDataSet);
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DspProcessoCompraGetTableName(Sender: TObject; DataSet: TDataSet; var TableName: String);
    procedure DspProcessoCompraUpdateData(Sender: TObject; DataSet: TCustomClientDataSet);
  private
    DaoDefinirUnidadeAdmDosItensRatificados: TDaoDefinirUnidadeAdmDosItensRatificados;
    procedure AditamentoNoItem(DeltaDS: TCustomClientDataSet);
  end;

implementation

uses
  UteisGeral, ConstSuprimento, ConstGeral, Math, uFrmDebug, uCustomClientDataSetHelper;

{$R *.dfm}

procedure TDaoAditamentoDeRP.DspProcessoCompraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if (SourceDS = SqlProcessoCompra) then
  begin
    Applied := True;
  end
  else if (SourceDS = SqlAditamentoRPQtd) then
  begin
    AditamentoNoItem(DeltaDS);
    Applied := True;
  end
  else if (SourceDS = SqlRegPrecoUnidadeAdm) then
  begin
    DaoDefinirUnidadeAdmDosItensRatificados.ValidarAlteracaoDaUnidadeAdm(DeltaDS);
    DaoDefinirUnidadeAdmDosItensRatificados.InserirHistorico(DeltaDS, SqlProcessoCompra.SQLConnection);
  end;
end;

procedure TDaoAditamentoDeRP.DspProcessoCompraGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
  inherited;
  if (DataSet = SqlRegPrecoUnidadeAdm) then
  begin
    TableName := 'SUP_PC_RP_UNIDADE_ADM';
  end;
end;

procedure TDaoAditamentoDeRP.DspProcessoCompraUpdateData(Sender: TObject; DataSet: TCustomClientDataSet);
begin
  inherited;
  DaoDefinirUnidadeAdmDosItensRatificados.ValidarDistribuicaoNaUnidadeADM(DataSet.FieldByName('ID_PROCESSO_COMPRA').AsInteger, SqlProcessoCompra.SQLConnection);
end;

procedure TDaoAditamentoDeRP.DSServerModuleCreate(Sender: TObject);
begin
  inherited;
  DaoDefinirUnidadeAdmDosItensRatificados := TDaoDefinirUnidadeAdmDosItensRatificados.Create(Self);
end;

procedure TDaoAditamentoDeRP.AditamentoNoItem(DeltaDS: TCustomClientDataSet);
var
  CmtAditarRPQuantidadeValor: string;
begin
  CmtAditarRPQuantidadeValor := SqlAditarRPQuantidadeValor.CommandText;
  FormatSettings.DecimalSeparator := '.';
  try
    SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_ID_USUARIO', TClientDataSet(DeltaDS.DataSetField.DataSet).GetOptionalParam('IdUsuario'), [RfReplaceAll]);
    if (TClientDataSet(DeltaDS.DataSetField.DataSet).GetOptionalParam('IdContratoAditivo') = 0) then
    begin
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_ID_CONTRATO_ADITIVO', 'Null', [RfReplaceAll]);
    end
    else
    begin
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_ID_CONTRATO_ADITIVO', TClientDataSet(DeltaDS.DataSetField.DataSet).GetOptionalParam('IdContratoAditivo'), [RfReplaceAll]);
    end;
    SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_ID_RATIF_ITEM', DataSetGerenciador.GetValorRealDelta(DeltaDS.FieldByName('ID_RATIF_ITEM')), [RfReplaceAll]);
    if (Integer(DataSetGerenciador.GetValorRealDelta(DeltaDS.FieldByName('QUANTITATIVO'))) = Logico.Sim) then
    begin
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_VL_ADITAR', 'Null', [RfReplaceAll]);
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_QTD_ADITAR', FloatToStr(RoundTo(DataSetGerenciador.GetValorRealDelta(DeltaDS.FieldByName('QTD_ADITAR')), CasasDecimaisQtd * -1)), [RfReplaceAll]);
    end
    else
    begin
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_VL_ADITAR', FloatToStr(RoundTo(DataSetGerenciador.GetValorRealDelta(DeltaDS.FieldByName('VL_ADITAR')), -2)), [RfReplaceAll]);
      SqlAditarRPQuantidadeValor.CommandText := StringReplace(SqlAditarRPQuantidadeValor.CommandText, ':P_QTD_ADITAR', 'Null', [RfReplaceAll]);
    end;
    ExecutarSql(SqlAditarRPQuantidadeValor, SqlProcessoCompra.SQLConnection, True);
  finally
    FormatSettings.DecimalSeparator := ',';
    SqlAditarRPQuantidadeValor.CommandText := CmtAditarRPQuantidadeValor;
  end;
end;

procedure TDaoAditamentoDeRP.SqlRegPrecoUnidadeAdmCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (SqlRegPrecoUnidadeAdmQUANTITATIVO.AsInteger = Logico.Sim) then
  begin
    SqlRegPrecoUnidadeAdmUTILIZADO.AsFloat := SqlRegPrecoUnidadeAdmQTD.AsFloat - SqlRegPrecoUnidadeAdmSALDO_DA_UNIDADE.AsFloat;
  end
  else
  begin
    SqlRegPrecoUnidadeAdmUTILIZADO.AsFloat := SqlRegPrecoUnidadeAdmVL_TOTAL.AsFloat - SqlRegPrecoUnidadeAdmSALDO_DA_UNIDADE.AsFloat;
  end;
end;

end.
