inherited DaoCnsPessoa: TDaoCnsPessoa
  OldCreateOrder = True
  Height = 526
  Width = 494
  object DspPapel: TDataSetProvider
    DataSet = SqlPapel
    Options = [poRetainServerOrder, poUseQuoteChar]
    BeforeGetRecords = DspPapelBeforeGetRecords
    Left = 56
    Top = 16
  end
  object SqlPapel: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'  CAMPOS_PAPEL,'#13#10'  B.ID_PESSOA,'#13#10'  B.ID_TP_ENTI' +
      'DADE,'#13#10'  E.DS_TP_ENTIDADE,'#13#10'  B.NOME_RAZAO,'#13#10'  B.CD_ESPECIAL,'#13#10' ' +
      ' B.FONE1,'#13#10'  B.FONE2,'#13#10'  B.FAX,'#13#10'  B.EMAIL,'#13#10'  C.CPF,'#13#10'  D.CNPJ,' +
      #13#10'  D.IE,'#13#10'  D.IM,'#13#10'  D.FANTASIA'#13#10'FROM'#13#10'  TABELA_PAPEL'#13#10'  LEFT J' +
      'OIN SIS_PESSOA B ON B.ID_PESSOA = A.ID_PESSOA'#13#10'  LEFT JOIN SIS_P' +
      'ESSOA_FISICA C ON C.ID_PESSOA_FISICA = B.ID_PESSOA_FISICA'#13#10'  LEF' +
      'T JOIN SIS_PESSOA_JURIDICA D ON D.ID_PESSOA_JURIDICA = B.ID_PESS' +
      'OA_JURIDICA'#13#10'  LEFT JOIN SIS_TP_ENTIDADE E ON E.ID_TP_ENTIDADE =' +
      ' B.ID_TP_ENTIDADE'#13#10'WHERE'#13#10'  B.ID_TP_ENTIDADE <> 0'#13#10'ORDER BY'#13#10'  B' +
      '.NOME_RAZAO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 56
    Top = 64
  end
  object DspEstadoCivil: TDataSetProvider
    DataSet = SqlEstadoCivil
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 40
    Top = 136
  end
  object SqlEstadoCivil: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.ID_TP_ESTADO_CIVIL,'#13#10'  A.DS_TP_ESTADO_CIVIL'#13#10'FROM'#13#10' ' +
      ' SIS_TP_ESTADO_CIVIL A'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 40
    Top = 184
  end
  object DspSexo: TDataSetProvider
    DataSet = SqlSexo
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 128
    Top = 136
  end
  object SqlSexo: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 'SELECT'#13#10'  A.ID_TP_SEXO,'#13#10'  A.DS_TP_SEXO'#13#10'FROM'#13#10'  SIS_TP_SEXO A'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 128
    Top = 184
  end
  object DspTipoGenerico: TDataSetProvider
    DataSet = SqlTipoGenerico
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 216
    Top = 136
  end
  object SqlTipoGenerico: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.ID_TP_ENTIDADE,'#13#10'  A.DS_TP_ENTIDADE'#13#10'FROM'#13#10'  SIS_TP_' +
      'ENTIDADE A'#13#10'WHERE'#13#10'  A.ID_TP_ENTIDADE > 3'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 216
    Top = 184
  end
  object DspLogradouro: TDataSetProvider
    DataSet = SqlLogradouro
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 304
    Top = 136
  end
  object SqlLogradouro: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.ID_TP_LOGRADOURO,'#13#10'  A.DS_TP_LOGRADOURO'#13#10'FROM'#13#10'  SIS' +
      '_TP_LOGRADOURO A'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 304
    Top = 184
  end
  object SqlExistePapelPorDoc: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT FIRST 1'#13#10'  1 AS TEM_PAPEL'#13#10'FROM '#13#10'  TABELA_PAPEL'#13#10'  INNER' +
      ' JOIN SIS_PESSOA B ON B.ID_PESSOA = A.ID_PESSOA'#13#10'  INNER JOIN SI' +
      'S_PESSOA_FISICA C ON C.ID_PESSOA_FISICA = B.ID_PESSOA_FISICA'#13#10'WH' +
      'ERE'#13#10'  C.CPF = :CPF'#13#10'  '#13#10'UNION'#13#10#13#10'SELECT FIRST 1'#13#10'  1 AS TEM_PAP' +
      'EL'#13#10'FROM '#13#10'  TABELA_PAPEL'#13#10'  INNER JOIN SIS_PESSOA B ON B.ID_PES' +
      'SOA = A.ID_PESSOA'#13#10'  INNER JOIN SIS_PESSOA_JURIDICA D ON D.ID_PE' +
      'SSOA_JURIDICA = B.ID_PESSOA_JURIDICA'#13#10'WHERE'#13#10'  D.CNPJ = :CNPJ'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 64
    Top = 464
  end
  object SqlExistePapelPorNome: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT FIRST 1'#13#10'  B.ID_TP_ENTIDADE  '#13#10'FROM'#13#10'  TABELA_PAPEL'#13#10'  IN' +
      'NER JOIN SIS_PESSOA B ON B.ID_PESSOA = A.ID_PESSOA'#13#10'WHERE'#13#10'  B.N' +
      'OME_RAZAO LIKE :NOME_RAZAO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NOME_RAZAO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 184
    Top = 464
  end
  object SqlPessoaPorDoc: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_PESSOA,'#13#10'  B.ID_TP_ENTIDADE,'#13#10'  B.NOME_RAZAO, '#13#10' ' +
      ' B.ID_PESSOA_FISICA,'#13#10'  B.ID_PESSOA_JURIDICA,'#13#10'  B.CD_ESPECIAL,'#13 +
      #10'  B.FONE1,'#13#10'  B.FONE2,'#13#10'  B.FAX,'#13#10'  B.CELULAR,'#13#10'  B.EMAIL,'#13#10'  B' +
      '.SITE,'#13#10'  C.CPF,'#13#10'  C.RG_NUMERO,'#13#10'  C.RG_ORGAO_EXPEDITOR,'#13#10'  C.R' +
      'G_EXPEDICAO,'#13#10'  C.ID_TP_ESTADO_CIVIL,'#13#10'  C.ID_TP_SEXO,'#13#10'  C.DT_N' +
      'ASCIMENTO,'#13#10'  C.PAI,'#13#10'  C.MAE,'#13#10'  C.PIS_PASEP_NIT,'#13#10'  CAST(NULL ' +
      'AS VARCHAR(14)) AS CNPJ,'#13#10'  CAST(NULL AS VARCHAR(80)) AS FANTASI' +
      'A,'#13#10'  CAST(NULL AS VARCHAR(20)) AS IE,'#13#10'  CAST(NULL AS VARCHAR(2' +
      '0)) AS IM'#13#10'FROM'#13#10'  SIS_PESSOA B'#13#10'  INNER JOIN SIS_PESSOA_FISICA ' +
      'C ON C.ID_PESSOA_FISICA = B.ID_PESSOA_FISICA'#13#10'WHERE'#13#10'  C.CPF = :' +
      'CPF'#13#10'  '#13#10'UNION'#13#10#13#10'SELECT'#13#10'  B.ID_PESSOA,'#13#10'  B.ID_TP_ENTIDADE,'#13#10' ' +
      ' B.NOME_RAZAO, '#13#10'  B.ID_PESSOA_FISICA,'#13#10'  B.ID_PESSOA_JURIDICA,'#13 +
      #10'  B.CD_ESPECIAL,'#13#10'  B.FONE1,'#13#10'  B.FONE2,'#13#10'  B.FAX,'#13#10'  B.CELULAR' +
      ','#13#10'  B.EMAIL,'#13#10'  B.SITE,'#13#10'  CAST(NULL AS VARCHAR(14)) AS CPF,'#13#10' ' +
      ' CAST(NULL AS VARCHAR(15)) AS RG_NUMERO,'#13#10'  CAST(NULL AS VARCHAR' +
      '(10)) AS RG_ORGAO_EXPEDITOR,'#13#10'  CAST(NULL AS DATE) AS RG_EXPEDIC' +
      'AO,'#13#10'  CAST(NULL AS INTEGER) AS ID_TP_ESTADO_CIVIL,'#13#10'  CAST(NULL' +
      ' AS INTEGER) AS ID_TP_SEXO,'#13#10'  CAST(NULL AS DATE) AS DT_NASCIMEN' +
      'TO,'#13#10'  CAST(NULL AS VARCHAR(60)) AS PAI,'#13#10'  CAST(NULL AS VARCHAR' +
      '(60)) AS MAE,'#13#10'  CAST(NULL AS VARCHAR(14)) AS PIS_PASEP_NIT,'#13#10'  ' +
      'D.CNPJ,'#13#10'  D.FANTASIA,'#13#10'  D.IE,'#13#10'  D.IM'#13#10'FROM'#13#10'  SIS_PESSOA B'#13#10' ' +
      ' INNER JOIN SIS_PESSOA_JURIDICA D ON D.ID_PESSOA_JURIDICA = B.ID' +
      '_PESSOA_JURIDICA'#13#10'WHERE'#13#10'  D.CNPJ = :CNPJ'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 48
    Top = 320
  end
  object DspPessoaPorDoc: TDataSetProvider
    DataSet = SqlPessoaPorDoc
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 48
    Top = 272
  end
  object CdsPessoaPorDoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end>
    ProviderName = 'DspPessoaPorDoc'
    Left = 48
    Top = 368
  end
  object DspEnquadramento: TDataSetProvider
    DataSet = SqlEnquadramento
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 400
    Top = 136
  end
  object SqlEnquadramento: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.ID_TP_ENQUADRAMENTO,'#13#10'  A.DS_TP_ENQUADRAMENTO'#13#10'FROM'#13 +
      #10'  SIS_TP_ENQUADRAMENTO A'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DaoConexao.SqcConexao
    Left = 400
    Top = 184
  end
end
