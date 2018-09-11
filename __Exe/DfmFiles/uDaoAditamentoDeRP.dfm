inherited DaoAditamentoDeRP: TDaoAditamentoDeRP
  OldCreateOrder = True
  Height = 199
  Width = 642
  object DspProcessoCompra: TDataSetProvider
    DataSet = SqlProcessoCompra
    OnUpdateData = DspProcessoCompraUpdateData
    BeforeUpdateRecord = DspProcessoCompraBeforeUpdateRecord
    OnGetTableName = DspProcessoCompraGetTableName
    Left = 64
    Top = 24
  end
  object SqlAditamentoRPQtd: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT'#13#10'  B.QTD AS QTD_ATUAL,'#13#10'  B.VL_TOTAL AS VL_ATUAL,'#13#10#13#10'  M.' +
      'QTD_EMPENHADA,'#13#10'  M.VL_EMPENHADO,'#13#10#13#10'  B.ID_PROC_COMPRA_ITEM,'#13#10' ' +
      ' B.ID_RATIF_ITEM,'#13#10'  H.ID_PROCESSO_COMPRA, '#13#10'  H.CP_ANO,'#13#10'  B.OR' +
      'DEM,'#13#10'  B.QUANTITATIVO,'#13#10'  B.UN_SERVICO,'#13#10'  C.CD_MATERIAL,'#13#10'  C.' +
      'DS_MATERIAL,'#13#10'  C.DS_COMPLETA,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIA' +
      'L,'#13#10'  D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO AS CD_GRUPO,'#13#10'  F' +
      '.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,' +
      #13#10'  B.ESPECIFICACAO,'#13#10'  I.CD_CATALOGO,'#13#10'  I.DS_CATALOGO,'#13#10'  L.QT' +
      'D AS QTD_INICIAL,'#13#10'  L.VL_TOTAL AS VL_INICIAL,'#13#10#13#10'  CAST(NULL AS' +
      ' DOUBLE PRECISION) AS QTD_ADITAR,'#13#10'  CAST(NULL AS DOUBLE PRECISI' +
      'ON)  AS VL_ADITAR'#13#10'FROM'#13#10'  SUP_RATIF_ITEM B'#13#10'  LEFT JOIN SUP_PRO' +
      'CESSO_COMPRA H ON H.ID_PROCESSO_COMPRA = B.ID_PROCESSO_COMPRA'#13#10' ' +
      ' LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LE' +
      'FT JOIN SUP_GRUPO D ON C.ID_GRUPO = D.ID_GRUPO'#13#10'  LEFT JOIN SUP_' +
      'GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SE' +
      'RVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN ' +
      'SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_P' +
      'AI'#13#10'  LEFT JOIN SUP_CATALOGO I ON I.ID_CATALOGO = B.ID_CATALOGO'#13 +
      #10'  LEFT JOIN ('#13#10'    SELECT '#13#10'      A1.ID_RATIF_ITEM,'#13#10'      A1.Q' +
      'TD,'#13#10'      A1.VL_TOTAL'#13#10'    FROM'#13#10'      SUP_RATIF_ITEM_HIST A1'#13#10 +
      '    WHERE A1.INICIAL = 1'#13#10'    ORDER BY'#13#10'      A1.ID_RATIF_ITEM_H' +
      'IST'#13#10'  ) AS L ON L.ID_RATIF_ITEM = B.ID_RATIF_ITEM'#13#10#13#10'  LEFT JOI' +
      'N ('#13#10'    SELECT'#13#10'      A2.ID_RATIF_ITEM,'#13#10'      COALESCE('#13#10'     ' +
      ' SUM(COALESCE(A2.QTD_SOLICITACAO_EMPENHO, 0)) +'#13#10'      SUM(COALE' +
      'SCE(A2.QTD_EMPENHADO, 0))'#13#10'      , 0) AS QTD_EMPENHADA,'#13#10#13#10'     ' +
      ' COALESCE('#13#10'        SUM(COALESCE(A2.VL_SOLICITACAO_EMPENHO, 0)) ' +
      '+'#13#10'        SUM(COALESCE(A2.VL_EMPENHADO, 0))'#13#10'      , 0) AS VL_E' +
      'MPENHADO'#13#10'    FROM'#13#10'      SUP_RATIF_FICHA A2'#13#10'    GROUP BY'#13#10'    ' +
      '  A2.ID_RATIF_ITEM'#13#10'  ) AS M ON M.ID_RATIF_ITEM = B.ID_RATIF_ITE' +
      'M'#13#10'WHERE'#13#10'  B.ID_PROCESSO_COMPRA = :ID_PROCESSO_COMPRA'#13#10'  AND (0' +
      ' = :ID_CONTRATO OR B.ID_CONTRATO = :ID_CONTRATO)'#13#10'  AND B.ID_FOR' +
      'NECEDOR = :ID_FORNECEDOR'
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
    object SqlAditamentoRPQtdID_RATIF_ITEM: TIntegerField
      FieldName = 'ID_RATIF_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlAditamentoRPQtdID_PROC_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_PROC_COMPRA_ITEM'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdID_PROCESSO_COMPRA: TIntegerField
      FieldName = 'ID_PROCESSO_COMPRA'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCP_ANO: TSmallintField
      FieldName = 'CP_ANO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdORDEM: TSmallintField
      FieldName = 'ORDEM'
      ProviderFlags = []
      Required = True
    end
    object SqlAditamentoRPQtdQUANTITATIVO: TSmallintField
      FieldName = 'QUANTITATIVO'
      ProviderFlags = []
      Required = True
    end
    object SqlAditamentoRPQtdUN_SERVICO: TStringField
      FieldName = 'UN_SERVICO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCD_MATERIAL: TIntegerField
      FieldName = 'CD_MATERIAL'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdDS_MATERIAL: TStringField
      FieldName = 'DS_MATERIAL'
      ProviderFlags = []
      Size = 120
    end
    object SqlAditamentoRPQtdDS_COMPLETA: TStringField
      FieldName = 'DS_COMPLETA'
      ProviderFlags = []
      Size = 2000
    end
    object SqlAditamentoRPQtdUN_MATERIAL: TStringField
      FieldName = 'UN_MATERIAL'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object SqlAditamentoRPQtdTP_MATERIAL: TSmallintField
      FieldName = 'TP_MATERIAL'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCD_SUBGRUPO: TIntegerField
      FieldName = 'CD_SUBGRUPO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCD_SUBGRUPO_SERVICO: TIntegerField
      FieldName = 'CD_SUBGRUPO_SERVICO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdCD_GRUPO_SERVICO: TIntegerField
      FieldName = 'CD_GRUPO_SERVICO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdESPECIFICACAO: TMemoField
      FieldName = 'ESPECIFICACAO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = -1
    end
    object SqlAditamentoRPQtdCD_CATALOGO: TIntegerField
      FieldName = 'CD_CATALOGO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdDS_CATALOGO: TStringField
      FieldName = 'DS_CATALOGO'
      ProviderFlags = []
      Size = 150
    end
    object SqlAditamentoRPQtdQTD_INICIAL: TFloatField
      FieldName = 'QTD_INICIAL'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdVL_INICIAL: TFloatField
      FieldName = 'VL_INICIAL'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdQTD_ATUAL: TFloatField
      FieldName = 'QTD_ATUAL'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdVL_ATUAL: TFloatField
      FieldName = 'VL_ATUAL'
      ProviderFlags = []
      Required = True
    end
    object SqlAditamentoRPQtdQTD_EMPENHADA: TFloatField
      FieldName = 'QTD_EMPENHADA'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdVL_EMPENHADO: TFloatField
      FieldName = 'VL_EMPENHADO'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdQTD_ADITAR: TFloatField
      FieldName = 'QTD_ADITAR'
      ProviderFlags = []
    end
    object SqlAditamentoRPQtdVL_ADITAR: TFloatField
      FieldName = 'VL_ADITAR'
      ProviderFlags = []
    end
  end
  object SqlAditarRPQuantidadeValor: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      '/* SqlAditarRPQuantidadeValor */'#13#10#13#10'EXECUTE BLOCK'#13#10'AS'#13#10'  DECLARE' +
      ' VARIABLE P_ID_USUARIO INTEGER;'#13#10'  DECLARE VARIABLE P_ID_RATIF_I' +
      'TEM INTEGER;'#13#10'  DECLARE VARIABLE P_ID_CONTRATO_ADITIVO INTEGER;'#13 +
      #10'  DECLARE VARIABLE P_QTD_ADITAR DOUBLE PRECISION;'#13#10'  DECLARE VA' +
      'RIABLE P_VL_ADITAR DOUBLE PRECISION;'#13#10#13#10'  DECLARE VARIABLE QUANT' +
      'ITATIVO SMALLINT;'#13#10'  DECLARE VARIABLE QTD DOUBLE PRECISION;'#13#10'  D' +
      'ECLARE VARIABLE VL_TOTAL DOUBLE PRECISION;'#13#10'  DECLARE VARIABLE I' +
      'D_RATIF_ITEM_HIST INTEGER;'#13#10'BEGIN'#13#10'  SELECT'#13#10'    A.QUANTITATIVO,' +
      #13#10'    A.QTD,'#13#10'    A.VL_TOTAL,'#13#10'    (SELECT FIRST 1 A5.ID_RATIF_I' +
      'TEM_HIST FROM SUP_RATIF_ITEM_HIST A5 WHERE A5.ID_RATIF_ITEM = :P' +
      '_ID_RATIF_ITEM ORDER BY A5.ID_RATIF_ITEM_HIST DESC)'#13#10'  FROM'#13#10'   ' +
      ' SUP_RATIF_ITEM A'#13#10'  WHERE'#13#10'    A.ID_RATIF_ITEM = :P_ID_RATIF_IT' +
      'EM'#13#10'  INTO'#13#10'    :QUANTITATIVO,'#13#10'    :QTD,'#13#10'    :VL_TOTAL,'#13#10'    :' +
      'ID_RATIF_ITEM_HIST;'#13#10#13#10'  IF (:QUANTITATIVO = 0) THEN'#13#10'  BEGIN'#13#10' ' +
      '   UPDATE'#13#10'      SUP_RATIF_ITEM A1'#13#10'    SET'#13#10'      A1.VL_TOTAL =' +
      ' A1.VL_TOTAL + :P_VL_ADITAR'#13#10'    WHERE'#13#10'      A1.ID_RATIF_ITEM =' +
      ' :P_ID_RATIF_ITEM;'#13#10'  END'#13#10'  ELSE'#13#10'  BEGIN'#13#10'    UPDATE'#13#10'      SU' +
      'P_RATIF_ITEM A1'#13#10'    SET'#13#10'      A1.QTD = :QTD + :P_QTD_ADITAR,'#13#10 +
      '      A1.VL_TOTAL = UDF_ROUNDDEC(( :QTD + :P_QTD_ADITAR) * A1.VL' +
      '_UNITARIO, 2)'#13#10'    WHERE'#13#10'      A1.ID_RATIF_ITEM = :P_ID_RATIF_I' +
      'TEM;'#13#10'  END'#13#10#13#10'  INSERT INTO SUP_RATIF_ITEM_HIST ('#13#10'    ID_RATIF' +
      '_ITEM_HIST,'#13#10'    ID_RATIF_ITEM,'#13#10'    ID_USUARIO,'#13#10'    ID_CONTRAT' +
      'O_ADITIVO,'#13#10'    DT_RATIFICACAO,'#13#10'    QTD,'#13#10'    VL_TOTAL,'#13#10'    ES' +
      'PECIFICACAO,'#13#10'    MARCA,'#13#10'    GARANTIA)'#13#10'  SELECT'#13#10'    GEN_ID(SU' +
      'P_RATIF_ITEM_HIST_G01, 1),'#13#10'    :P_ID_RATIF_ITEM,'#13#10'    :P_ID_USU' +
      'ARIO,'#13#10'    :P_ID_CONTRATO_ADITIVO,'#13#10'    CAST('#39'NOW'#39' AS TIMESTAMP)' +
      ','#13#10'    A2.QTD,'#13#10'    A2.VL_TOTAL,'#13#10'    A2.ESPECIFICACAO,'#13#10'    A2.' +
      'MARCA,'#13#10'    A2.GARANTIA'#13#10'  FROM'#13#10'    SUP_RATIF_ITEM A2'#13#10'  WHERE'#13 +
      #10'    A2.ID_RATIF_ITEM = :P_ID_RATIF_ITEM;'#13#10'END'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QUANTITATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VL_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_RATIF_ITEM_HIST'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QUANTITATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_VL_ADITAR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_QTD_ADITAR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_QTD_ADITAR'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_CONTRATO_ADITIVO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_ID_RATIF_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 536
    Top = 27
  end
  object SqlRegPrecoUnidadeAdm: TSQLDataSet
    SchemaName = 'SYSDBA'
    OnCalcFields = SqlRegPrecoUnidadeAdmCalcFields
    CommandText = 
      'SELECT'#13#10'  A.ID_PC_RP_UNIDADE_ADM,'#13#10'  A.ID_UNIDADE_ADM,'#13#10'  A.ID_R' +
      'ATIF_ITEM,'#13#10'  C.CD_UNIDADE_ADM,'#13#10'  C.DS_UNIDADE_ADM,'#13#10'  B.ID_PRO' +
      'CESSO_COMPRA,'#13#10'  B.QUANTITATIVO,'#13#10'  D.QTD AS QTD_INICIAL,'#13#10'  D.V' +
      'L_TOTAL AS VL_TOTAL_INICIAL,'#13#10'  A.QTD,'#13#10'  A.VL_TOTAL,'#13#10'  UDF_ROU' +
      'NDDEC('#13#10'    CASE'#13#10'      WHEN B.QUANTITATIVO = 1'#13#10'      THEN COAL' +
      'ESCE(A.QTD, 0) - COALESCE(A.QTD_SC_RETIRADA, 0) -'#13#10'           CO' +
      'ALESCE((SELECT SUM(COALESCE(A1.QTD_SOLICITACAO_EMPENHO, 0) +'#13#10'  ' +
      '                              COALESCE(A1.QTD_EMPENHADO, 0) )'#13#10' ' +
      '                      FROM SUP_RATIF_FICHA A1'#13#10'                 ' +
      '           LEFT JOIN SUP_RATIF_FICHA_DADOS   B1 ON B1.ID_RATIF_F' +
      'ICHA_DADOS     = A1.ID_RATIF_FICHA_DADOS'#13#10'                      ' +
      '      LEFT JOIN SUP_COMPRA_ITEM         C1 ON C1.ID_COMPRA_ITEM ' +
      '          = B1.ID_COMPRA_ITEM'#13#10'                            LEFT ' +
      'JOIN SUP_SOLICITACAO_COMPRA  D1 ON D1.ID_SOLICITACAO_COMPRA    =' +
      ' C1.ID_SOLICITACAO_COMPRA'#13#10'                            LEFT JOIN' +
      ' SUP_CENTRO_CONSUMO      E1 ON E1.ID_CENTRO_CONSUMO        = D1.' +
      'ID_CENTRO_CONSUMO'#13#10'                      WHERE A1.ID_RATIF_ITEM ' +
      ' = A.ID_RATIF_ITEM'#13#10'                        AND E1.ID_UNIDADE_AD' +
      'M = A.ID_UNIDADE_ADM ), 0)'#13#10#13#10'      ELSE COALESCE(A.VL_TOTAL, 0)' +
      ' - COALESCE(A.VL_TOTAL_SC_RETIRADA, 0) -'#13#10'           COALESCE((S' +
      'ELECT SUM(COALESCE(A1.VL_SOLICITACAO_EMPENHO, 0) +'#13#10'            ' +
      '                    COALESCE(A1.VL_EMPENHADO, 0) )'#13#10'            ' +
      '           FROM SUP_RATIF_FICHA A1'#13#10'                            ' +
      'LEFT JOIN SUP_RATIF_FICHA_DADOS   B1 ON B1.ID_RATIF_FICHA_DADOS ' +
      '    = A1.ID_RATIF_FICHA_DADOS'#13#10'                            LEFT ' +
      'JOIN SUP_COMPRA_ITEM         C1 ON C1.ID_COMPRA_ITEM           =' +
      ' B1.ID_COMPRA_ITEM'#13#10'                            LEFT JOIN SUP_SO' +
      'LICITACAO_COMPRA  D1 ON D1.ID_SOLICITACAO_COMPRA    = C1.ID_SOLI' +
      'CITACAO_COMPRA'#13#10'                            LEFT JOIN SUP_CENTRO' +
      '_CONSUMO      E1 ON E1.ID_CENTRO_CONSUMO        = D1.ID_CENTRO_C' +
      'ONSUMO'#13#10'                      WHERE A1.ID_RATIF_ITEM  = A.ID_RAT' +
      'IF_ITEM'#13#10'                        AND E1.ID_UNIDADE_ADM = A.ID_UN' +
      'IDADE_ADM ), 0)'#13#10'    END'#13#10'  , 4) AS SALDO_DA_UNIDADE'#13#10'FROM'#13#10'  SU' +
      'P_PC_RP_UNIDADE_ADM A'#13#10'  INNER JOIN SUP_RATIF_ITEM B ON B.ID_RAT' +
      'IF_ITEM = A.ID_RATIF_ITEM'#13#10#13#10'  LEFT JOIN SUP_UNIDADE_ADM C ON C.' +
      'ID_UNIDADE_ADM = A.ID_UNIDADE_ADM'#13#10'  LEFT JOIN SUP_PC_RP_UNID_AD' +
      'M_HIST D ON D.ID_PC_RP_UNIDADE_ADM = A.ID_PC_RP_UNIDADE_ADM AND ' +
      'D.INICIAL = 1'#13#10'WHERE'#13#10'  B.ID_PROCESSO_COMPRA = :ID_PROCESSO_COMP' +
      'RA'#13#10'  AND (0 = :ID_CONTRATO OR B.ID_CONTRATO = :ID_CONTRATO)'#13#10'  ' +
      'AND B.ID_FORNECEDOR = :ID_FORNECEDOR'
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
    Top = 128
    object SqlRegPrecoUnidadeAdmID_PC_RP_UNIDADE_ADM: TIntegerField
      FieldName = 'ID_PC_RP_UNIDADE_ADM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SqlRegPrecoUnidadeAdmID_UNIDADE_ADM: TIntegerField
      FieldName = 'ID_UNIDADE_ADM'
      ProviderFlags = []
      Required = True
    end
    object SqlRegPrecoUnidadeAdmCD_UNIDADE_ADM: TIntegerField
      FieldName = 'CD_UNIDADE_ADM'
      ProviderFlags = []
    end
    object SqlRegPrecoUnidadeAdmDS_UNIDADE_ADM: TStringField
      FieldName = 'DS_UNIDADE_ADM'
      ProviderFlags = []
      Size = 120
    end
    object SqlRegPrecoUnidadeAdmID_PROCESSO_COMPRA: TIntegerField
      FieldName = 'ID_PROCESSO_COMPRA'
      ProviderFlags = []
      Required = True
    end
    object SqlRegPrecoUnidadeAdmQUANTITATIVO: TSmallintField
      FieldName = 'QUANTITATIVO'
      ProviderFlags = []
    end
    object SqlRegPrecoUnidadeAdmQTD_INICIAL: TFloatField
      FieldName = 'QTD_INICIAL'
      ProviderFlags = []
    end
    object SqlRegPrecoUnidadeAdmVL_TOTAL_INICIAL: TFloatField
      FieldName = 'VL_TOTAL_INICIAL'
      ProviderFlags = []
    end
    object SqlRegPrecoUnidadeAdmQTD: TFloatField
      FieldName = 'QTD'
    end
    object SqlRegPrecoUnidadeAdmVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object SqlRegPrecoUnidadeAdmSALDO_DA_UNIDADE: TFloatField
      FieldName = 'SALDO_DA_UNIDADE'
      ProviderFlags = []
    end
    object SqlRegPrecoUnidadeAdmUTILIZADO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'UTILIZADO'
      ProviderFlags = []
      Calculated = True
    end
    object SqlRegPrecoUnidadeAdmID_RATIF_ITEM: TIntegerField
      FieldName = 'ID_RATIF_ITEM'
      ProviderFlags = []
    end
  end
  object DtsProcessoCompra: TDataSource
    DataSet = SqlProcessoCompra
    Left = 184
    Top = 24
  end
  object SqlProcessoCompra: TSQLDataSet
    SchemaName = 'SYSDBA'
    CommandText = 
      'SELECT'#13#10'  A.ID_PROCESSO_COMPRA,'#13#10'  CAST(:ID_CONTRATO AS INTEGER)' +
      ' AS ID_CONTRATO,'#13#10'  CAST(:ID_FORNECEDOR AS INTEGER) AS ID_FORNEC' +
      'EDOR'#13#10'FROM'#13#10'  SUP_PROCESSO_COMPRA A'#13#10'WHERE'#13#10'  A.ID_PROCESSO_COMP' +
      'RA = :ID_PROCESSO_COMPRA'
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
end
