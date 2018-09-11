inherited DaoCnsFornecedor: TDaoCnsFornecedor
  Height = 532
  Width = 519
  inherited DspEnquadramento: TDataSetProvider
    Left = 448
  end
  inherited SqlEnquadramento: TSQLDataSet
    Left = 448
  end
  object SqlFindFornecedorTemp: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.ID_FORNECEDOR_TEMP,'#13#10'  A.NOME,'#13#10'  A.IE,'#13#10'  A.TELEFON' +
      'E,'#13#10'  A.FAX,'#13#10'  A.EMAIL,'#13#10'  A.ID_ESTADO_IE,'#13#10'  B.UF'#13#10'FROM'#13#10'  SUP' +
      '_FORNECEDOR_TEMP A'#13#10'  LEFT JOIN SIS_ESTADO B ON B.ID_ESTADO = A.' +
      'ID_ESTADO_IE'#13#10'WHERE'#13#10'  A.CNPJ = :CNPJ OR A.CPF = :CPF'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CPF'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 424
    Top = 463
  end
  object SqlCredorConta: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT B.ID_CREDOR_CONTA,'#13#10'       B.ID_BANCO,'#13#10'       B.CD_AGENC' +
      'IA,'#13#10'       B.DV_AGENCIA,'#13#10'       B.CD_CONTA,'#13#10'       B.DV_CONTA' +
      ','#13#10'       B.ATIVO,'#13#10'       B.CONTA_PRINCIPAL,'#13#10'       C.CD_BANCO' +
      ','#13#10'       C.DS_BANCO'#13#10'  FROM API_CREDOR A'#13#10'       LEFT JOIN API_' +
      'CREDOR_CONTA B ON B.ID_CREDOR  = A.ID_CREDOR'#13#10'       LEFT JOIN S' +
      'IS_BANCO        C ON C.ID_BANCO   = B.ID_BANCO'#13#10' WHERE A.ID_CRED' +
      'OR = :ID_CREDOR'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CREDOR'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 144
    Top = 320
  end
  object SqlFindFornecedor: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DD.ID_FORNECEDOR,'#13#10'       DD.ID_CREDOR,'#13#10'       A.ID_PESS' +
      'OA,'#13#10'       A.NOME_RAZAO AS NOME_USR,'#13#10'       B.IE,'#13#10'       B.IM' +
      ','#13#10'       B.FANTASIA,'#13#10'       B.ID_ESTADO_IE,'#13#10'       A.FONE1,'#13#10 +
      '       A.FONE2,'#13#10'       A.FAX,'#13#10'       A.EMAIL,'#13#10'       D.UF'#13#10'  ' +
      'FROM SUP_FORNECEDOR DD'#13#10'       LEFT JOIN SIS_PESSOA           A ' +
      'ON A.ID_PESSOA          = DD.ID_CREDOR'#13#10'       LEFT JOIN SIS_PES' +
      'SOA_JURIDICA  B ON B.ID_PESSOA_JURIDICA = A.ID_PESSOA_JURIDICA'#13#10 +
      '       LEFT JOIN SIS_PESSOA_FISICA    C ON C.ID_PESSOA_FISICA   ' +
      '= A.ID_PESSOA_FISICA'#13#10'       LEFT JOIN SIS_ESTADO           D ON' +
      ' D.ID_ESTADO          = B.ID_eSTADO_IE'#13#10' WHERE B.CNPJ = :CNPJ'#13#10' ' +
      '   OR C.CPF  = :CPF'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 304
    Top = 463
  end
  object DspCredorConta: TDataSetProvider
    DataSet = SqlCredorConta
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 144
    Top = 272
  end
  object CdsCredorConta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CREDOR'
        ParamType = ptInput
      end>
    ProviderName = 'DspCredorConta'
    Left = 144
    Top = 368
  end
  object DspEstado: TDataSetProvider
    DataSet = SqlEstado
    Left = 368
    Top = 136
  end
  object SqlEstado: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'  A.ID_ESTADO,'#13#10'  A.DS_ESTADO,'#13#10'  A.UF'#13#10'FROM'#13#10'  SIS_ESTA' +
      'DO A'
    DbxCommandType = 'Dbx.SQL'
    Params = <>
    Left = 368
    Top = 184
  end
  object SqlFindMunicipio: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.ID_MUNICIPIO'#13#10'FROM SIS_MUNICIPIO A'#13#10'  LEFT JOIN SIS_EST' +
      'ADO B ON B.ID_ESTADO = A.ID_ESTADO'#13#10'WHERE UDF_UPPER(UDF_COLLATEB' +
      'R(A.DS_MUNICIPIO)) = UDF_UPPER(UDF_COLLATEBR(:DS_MUNICIPIO))'#13#10'  ' +
      'AND UDF_UPPER(B.UF) = UDF_UPPER(:UF)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DS_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UF'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 304
    Top = 399
  end
  object SqlFindTpLogradouro: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.ID_TP_LOGRADOURO, substr(cast(:DS_LOGRADOURO as char(60' +
      ')),UDF_POS('#39' '#39', :DS_LOGRADOURO)+1, UDF_LEN(:DS_LOGRADOURO)) as D' +
      'S_LOGRADOURO'#13#10'FROM SIS_TP_LOGRADOURO A'#13#10'WHERE UDF_UPPER(UDF_COLL' +
      'ATEBR(A.DS_TP_LOGRADOURO)) = SUBSTR(UDF_UPPER(UDF_COLLATEBR(:DS_' +
      'LOGRADOURO)),1,UDF_POS('#39' '#39', :DS_LOGRADOURO)-1)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DS_LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_LOGRADOURO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 400
    Top = 399
  end
  object SQLConsultaFornecedor: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT Z.RAZAO,'#13#10'       Z.FANTASIA,'#13#10'       Z.FONE1,'#13#10'       Z.F' +
      'ONE2,'#13#10'       Z.FAX,'#13#10'       Z.CEL,'#13#10'       Z.EMAIL,'#13#10'       Z.T' +
      'IPODOC,'#13#10'       Z.DOCUMENTO,'#13#10'       Z.ORIGEM,'#13#10'       Z.ENTIDAD' +
      'E,'#13#10'       Z.ID_RAMO_ATIVIDADE,'#13#10'       Z.ID_GRUPO,'#13#10'       Z.ID' +
      '_GRUPO_SERVICO,'#13#10'       Z.ID_MATERIAL,'#13#10'       Z.ID_MUNICIPIO,'#13#10 +
      '       Z.EMPENHO'#13#10'  FROM ( SELECT B.NOME_RAZAO AS RAZAO,'#13#10'      ' +
      '          D.FANTASIA,'#13#10'                B.FONE1,'#13#10'               ' +
      ' B.FONE2,'#13#10'                B.FAX,'#13#10'                B.CELULAR AS ' +
      'CEL,'#13#10'                B.EMAIL,'#13#10'                IIF(B.ID_PESSOA_' +
      'FISICA IS NULL,"CNPJ","CPF") AS TIPODOC,'#13#10'                IIF(B.' +
      'ID_PESSOA_FISICA IS NULL,D.CNPJ,C.CPF) AS DOCUMENTO,'#13#10'          ' +
      '      "P" AS ORIGEM,'#13#10'                E.DS_TP_ENTIDADE AS ENTIDA' +
      'DE,'#13#10'                (SELECT FIRST 1 1'#13#10'                   FROM ' +
      'SUP_RAMO_ATIVIDADE_FORNECEDOR Z1'#13#10'                        LEFT J' +
      'OIN SUP_RAMO_ATIVIDADE Z2 ON Z2.ID_RAMO_ATIVIDADE = Z1.ID_RAMO_A' +
      'TIVIDADE'#13#10'                  WHERE  Z1.ID_FORNECEDOR          = A' +
      '1.ID_FORNECEDOR'#13#10'                    AND (Z1.ID_RAMO_ATIVIDADE  ' +
      '    = :ID_RAMO_ATIVIDADE OR'#13#10'                         Z2.ID_RAMO' +
      '_ATIVIDADE_PAI  = :ID_RAMO_ATIVIDADE    ) ) AS ID_RAMO_ATIVIDADE' +
      ','#13#10'                (SELECT FIRST 1 1'#13#10'                   FROM SU' +
      'P_FORN_MATERIAL Z1'#13#10'                        LEFT JOIN SUP_MATERI' +
      'AL Z2 ON Z2.ID_MATERIAL = Z1.ID_MATERIAL'#13#10'                      ' +
      '  LEFT JOIN SUP_GRUPO    Z3 ON Z3.ID_GRUPO    = Z2.ID_GRUPO'#13#10'   ' +
      '               WHERE  Z1.ID_FORNECEDOR = A1.ID_FORNECEDOR'#13#10'     ' +
      '               AND (Z3.ID_GRUPO      = :ID_GRUPO OR'#13#10'           ' +
      '              Z3.ID_GRUPO_PAI  = :ID_GRUPO                     )' +
      ' ) AS ID_GRUPO,'#13#10'                (SELECT FIRST 1 1'#13#10'            ' +
      '       FROM SUP_FORN_GRUPO_SERVICO Z1'#13#10'                        L' +
      'EFT JOIN SUP_GRUPO_SERVICO Z2 ON Z2.ID_GRUPO_SERVICO = Z1.ID_GRU' +
      'PO_SERVICO'#13#10'                  WHERE  Z1.ID_FORNECEDOR         = ' +
      'A1.ID_FORNECEDOR'#13#10'                    AND (Z1.ID_GRUPO_SERVICO  ' +
      '    = :ID_GRUPO_SERVICO OR'#13#10'                         Z2.ID_GRUPO' +
      '_SERVICO_PAI  = :ID_GRUPO_SERVICO     ) ) AS ID_GRUPO_SERVICO,'#13#10 +
      '                (SELECT FIRST 1 Z1.ID_MATERIAL'#13#10'                ' +
      '   FROM SUP_FORN_MATERIAL Z1'#13#10'                  WHERE Z1.ID_FORN' +
      'ECEDOR  = A1.ID_FORNECEDOR'#13#10'                    AND Z1.ID_MATERI' +
      'AL    = :ID_MATERIAL    ) AS ID_MATERIAL,'#13#10'                (SELE' +
      'CT FIRST 1 Z1.ID_MUNICIPIO'#13#10'                   FROM SIS_ENDERECO' +
      ' Z1'#13#10'                  WHERE Z1.ID_MUNICIPIO = :ID_MUNICIPIO'#13#10'  ' +
      '                  AND Z1.ID_PESSOA    = B.ID_PESSOA       ) AS I' +
      'D_MUNICIPIO,'#13#10'                (SELECT FIRST 1 1'#13#10'               ' +
      '    FROM SUP_SOLIC_EMPENHO Z1'#13#10'                  WHERE Z1.ID_FOR' +
      'NECEDOR = A1.ID_FORNECEDOR ) AS EMPENHO'#13#10'           FROM SUP_FOR' +
      'NECEDOR A1'#13#10'                LEFT JOIN SIS_PESSOA B ON B.ID_PESSO' +
      'A = A1.ID_CREDOR'#13#10'                LEFT JOIN SIS_PESSOA_FISICA C ' +
      'ON C.ID_PESSOA_FISICA = B.ID_PESSOA_FISICA'#13#10'                LEFT' +
      ' JOIN SIS_PESSOA_JURIDICA D ON D.ID_PESSOA_JURIDICA = B.ID_PESSO' +
      'A_JURIDICA'#13#10'                LEFT JOIN SIS_TP_ENTIDADE E ON E.ID_' +
      'TP_ENTIDADE = B.ID_TP_ENTIDADE'#13#10'          WHERE B.ID_TP_ENTIDADE' +
      ' <> 0'#13#10'        '#13#10'          UNION'#13#10#13#10'         SELECT A.NOME AS RA' +
      'ZAO,'#13#10'                NULL AS FANTASIA,'#13#10'                A.TELEF' +
      'ONE AS FONE1,'#13#10'                NULL AS FONE2,'#13#10'                A' +
      '.FAX,'#13#10'                NULL AS CEL,'#13#10'                CAST(A.EMAI' +
      'L AS VARCHAR(100)) AS EMAIL,'#13#10'                IIF(A.CNPJ IS NULL' +
      ',"CPF","CNPJ") AS TIPODOC,'#13#10'                IIF(A.CNPJ IS NULL,A' +
      '.CPF,A.CNPJ) AS DOCUMENTO,'#13#10'                "T" AS ORIGEM,'#13#10'    ' +
      '            B.DS_TP_ENTIDADE,'#13#10'                NULL AS ID_RAMO_A' +
      'TIVIDADE,'#13#10'                NULL AS ID_GRUPO,'#13#10'                NU' +
      'LL AS ID_GRUPO_SERVICO,'#13#10'                NULL AS ID_MATERIAL,'#13#10' ' +
      '               NULL AS ID_MUNICIPIO,'#13#10'                NULL AS EM' +
      'PENHO'#13#10'           FROM SUP_FORNECEDOR_TEMP A'#13#10'                LE' +
      'FT JOIN SIS_TP_ENTIDADE B ON B.ID_TP_ENTIDADE = A.ID_TP_ENTIDADE' +
      #13#10'       ) Z'#13#10#13#10' /*FILTRO*/'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_RAMO_ATIVIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_RAMO_ATIVIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO_SERVICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_MATERIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_MUNICIPIO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 432
    Top = 312
    object SQLConsultaFornecedorRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 100
    end
    object SQLConsultaFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 80
    end
    object SQLConsultaFornecedorFONE1: TStringField
      FieldName = 'FONE1'
      Size = 22
    end
    object SQLConsultaFornecedorFONE2: TStringField
      FieldName = 'FONE2'
      Size = 22
    end
    object SQLConsultaFornecedorFAX: TStringField
      FieldName = 'FAX'
      Size = 22
    end
    object SQLConsultaFornecedorCEL: TStringField
      FieldName = 'CEL'
      Size = 22
    end
    object SQLConsultaFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SQLConsultaFornecedorTIPODOC: TStringField
      FieldName = 'TIPODOC'
      FixedChar = True
      Size = 4
    end
    object SQLConsultaFornecedorDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 14
    end
    object SQLConsultaFornecedorORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 1
    end
    object SQLConsultaFornecedorENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Size = 60
    end
    object SQLConsultaFornecedorID_RAMO_ATIVIDADE: TIntegerField
      FieldName = 'ID_RAMO_ATIVIDADE'
    end
    object SQLConsultaFornecedorID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object SQLConsultaFornecedorID_GRUPO_SERVICO: TIntegerField
      FieldName = 'ID_GRUPO_SERVICO'
    end
    object SQLConsultaFornecedorID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object SQLConsultaFornecedorID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
    end
    object SQLConsultaFornecedorEMPENHO: TIntegerField
      FieldName = 'EMPENHO'
    end
  end
  object DspConsultaFornecedor: TDataSetProvider
    DataSet = SQLConsultaFornecedor
    Options = [poRetainServerOrder, poUseQuoteChar]
    BeforeGetRecords = DspConsultaFornecedorBeforeGetRecords
    Left = 432
    Top = 264
  end
  object DspFornecedorPregao: TDataSetProvider
    DataSet = SqlFornecedorPregao
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 368
    Top = 16
  end
  object SqlFornecedorPregao: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       A1.ID_FORNECEDOR,'#13#10'       0 AS ID_FORNEC' +
      'EDOR_TEMP,'#13#10'       ( SELECT IIF(COUNT(1) > 0, 1, 0)'#13#10'           ' +
      'FROM SUP_SANCAO_FORNECEDOR AA'#13#10'          WHERE AA.ID_FORNECEDOR ' +
      '= A1.ID_FORNECEDOR'#13#10'            AND CAST('#39'TODAY'#39' AS DATE) BETWEE' +
      'N AA.DT_INICIO AND AA.DT_FIM ) AS SANCAO,'#13#10'       ( SELECT FIRST' +
      ' 1 1 AS IMPEDITIVO'#13#10'           FROM SUP_SANCAO_FORNECEDOR AA'#13#10'  ' +
      '              LEFT JOIN SUP_TP_SANCAO BB ON BB.ID_TP_SANCAO = AA' +
      '.ID_TP_SANCAO'#13#10'          WHERE BB.IMPEDITIVO = 1'#13#10'            AN' +
      'D AA.ID_FORNECEDOR = A1.ID_FORNECEDOR'#13#10'            AND CAST('#39'TOD' +
      'AY'#39' AS DATE) BETWEEN AA.DT_INICIO AND AA.DT_FIM ) AS IMPEDITIVO,' +
      #13#10'        B.ID_TP_ENTIDADE,'#13#10'        E.DS_TP_ENTIDADE,'#13#10'        ' +
      'B.NOME_RAZAO,'#13#10'        B.FONE1,'#13#10'        B.FONE2,'#13#10'        B.FAX' +
      ','#13#10'        B.EMAIL,'#13#10'        C.CPF,'#13#10'        D.CNPJ,'#13#10'        D.' +
      'IE,'#13#10'        D.IM,'#13#10'        D.FANTASIA'#13#10'  FROM SUP_FORNECEDOR A1' +
      #13#10'       LEFT JOIN SUP_COTACAO          A2 ON A2.ID_FORNECEDOR  ' +
      '    = A1.ID_FORNECEDOR'#13#10'                                        ' +
      'AND A2.PROPOSTA           = 1'#13#10'       LEFT JOIN SIS_PESSOA      ' +
      '     B  ON B.ID_PESSOA           = A1.ID_CREDOR'#13#10'       LEFT JOI' +
      'N SIS_PESSOA_FISICA    C  ON C.ID_PESSOA_FISICA    = B.ID_PESSOA' +
      '_FISICA'#13#10'       LEFT JOIN SIS_PESSOA_JURIDICA  D  ON D.ID_PESSOA' +
      '_JURIDICA  = B.ID_PESSOA_JURIDICA'#13#10'       LEFT JOIN SIS_TP_ENTID' +
      'ADE      E  ON E.ID_TP_ENTIDADE      = B.ID_TP_ENTIDADE'#13#10' WHERE ' +
      'B.ID_TP_ENTIDADE <> 0'#13#10'   AND ( SELECT FIRST 1 1'#13#10'           FRO' +
      'M SUP_PREGAO_FORNECEDOR A4'#13#10'                INNER JOIN SUP_PREGA' +
      'O_FORC_LOTE B4 ON B4.ID_PREGAO_FORNECEDOR = A4.ID_PREGAO_FORNECE' +
      'DOR'#13#10'          WHERE A4.ID_FORNECEDOR  = A1.ID_FORNECEDOR'#13#10'     ' +
      '       AND A4.ID_LICITACAO   = :ID_LICITACAO'#13#10'            AND B4' +
      '.CLASSIFICADO   = 1 ) IS NOT NULL'#13#10#13#10'UNION'#13#10#13#10'SELECT DISTINCT'#13#10' ' +
      '      0,'#13#10'       A1.ID_FORNECEDOR_TEMP,'#13#10'       ( SELECT IIF(COU' +
      'NT(1) > 0, 1, 0)'#13#10'           FROM SUP_SANCAO_FORNECEDOR AA'#13#10'    ' +
      '      WHERE AA.ID_FORNECEDOR = A1.ID_FORNECEDOR_TEMP'#13#10'          ' +
      '  AND CAST('#39'TODAY'#39' AS DATE) BETWEEN AA.DT_INICIO AND AA.DT_FIM  ' +
      ') AS SANCAO,'#13#10'       ( SELECT FIRST 1 1 AS IMPEDITIVO'#13#10'         ' +
      '  FROM SUP_SANCAO_FORNECEDOR AA'#13#10'                LEFT JOIN SUP_T' +
      'P_SANCAO BB ON BB.ID_TP_SANCAO = AA.ID_TP_SANCAO'#13#10'          WHER' +
      'E BB.IMPEDITIVO     = 1'#13#10'            AND AA.ID_FORNECEDOR  = A1.' +
      'ID_FORNECEDOR_TEMP'#13#10'            AND CAST('#39'TODAY'#39' AS DATE) BETWEE' +
      'N AA.DT_INICIO AND AA.DT_FIM  ) AS IMPEDITIVO,'#13#10'       A1.ID_TP_' +
      'ENTIDADE,'#13#10'       '#39'Tempor'#225'rio'#39','#13#10'       A1.NOME,'#13#10'       A1.TELE' +
      'FONE,'#13#10'       '#39#39','#13#10'       A1.FAX,'#13#10'       A1.EMAIL,'#13#10'       A1.C' +
      'PF,'#13#10'       A1.CNPJ,'#13#10'       '#39#39','#13#10'       '#39#39','#13#10'       '#39#39#13#10'  FROM ' +
      'SUP_FORNECEDOR_TEMP A1'#13#10' WHERE A1.ID_TP_ENTIDADE <> 0'#13#10'   AND ( ' +
      'SELECT FIRST 1 1'#13#10'           FROM SUP_PREGAO_FORNECEDOR A4'#13#10'    ' +
      '            INNER JOIN SUP_PREGAO_FORC_LOTE B4 ON B4.ID_PREGAO_F' +
      'ORNECEDOR = A4.ID_PREGAO_FORNECEDOR'#13#10'          WHERE A4.ID_FORNE' +
      'CEDOR_TEMP = A1.ID_FORNECEDOR_TEMP'#13#10'            AND A4.ID_LICITA' +
      'CAO       = :ID_LICITACAO'#13#10'            AND B4.CLASSIFICADO      ' +
      ' = 1 ) IS NOT NULL'#13#10#13#10' ORDER BY 8'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LICITACAO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 368
    Top = 64
  end
end
