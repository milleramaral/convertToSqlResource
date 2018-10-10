inherited DaoAlterarDescontoDoFornecedor: TDaoAlterarDescontoDoFornecedor
  OldCreateOrder = True
  Height = 417
  Width = 637
  object DspProcessoCompra: TDataSetProvider
    DataSet = SqlProcessoCompra
    AfterUpdateRecord = DspProcessoCompraAfterUpdateRecord
    BeforeUpdateRecord = DspProcessoCompraBeforeUpdateRecord
    Left = 64
    Top = 24
  end
  object SqlProcessoCompra: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT'#13#10'  A.ID_PROCESSO_COMPRA,'#13#10'  CAST(:ID_CONTRATO AS INTEGER)' +
      ' AS ID_CONTRATO,'#13#10'  CAST(:ID_FORNECEDOR AS INTEGER) AS ID_FORNEC' +
      'EDOR'#13#10'FROM'#13#10'  SUP_PROCESSO_COMPRA A'#13#10'WHERE'#13#10'  A.ID_PROCESSO_COMP' +
      'RA = :ID_PROCESSO_COMPRA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 64
    Top = 75
    object SqlProcessoCompraID_PROCESSO_COMPRA: TIntegerField
      FieldName = 'ID_PROCESSO_COMPRA'
    end
    object SqlProcessoCompraID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
    end
    object SqlProcessoCompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
  end
  object DtsProcessoCompra: TDataSource
    DataSet = SqlProcessoCompra
    Left = 184
    Top = 24
  end
  object SqlCatalogos: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT A.ID_RATIF_ITEM,'#13#10'       A.ID_CONTRATO,'#13#10'       A.ID_FORN' +
      'ECEDOR,'#13#10'       A.ORDEM,'#13#10'       CAST(NULL AS DOUBLE PRECISION) ' +
      'AS DESCONTO,'#13#10'       A.DESCONTO AS DESCONTO_ATUAL,'#13#10'       I.NR_' +
      'CONTRATO,'#13#10'       I.ANO_CONTRATO,'#13#10'       M.NOME_RAZAO,'#13#10'       ' +
      'N.CD_CATALOGO,'#13#10'       N.DS_CATALOGO'#13#10'  FROM SUP_RATIF_ITEM A'#13#10' ' +
      '      LEFT JOIN SUP_CATALOGO   N ON N.ID_CATALOGO    = A.ID_CATA' +
      'LOGO'#13#10'       LEFT JOIN SUP_CONTRATO   I ON I.ID_CONTRATO    = A.' +
      'ID_CONTRATO'#13#10'       LEFT JOIN SUP_FORNECEDOR J ON J.ID_FORNECEDO' +
      'R  = A.ID_FORNECEDOR'#13#10'       LEFT JOIN SIS_PESSOA     M ON M.ID_' +
      'PESSOA      = J.ID_CREDOR'#13#10' WHERE A.ID_PROCESSO_COMPRA = :ID_PRO' +
      'CESSO_COMPRA'#13#10'   AND ( A.ID_CONTRATO = :ID_CONTRATO OR A.ID_FORN' +
      'ECEDOR = :ID_FORNECEDOR )'
    DbxCommandType = 'Dbx.SQL'
    DataSource = DtsProcessoCompra
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_FORNECEDOR'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 184
    Top = 75
    object SqlCatalogosID_RATIF_ITEM: TIntegerField
      FieldName = 'ID_RATIF_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlCatalogosORDEM: TSmallintField
      FieldName = 'ORDEM'
      ProviderFlags = []
      Required = True
    end
    object SqlCatalogosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object SqlCatalogosDESCONTO_ATUAL: TFloatField
      FieldName = 'DESCONTO_ATUAL'
      ProviderFlags = []
    end
    object SqlCatalogosNR_CONTRATO: TStringField
      FieldName = 'NR_CONTRATO'
      ProviderFlags = []
      Size = 50
    end
    object SqlCatalogosANO_CONTRATO: TSmallintField
      FieldName = 'ANO_CONTRATO'
      ProviderFlags = []
    end
    object SqlCatalogosNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      ProviderFlags = []
      Size = 100
    end
    object SqlCatalogosCD_CATALOGO: TIntegerField
      FieldName = 'CD_CATALOGO'
      ProviderFlags = []
    end
    object SqlCatalogosDS_CATALOGO: TStringField
      FieldName = 'DS_CATALOGO'
      ProviderFlags = []
      Size = 150
    end
  end
  object SqlCriarHistoricoDoItem: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'INSERT INTO SUP_RATIF_ITEM_HIST ('#13#10'    ID_RATIF_ITEM_HIST,'#13#10'    ' +
      'ID_RATIF_ITEM,'#13#10'    ID_USUARIO,'#13#10'    ID_CONTRATO_ADITIVO,'#13#10'    D' +
      'T_RATIFICACAO,'#13#10'    QTD,'#13#10'    VL_UNITARIO,'#13#10'    VL_TOTAL,'#13#10'    E' +
      'SPECIFICACAO,'#13#10'    MARCA,'#13#10'    GARANTIA,'#13#10'    DESCONTO'#13#10'  )'#13#10'  S' +
      'ELECT'#13#10'    GEN_ID(SUP_RATIF_ITEM_HIST_G01, 1),'#13#10'    :ID_RATIF_IT' +
      'EM,'#13#10'    :ID_USUARIO,'#13#10'    :ID_CONTRATO_ADITIVO,'#13#10'    CAST('#39'NOW'#39 +
      ' AS TIMESTAMP),'#13#10'    A2.QTD,'#13#10'    A2.VL_UNITARIO,'#13#10'    A2.VL_TOT' +
      'AL,'#13#10'    A2.ESPECIFICACAO,'#13#10'    A2.MARCA,'#13#10'    A2.GARANTIA,'#13#10'   ' +
      ' A2.DESCONTO'#13#10'  FROM'#13#10'    SUP_RATIF_ITEM A2'#13#10'  WHERE'#13#10'    A2.ID_' +
      'RATIF_ITEM = :ID_RATIF_ITEM;'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CONTRATO_ADITIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_RATIF_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 352
    Top = 83
  end
end
