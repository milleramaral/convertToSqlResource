unit uDaoCnsRastreamentoSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDaoPoolConexao, FMTBcd, DB, SqlExpr, Provider;

type
  TDaoCnsRastreamentoSC = class(TDaoPoolConexao)
    DspEtapaQtd: TDataSetProvider;
    SqlEtapaQtd: TSQLDataSet;
    DspSolicitado: TDataSetProvider;
    SqlSolicitado: TSQLDataSet;
    DspLiberado: TDataSetProvider;
    SqlLiberado: TSQLDataSet;
    DspAprovado: TDataSetProvider;
    SqlAprovado: TSQLDataSet;
    DspAprovFin: TDataSetProvider;
    SqlAprovFin: TSQLDataSet;
    DspAprovFinReprov: TDataSetProvider;
    SqlAprovFinReprov: TSQLDataSet;
    DspReprovado: TDataSetProvider;
    SqlReprovado: TSQLDataSet;
    DspDefDotLiberado: TDataSetProvider;
    SqlDefDotLiberado: TSQLDataSet;
    DspDefDotNaoLiberado: TDataSetProvider;
    SqlDefDotNaoLiberado: TSQLDataSet;
    DspDefComprador: TDataSetProvider;
    SqlDefComprador: TSQLDataSet;
    DspRecusado: TDataSetProvider;
    SqlRecusado: TSQLDataSet;
    DspEmProcesso: TDataSetProvider;
    SqlEmProcesso: TSQLDataSet;
    DspRatificado: TDataSetProvider;
    SqlRatificado: TSQLDataSet;
    DspAnulado: TDataSetProvider;
    SqlAnulado: TSQLDataSet;
    DspSESolicitado: TDataSetProvider;
    SqlSESolicitado: TSQLDataSet;
    DspSELiberado: TDataSetProvider;
    SqlSELiberado: TSQLDataSet;
    DspSEEmpenhado: TDataSetProvider;
    SqlSEEmpenhado: TSQLDataSet;
    DspAutorizacao: TDataSetProvider;
    SqlAutorizacao: TSQLDataSet;
    DspLiberacaoNF: TDataSetProvider;
    SqlLiberacaoNF: TSQLDataSet;
    DspAutCompLiberado: TDataSetProvider;
    SqlAutCompLiberado: TSQLDataSet;
    DspAutCompNaoLiberado: TDataSetProvider;
    SqlAutCompNaoLiberado: TSQLDataSet;
    DspRecusadoDefComp: TDataSetProvider;
    SqlRecusadoDefComp: TSQLDataSet;
    DspHistoricoFluxo: TDataSetProvider;
    SqlHistoricoFluxo: TSQLDataSet;
    DspHistoricoFluxoItem: TDataSetProvider;
    SqlHistoricoFluxoItem: TSQLDataSet;
    DspRessuprimento: TDataSetProvider;
    SqlRessuprimento: TSQLDataSet;
    DspSEESolicitado: TDataSetProvider;
    SqlSEESolicitado: TSQLDataSet;
    DspSEELiberado: TDataSetProvider;
    SqlSEELiberado: TSQLDataSet;
    DspSEEEstornado: TDataSetProvider;
    SqlSEEEstornado: TSQLDataSet;
    DspSECancelado: TDataSetProvider;
    SqlSECancelado: TSQLDataSet;
    procedure DspRessuprimentoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
  private
    CmtRessuprimento: string;
  end;

implementation

{$R *.dfm}

procedure TDaoCnsRastreamentoSC.DspRessuprimentoBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if (CmtRessuprimento = '') then
  begin
    CmtRessuprimento := SqlRessuprimento.CommandText;
  end;
  SqlRessuprimento.CommandText := StringReplace(CmtRessuprimento, '/*FILTRO_PERSONALIZADO*/', OwnerData, []);
  SqlRessuprimento.Params.AssignValues(DspRessuprimento.Params);
end;

end.
