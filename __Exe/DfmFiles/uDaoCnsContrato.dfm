inherited DaoCnsContrato: TDaoCnsContrato
  OldCreateOrder = True
  Height = 357
  Width = 822
  object DspContratante: TDataSetProvider
    DataSet = SqlContratante
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    BeforeGetRecords = DspContratanteBeforeGetRecords
    Left = 48
    Top = 24
  end
  object SqlContratante: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText =
      'SELECT'#13#10'  GC.ID_CONTRATO,'#13#10'  GC.NR_CONTRATO,'#13#10'  GC.ANO_CONTRATO,' +
      #13#10'  GC.CONTRATO_N,'#13#10'  GC.CONTRATO_S,'#13#10'  SCP.ID_PROCESSO_COMPRA,'#13 +
      #10'  GC.ID_PESSOA AS ID_CREDOR,'#13#10'  B.NR_PROCESSO_COMPRA,'#13#10'  B.ANO_' +
      'PROCESSO_COMPRA,'#13#10'  B.NR_MODALIDADE,'#13#10'  B.ANO_MODALIDADE,'#13#10'  B.I' +
      'D_TP_AQUISICAO,'#13#10'  B.USA_CATALOGO,'#13#10'  B.OBJETO,'#13#10'  GC.NR_EXPEDIE' +
      'NTE,'#13#10'  GC.ANO_EXPEDIENTE,'#13#10'  GC.COMPLEMENTO_EXPEDIENTE,'#13#10'  GLA.' +
      'DS_TP_CLASSIFICACAO AS DS_TIPO,'#13#10'  GTC.DS_TP_CLASSIFICACAO AS DS' +
      '_SUBTIPO,'#13#10'  J.ID_FORNECEDOR,'#13#10'  C.NOME_RAZAO AS NOME_USR,'#13#10'  D.' +
      'CPF,'#13#10'  E.CNPJ,'#13#10'  M.SIGLA,'#13#10'  N.DS_TP_AQUISICAO,'#13#10'  H.NOME_RAZA' +
      'O AS ORGAO,'#13#10'  GC.ENVIAR_EMAIL AS AVISO_EMAIL'#13#10'FROM ('#13#10'  SELECT'#13 +
      #10'       A.ID_CONTRATO,'#13#10'       A.NR_CONTRATO,'#13#10'       A.ANO_CONT' +
      'RATO,'#13#10'       CAST(SUBSTR(UDF_DIGITS('#39'0'#39'||A.NR_CONTRATO),1, 10) ' +
      'AS INTEGER)      AS CONTRATO_N,'#13#10'       UDF_TRIM(UDF_REPLACE(A.N' +
      'R_CONTRATO,UDF_DIGITS(A.NR_CONTRATO),""))  AS CONTRATO_S,'#13#10'     ' +
      '  A.ID_TP_CLASSIFICACAO,'#13#10'       A.ID_PESSOA,'#13#10'       A.ID_ENTID' +
      'ADE,'#13#10'       A.NR_EXPEDIENTE,'#13#10'       A.ANO_EXPEDIENTE,'#13#10'       ' +
      'A.COMPLEMENTO_EXPEDIENTE,'#13#10'       A.ID_TP_CONTRATO,'#13#10'       A.EN' +
      'VIAR_EMAIL,'#13#10'       A.ID_MODULO,'#13#10'       A.ID_TP_CATEGORIA'#13#10'  FR' +
      'OM GCC_CONTRATO A) GC'#13#10'  LEFT JOIN SUP_CONTRATO_PROCESSO SCP ON ' +
      'SCP.ID_CONTRATO         = GC.ID_CONTRATO'#13#10'  LEFT JOIN SUP_PROCES' +
      'SO_COMPRA     B ON B.ID_PROCESSO_COMPRA    = SCP.ID_PROCESSO_COM' +
      'PRA'#13#10'  LEFT JOIN GCC_TP_CLASSIFICACAO  GTC ON GTC.ID_TP_CLASSIFI' +
      'CACAO = GC.ID_TP_CLASSIFICACAO'#13#10'  LEFT JOIN GCC_TP_CLASSIFICACAO' +
      '  GLA ON GLA.ID_TP_CLASSIFICACAO = GTC.ID_TP_CLASSIFICACAO_PAI'#13#10 +
      '  LEFT JOIN SUP_MODALIDADE          M ON M.ID_MODALIDADE        ' +
      ' = B.ID_MODALIDADE'#13#10'  LEFT JOIN VET_TP_AQUISICAO        N ON N.I' +
      'D_TP_AQUISICAO       = B.ID_TP_AQUISICAO'#13#10'  LEFT JOIN SUP_FORNEC' +
      'EDOR          J ON J.ID_CREDOR             = GC.ID_PESSOA'#13#10'  LEF' +
      'T JOIN SIS_PESSOA              C ON C.ID_PESSOA             = GC' +
      '.ID_PESSOA'#13#10'  LEFT JOIN SIS_PESSOA_FISICA       D ON D.ID_PESSOA' +
      '_FISICA      = C.ID_PESSOA_FISICA'#13#10'  LEFT JOIN SIS_PESSOA_JURIDI' +
      'CA     E ON E.ID_PESSOA_JURIDICA    = C.ID_PESSOA_JURIDICA'#13#10'  LE' +
      'FT JOIN SIS_ENTIDADE           SE ON SE.ID_ENTIDADE          = G' +
      'C.ID_ENTIDADE'#13#10'  LEFT JOIN SIS_PESSOA              H ON H.ID_PES' +
      'SOA             = SE.ID_PESSOA_JURIDICA'#13#10'WHERE GC.ID_TP_CONTRATO' +
      ' = 1'#13#10'  AND GC.ID_MODULO = 37'#13#10'  AND ((GC.ID_TP_CATEGORIA = 1) o' +
      'r (GC.ID_TP_CATEGORIA = 3 AND 1 = :ATA_COMO_CONTRATO))'#13#10'ORDER BY' +
      ' 3 DESC, 4 DESC, 5 DESC'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ATA_COMO_CONTRATO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 48
    Top = 71
  end
  object DspContratanteSaldoSE: TDataSetProvider
    DataSet = SqlContratanteSaldoSE
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 160
    Top = 24
  end
  object DspContratanteSaldoAF: TDataSetProvider
    DataSet = SqlContratanteSaldoAF
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 288
    Top = 24
  end
  object DspContratado: TDataSetProvider
    DataSet = SqlContratado
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    BeforeGetRecords = DspContratadoBeforeGetRecords
    Left = 48
    Top = 144
  end
  object DspAditivo: TDataSetProvider
    DataSet = SqlAditivo
    Left = 128
    Top = 144
  end
  object DspMovEmpenho: TDataSetProvider
    DataSet = SqlMovEmpenho
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 210
    Top = 143
  end
  object DspAvisoVigencia: TDataSetProvider
    DataSet = SqlAvisoVigencia
    Left = 312
    Top = 144
  end
  object DspAvisoPublicacao: TDataSetProvider
    DataSet = SqlAvisoPublicacao
    Left = 410
    Top = 144
  end
  object DspAvisoEsgotarQtd: TDataSetProvider
    DataSet = SqlAvisoEsgotarQtd
    Left = 514
    Top = 144
  end
  object DspAvisoUtilizacao: TDataSetProvider
    DataSet = SqlAvisoUtilizacao
    Left = 618
    Top = 144
  end
  object DspObras: TDataSetProvider
    DataSet = SqlObras
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 416
    Top = 24
  end
  object DspRelacaoContrato: TDataSetProvider
    DataSet = SqlRelacaoContrato
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    OnGetData = DspRelacaoContratoGetData
    BeforeGetRecords = DspRelacaoContratoBeforeGetRecords
    Left = 536
    Top = 24
  end
  object DspAvisoEmail: TDataSetProvider
    DataSet = SqlAvisoEmail
    Left = 712
    Top = 144
  end
  object DspContratoRegraVencimento: TDataSetProvider
    DataSet = SqlContratoRegraVencimento
    Left = 512
    Top = 256
  end
  object DspContratoItem: TDataSetProvider
    DataSet = SqlContratoItem
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 632
    Top = 24
  end
  object DspItemDescricao: TDataSetProvider
    DataSet = SqlItemDescricao
    Options = [poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    Left = 736
    Top = 24
  end
end
