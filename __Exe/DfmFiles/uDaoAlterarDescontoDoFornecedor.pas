unit uDaoAlterarDescontoDoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDaoPoolConexao, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDaoAlterarDescontoDoFornecedor = class(TDaoPoolConexao)
    DspProcessoCompra: TDataSetProvider;
    SqlProcessoCompra: TSQLDataSet;
    SqlProcessoCompraID_PROCESSO_COMPRA: TIntegerField;
    SqlProcessoCompraID_CONTRATO: TIntegerField;
    SqlProcessoCompraID_FORNECEDOR: TIntegerField;
    DtsProcessoCompra: TDataSource;
    SqlCatalogos: TSQLDataSet;
    SqlCatalogosID_RATIF_ITEM: TIntegerField;
    SqlCatalogosORDEM: TSmallintField;
    SqlCatalogosDESCONTO: TFloatField;
    SqlCatalogosDESCONTO_ATUAL: TFloatField;
    SqlCatalogosNR_CONTRATO: TStringField;
    SqlCatalogosANO_CONTRATO: TSmallintField;
    SqlCatalogosNOME_RAZAO: TStringField;
    SqlCatalogosCD_CATALOGO: TIntegerField;
    SqlCatalogosDS_CATALOGO: TStringField;
    SqlCriarHistoricoDoItem: TSQLDataSet;
    procedure DspProcessoCompraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure DspProcessoCompraAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uCustomClientDataSetHelper, uDataSetHelper;

{$R *.dfm}

procedure TDaoAlterarDescontoDoFornecedor.DspProcessoCompraAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  IdRatifiItem: Integer;
  IdUsuario: Integer;
  IdContratoAditivo: Integer;
begin
  inherited;
  if SourceDS = SqlCatalogos then
  begin
    IdRatifiItem      := DeltaDS.FieldValue('ID_RATIF_ITEM');
    IdUsuario         := DeltaDS.GetOptionalParam('ID_USUARIO');
    IdContratoAditivo := DeltaDS.GetOptionalParam('ID_CONTRATO_ADITIVO');

    SqlCriarHistoricoDoItem.SQLConnection := SqlProcessoCompra.SQLConnection;
    SqlCriarHistoricoDoItem.ParamByName('ID_RATIF_ITEM').AsInteger := IdRatifiItem;
    SqlCriarHistoricoDoItem.ParamByName('ID_USUARIO').AsInteger := IdUsuario;
    if IdContratoAditivo = 0 then SqlCriarHistoricoDoItem.ParamByName('ID_CONTRATO_ADITIVO').Clear
    else SqlCriarHistoricoDoItem.ParamByName('ID_CONTRATO_ADITIVO').AsInteger := IdContratoAditivo;
    SqlCriarHistoricoDoItem.ExecSQL;
  end;
end;

procedure TDaoAlterarDescontoDoFornecedor.DspProcessoCompraBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  inherited;
  if (SourceDS = SqlProcessoCompra) then Applied := True;
end;

end.
