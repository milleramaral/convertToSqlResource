inherited DaoCnsRastreamentoSC: TDaoCnsRastreamentoSC
  OldCreateOrder = True
  Height = 610
  Width = 722
  object DspEtapaQtd: TDataSetProvider
    DataSet = SqlEtapaQtd
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 56
    Top = 24
  end
  object SqlEtapaQtd: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.ID_SOLICITACAO_COMPRA'#13#10'     , A.NR_SOLICITACAO_COMPRA'#13#10 +
      '     , A.CP_ANO'#13#10'     , A.NR_PROTOCOLO'#13#10'     , A.ANO_PROTOCOLO'#13#10 +
      '     , A.DT_SOLICITACAO_COMPRA'#13#10'     , A.TP_SOLICITACAO_COMPRA'#13#10 +
      '     , A.ID_PROCESSO_COMPRA'#13#10'     , A.TP_SOLICITACAO'#13#10'     , B.N' +
      'OME                 AS NOME_SOLICITANTE'#13#10'     , B.NOME_COMPLETO ' +
      '       AS NOME_COMPLETO_SOLICITANTE'#13#10'     , D.CD_UNIDADE_ADM'#13#10'  ' +
      '   , D.DS_UNIDADE_ADM'#13#10'     , C.CD_CENTRO_CONSUMO'#13#10'     , C.DS_C' +
      'ENTRO_CONSUMO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)' +
      #13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JO' +
      'IN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICI' +
      'TACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA = A.ID_SOLI' +
      'CITACAO_COMPRA'#13#10'          AND B1.ST_COMPRA_ITEM       <> :ST_COM' +
      'PRA_ITEM_EXCLUIDO ) AS QTD_TOTAL'#13#10#13#10'     ,(SELECT COUNT(DISTINCT' +
      ' B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'  ' +
      '            LEFT JOIN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO_CO' +
      'MPRA = A1.ID_SOLICITACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITACAO' +
      '_COMPRA  = A.ID_SOLICITACAO_COMPRA'#13#10'          AND A1.ST_SOLICITA' +
      'CAO_COMPRA  = :ST_SOLICITACAO_COMPRA_ABERTO'#13#10'          AND B1.ST' +
      '_COMPRA_ITEM         = :ST_COMPRA_ITEM_ABERTO  ) AS QTD_SOLICITA' +
      'DO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         ' +
      'FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMP' +
      'RA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICITACAO_COMPR' +
      'A'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA  = A.ID_SOLICITACAO_CO' +
      'MPRA'#13#10'          AND A1.ST_SOLICITACAO_COMPRA  = :ST_SOLICITACAO_' +
      'COMPRA_LIBERADO'#13#10'          AND B1.ST_COMPRA_ITEM         = :ST_C' +
      'OMPRA_ITEM_ABERTO ) AS QTD_LIBERADO'#13#10#13#10'     ,(SELECT COUNT(DISTI' +
      'NCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13 +
      #10'              LEFT JOIN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO' +
      '_COMPRA = A1.ID_SOLICITACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITA' +
      'CAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'          AND A1.ST_SOLICI' +
      'TACAO_COMPRA = :ST_SOLICITACAO_COMPRA_APROVADO'#13#10'          AND (B' +
      '1.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_ABERTO OR (B1.ST_COMPRA_ITEM ' +
      '= :ST_COMPRA_ITEM_LIBERADO_DOT AND 0 = :UTILIZA_APROV_FIN)) ) AS' +
      ' QTD_APROVADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)' +
      #13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JO' +
      'IN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICI' +
      'TACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA  = A.ID_SOL' +
      'ICITACAO_COMPRA'#13#10'          AND A1.ST_SOLICITACAO_COMPRA  = :ST_S' +
      'OLICITACAO_COMPRA_REPROVADO'#13#10'          AND B1.ST_COMPRA_ITEM    ' +
      '     = :ST_COMPRA_ITEM_ABERTO ) AS QTD_REPROVADO'#13#10#13#10'     ,(SELEC' +
      'T COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLICITAC' +
      'AO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMPRA_ITEM B1 ON B1.I' +
      'D_SOLICITACAO_COMPRA = A1.ID_SOLICITACAO_COMPRA'#13#10'        WHERE A' +
      '1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'          AND' +
      ' B1.ST_COMPRA_ITEM        = :ST_COMPRA_ITEM_LIBERADO_DOT'#13#10'      ' +
      '    AND 1 = :UTILIZA_APROV_FIN                            ) AS Q' +
      'TD_APROV_FINANCEIRA'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA' +
      '_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              L' +
      'EFT JOIN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_' +
      'SOLICITACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA = A.I' +
      'D_SOLICITACAO_COMPRA'#13#10'          AND B1.ST_COMPRA_ITEM = :ST_COMP' +
      'RA_ITEM_NAO_LIBERADO_DOT ) AS QTD_APROV_FINANCEIRA_REPROV'#13#10#13#10'   ' +
      '  ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_' +
      'SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMPRA_ITEM B' +
      '1 ON B1.ID_SOLICITACAO_COMPRA  = A1.ID_SOLICITACAO_COMPRA'#13#10'     ' +
      '         LEFT JOIN SUP_COMPRA_ITEM_ID C1 ON C1.ID_COMPRA_ITEM_ID' +
      '   = B1.ID_COMPRA_ITEM_ID'#13#10'        WHERE A1.ID_SOLICITACAO_COMPR' +
      'A = A.ID_SOLICITACAO_COMPRA'#13#10'          AND (   ((0 = :UTILIZA_DE' +
      'F_COMPRADOR OR A.TP_SOLICITACAO <> :TP_SOLICITACAO_NORMAL) AND B' +
      '1.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIBERADO_COMPRA AND C1.ID_COM' +
      'PRA_ITEM_ID IS NULL) OR'#13#10'                  (1 = :UTILIZA_DEF_COM' +
      'PRADOR AND B1.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIB_LIBERACAO)) )' +
      ' AS QTD_DEF_DOTACAO_LIBERADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.' +
      'ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'      ' +
      '        LEFT JOIN SUP_COMPRA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA' +
      ' = A1.ID_SOLICITACAO_COMPRA'#13#10'        WHERE A1.ID_SOLICITACAO_COM' +
      'PRA = A.ID_SOLICITACAO_COMPRA'#13#10'          AND (   ((0 = :UTILIZA_' +
      'DEF_COMPRADOR OR A.TP_SOLICITACAO <> :TP_SOLICITACAO_NORMAL) AND' +
      ' B1.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA) OR'#13#10'  ' +
      '                (1 = :UTILIZA_DEF_COMPRADOR AND B1.ST_COMPRA_ITE' +
      'M = :ST_COMPRA_ITEM_NAO_LIB_LIBERACAO)) ) AS QTD_DEF_DOTACAO_NAO' +
      '_LIBERADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'  ' +
      '       FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN S' +
      'UP_COMPRA_ITEM    B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICIT' +
      'ACAO_COMPRA'#13#10'              LEFT JOIN SUP_COMPRA_ITEM_ID C1 ON C1' +
      '.ID_COMPRA_ITEM_ID     = B1.ID_COMPRA_ITEM_ID'#13#10'        WHERE A1.' +
      'ID_SOLICITACAO_COMPRA  = A.ID_SOLICITACAO_COMPRA'#13#10'          AND ' +
      'B1.ST_COMPRA_ITEM         = :ST_COMPRA_ITEM_LIBERADO_COMPRA'#13#10'   ' +
      '       AND C1.ID_COMPRA_ITEM_ID IS NULL  ) AS QTD_LIBERACAO_LIBE' +
      'RADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'       ' +
      '  FROM SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_CO' +
      'MPRA_ITEM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICITACAO_COM' +
      'PRA'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA  = A.ID_SOLICITACAO_' +
      'COMPRA'#13#10'          AND B1.ST_COMPRA_ITEM         = :ST_COMPRA_ITE' +
      'M_NAO_LIBERADO_COMPRA ) AS QTD_LIBERACAO_NAO_LIBERADO'#13#10#13#10'     ,(' +
      'SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLI' +
      'CITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMPRA_ITEM     B' +
      '1 ON B1.ID_SOLICITACAO_COMPRA  = A1.ID_SOLICITACAO_COMPRA'#13#10'     ' +
      '         LEFT JOIN SUP_COMPRA_ITEM_ID  C1 ON C1.ID_COMPRA_ITEM_I' +
      'D      = B1.ID_COMPRA_ITEM_ID'#13#10'        WHERE A1.ID_SOLICITACAO_C' +
      'OMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'          AND B1.ST_COMPRA_ITEM' +
      '        = :ST_COMPRA_ITEM_LIBERADO_COMPRA'#13#10'          AND C1.ID_C' +
      'OMPRA_ITEM_ID IS NOT NULL ) AS QTD_DEF_COMPRADOR_DEFINIDO'#13#10'    '#13 +
      #10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM ' +
      'SUP_SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMPRA_IT' +
      'EM B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICITACAO_COMPRA'#13#10'  ' +
      '      WHERE A1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10 +
      '          AND B1.ST_COMPRA_ITEM        = :ST_COMPRA_ITEM_RECUSAD' +
      'O_DEF_COMP ) AS QTD_RECUSADO_DEF_COMP'#13#10'    '#13#10'     ,(SELECT COUNT' +
      '(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMP' +
      'RA A1'#13#10'              LEFT JOIN SUP_COMPRA_ITEM       B1 ON B1.ID' +
      '_SOLICITACAO_COMPRA  = A1.ID_SOLICITACAO_COMPRA'#13#10'              L' +
      'EFT JOIN SUP_PROC_COMPRA_ITEM  C1 ON C1.ID_PROC_COMPRA_ITEM    =' +
      ' B1.ID_PROC_COMPRA_ITEM'#13#10'              LEFT JOIN SUP_RATIF_ITEM ' +
      '       D1 ON D1.ID_PROC_COMPRA_ITEM    = C1.ID_PROC_COMPRA_ITEM'#13 +
      #10'        WHERE A1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPR' +
      'A'#13#10'          AND B1.ST_COMPRA_ITEM        = :ST_COMPRA_ITEM_EM_P' +
      'ROCESSO'#13#10'          AND C1.ANULADO               = 0'#13#10'          A' +
      'ND D1.ID_RATIF_ITEM IS NULL ) AS QTD_EM_PROCESSO_COMPRA'#13#10'    '#13#10' ' +
      '    ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SU' +
      'P_SOLICITACAO_COMPRA A1'#13#10'              LEFT JOIN SUP_COMPRA_ITEM' +
      ' B1 ON B1.ID_SOLICITACAO_COMPRA = A1.ID_SOLICITACAO_COMPRA'#13#10'    ' +
      '    WHERE A1.ID_SOLICITACAO_COMPRA  = A.ID_SOLICITACAO_COMPRA'#13#10' ' +
      '         AND B1.ST_COMPRA_ITEM         = :ST_COMPRA_ITEM_RECUSAD' +
      'O ) AS QTD_RECUSADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT A5.ID_COMPRA' +
      '_ITEM)'#13#10'         FROM ('#13#10'               SELECT B1.ID_COMPRA_ITEM' +
      #13#10'                    , SUM( (SELECT SUM( COALESCE(A2.QTD, A2.VL' +
      '_SERVICO, C2.QTD, C2.VL_TOTAL) )'#13#10'                              ' +
      'FROM SUP_RATIF_FICHA A2'#13#10'                                   LEFT' +
      ' JOIN SUP_RATIF_FICHA_DADOS  B2 ON B2.ID_RATIF_FICHA_DADOS = A2.' +
      'ID_RATIF_FICHA_DADOS'#13#10'                                   LEFT JO' +
      'IN SUP_RATIF_ITEM         C2 ON C2.ID_RATIF_ITEM        = A2.ID_' +
      'RATIF_ITEM'#13#10'                             WHERE A2.ID_RATIF_ITEM ' +
      '  = D1.ID_RATIF_ITEM'#13#10'                               AND B2.ID_C' +
      'OMPRA_ITEM  = B1.ID_COMPRA_ITEM ) ) AS TOTAL_RATIFICADO'#13#10'       ' +
      '             , SUM( (SELECT SUM(COALESCE(B3.QTD, B3.VALOR)'#13#10'    ' +
      '                                 - COALESCE( (SELECT SUM(COALESC' +
      'E(B4.QTD, B4.VALOR, 0))'#13#10'                                       ' +
      '             FROM SUP_SOLIC_ESTORNO A4'#13#10'                        ' +
      '                                 LEFT JOIN SUP_SOLIC_EMPENHO_ITE' +
      'M   E4 ON E4.ID_SOLIC_ESTORNO       = A4.ID_SOLIC_ESTORNO'#13#10'     ' +
      '                                                    LEFT JOIN SU' +
      'P_SOLIC_EMPENHO_FICHA  B4 ON B4.ID_SOLIC_EMPENHO_ITEM  = E4.ID_S' +
      'OLIC_EMPENHO_ITEM'#13#10'                                             ' +
      '            LEFT JOIN SUP_RATIF_FICHA          C4 ON C4.ID_RATIF' +
      '_FICHA         = B4.ID_RATIF_FICHA'#13#10'                            ' +
      '                       WHERE A4.ID_SOLIC_EMPENHO      = C3.ID_SO' +
      'LIC_EMPENHO'#13#10'                                                   ' +
      '  AND A4.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOSICAO_LANCADO'#13#10 +
      '                                                     AND C4.ID_R' +
      'ATIF_ITEM         = A3.ID_RATIF_ITEM), 0) )'#13#10'                   ' +
      '           FROM SUP_RATIF_FICHA A3'#13#10'                            ' +
      '       LEFT JOIN SUP_RATIF_FICHA_DADOS    E3 ON E3.ID_RATIF_FICH' +
      'A_DADOS   = A3.ID_RATIF_FICHA_DADOS'#13#10'                           ' +
      '        INNER JOIN SUP_SOLIC_EMPENHO_FICHA B3 ON B3.ID_RATIF_FIC' +
      'HA         = A3.ID_RATIF_FICHA'#13#10'                                ' +
      '   LEFT JOIN SUP_SOLIC_EMPENHO_ITEM   F3 ON F3.ID_SOLIC_EMPENHO_' +
      'ITEM  = B3.ID_SOLIC_EMPENHO_ITEM'#13#10'                              ' +
      '     LEFT JOIN SUP_SOLIC_EMPENHO        C3 ON C3.ID_SOLIC_EMPENH' +
      'O       = F3.ID_SOLIC_EMPENHO'#13#10'                             WHER' +
      'E A3.ID_RATIF_ITEM         = D1.ID_RATIF_ITEM  '#13#10'               ' +
      '                AND C3.ID_ST_SOLIC_EMPENHO  <> :ST_PEDIDO_COMPOS' +
      'ICAO_CANCELADO'#13#10'                               AND E3.ID_COMPRA_' +
      'ITEM        = B1.ID_COMPRA_ITEM ) ) AS TOTAL_SOLICITADO'#13#10'       ' +
      '          FROM SUP_SOLICITACAO_COMPRA A1'#13#10'                      ' +
      'LEFT JOIN SUP_COMPRA_ITEM      B1 ON B1.ID_SOLICITACAO_COMPRA = ' +
      'A1.ID_SOLICITACAO_COMPRA'#13#10'                      LEFT JOIN SUP_PR' +
      'OC_COMPRA_ITEM C1 ON C1.ID_PROC_COMPRA_ITEM = B1.ID_PROC_COMPRA_' +
      'ITEM'#13#10'                      LEFT JOIN SUP_RATIF_ITEM       D1 ON' +
      ' D1.ID_PROC_COMPRA_ITEM = C1.ID_PROC_COMPRA_ITEM'#13#10'              ' +
      '                                          OR D1.ID_RATIF_ITEM   ' +
      '    = (SELECT FIRST 1 B3.ID_RATIF_ITEM'#13#10'                        ' +
      '                                                               F' +
      'ROM SUP_RATIF_FICHA_DADOS A3'#13#10'                                  ' +
      '                                                          LEFT J' +
      'OIN SUP_RATIF_FICHA B3 ON B3.ID_RATIF_FICHA_DADOS = A3.ID_RATIF_' +
      'FICHA_DADOS'#13#10'                                                   ' +
      '                                   WHERE A3.ID_COMPRA_ITEM = B1.' +
      'ID_COMPRA_ITEM )'#13#10'                WHERE A1.ID_SOLICITACAO_COMPRA' +
      ' = A.ID_SOLICITACAO_COMPRA'#13#10'                  AND D1.ID_RATIF_IT' +
      'EM IS NOT NULL'#13#10'                GROUP BY'#13#10'                      ' +
      'B1.ID_COMPRA_ITEM'#13#10'              ) A5'#13#10'        WHERE UDF_ROUNDDE' +
      'C(A5.TOTAL_RATIFICADO, 4) - UDF_ROUNDDEC(A5.TOTAL_SOLICITADO, 3)' +
      ' > 0 ) AS QTD_RATIFICADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_C' +
      'OMPRA_ITEM)'#13#10'         FROM SUP_SOLICITACAO_COMPRA A1'#13#10'          ' +
      '    LEFT JOIN SUP_COMPRA_ITEM       B1 ON B1.ID_SOLICITACAO_COMP' +
      'RA  = A1.ID_SOLICITACAO_COMPRA'#13#10'              LEFT JOIN SUP_PROC' +
      '_COMPRA_ITEM  C1 ON C1.ID_PROC_COMPRA_ITEM    = B1.ID_PROC_COMPR' +
      'A_ITEM'#13#10'        WHERE A1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACA' +
      'O_COMPRA'#13#10'          AND C1.ANULADO = 1 ) AS QTD_ANULADO'#13#10#13#10'     ' +
      ',(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_CO' +
      'MPRA_ITEM B1'#13#10'              LEFT JOIN SUP_RATIF_FICHA_DADOS   F1' +
      ' ON F1.ID_COMPRA_ITEM         = B1.ID_COMPRA_ITEM'#13#10'             ' +
      ' LEFT JOIN SUP_RATIF_FICHA         E1 ON E1.ID_RATIF_FICHA_DADOS' +
      '   = F1.ID_RATIF_FICHA_DADOS'#13#10'              LEFT JOIN SUP_RATIF_' +
      'ITEM          D1 ON D1.ID_RATIF_ITEM          = E1.ID_RATIF_ITEM' +
      #13#10'              LEFT JOIN SUP_SOLIC_EMPENHO_FICHA G1 ON G1.ID_RA' +
      'TIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'              LEFT JOIN S' +
      'UP_SOLIC_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_EMPENHO_ITEM  = G1.ID_S' +
      'OLIC_EMPENHO_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMPENHO    ' +
      '   H1 ON H1.ID_SOLIC_EMPENHO       = J1.ID_SOLIC_EMPENHO'#13#10'      ' +
      '  WHERE B1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'    ' +
      '      AND F1.ID_COMPRA_ITEM        = B1.ID_COMPRA_ITEM'#13#10'        ' +
      '  AND H1.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOSICAO_ABERTO ) ' +
      'AS QTD_SE'#13#10'    '#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)' +
      #13#10'         FROM SUP_COMPRA_ITEM B1'#13#10'              LEFT JOIN SUP_' +
      'RATIF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID_COMP' +
      'RA_ITEM'#13#10'              LEFT JOIN SUP_RATIF_FICHA         E1 ON E' +
      '1.ID_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'            ' +
      '  LEFT JOIN SUP_RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM      ' +
      '    = E1.ID_RATIF_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMPENH' +
      'O_FICHA G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'   ' +
      '           LEFT JOIN SUP_SOLIC_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_E' +
      'MPENHO_ITEM  = G1.ID_SOLIC_EMPENHO_ITEM'#13#10'              LEFT JOIN' +
      ' SUP_SOLIC_EMPENHO       H1 ON H1.ID_SOLIC_EMPENHO       = J1.ID' +
      '_SOLIC_EMPENHO'#13#10'        WHERE B1.ID_SOLICITACAO_COMPRA = A.ID_SO' +
      'LICITACAO_COMPRA'#13#10'          AND F1.ID_COMPRA_ITEM        = B1.ID' +
      '_COMPRA_ITEM'#13#10'          AND H1.ID_ST_SOLIC_EMPENHO   = :ST_PEDID' +
      'O_COMPOSICAO_CANCELADO ) AS QTD_SE_CANCELADO'#13#10'    '#13#10'     ,(SELEC' +
      'T COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10'         FROM SUP_COMPRA_IT' +
      'EM B1'#13#10'              LEFT JOIN SUP_RATIF_FICHA_DADOS   F1 ON F1.' +
      'ID_COMPRA_ITEM         = B1.ID_COMPRA_ITEM'#13#10'              LEFT J' +
      'OIN SUP_RATIF_FICHA         E1 ON E1.ID_RATIF_FICHA_DADOS   = F1' +
      '.ID_RATIF_FICHA_DADOS'#13#10'              LEFT JOIN SUP_RATIF_ITEM   ' +
      '       D1 ON D1.ID_RATIF_ITEM          = E1.ID_RATIF_ITEM'#13#10'     ' +
      '         LEFT JOIN SUP_SOLIC_EMPENHO_FICHA G1 ON G1.ID_RATIF_FIC' +
      'HA         = E1.ID_RATIF_FICHA'#13#10'              LEFT JOIN SUP_SOLI' +
      'C_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_EMPENHO_ITEM  = G1.ID_SOLIC_EM' +
      'PENHO_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMPENHO       H1 O' +
      'N H1.ID_SOLIC_EMPENHO       = J1.ID_SOLIC_EMPENHO'#13#10'        WHERE' +
      ' B1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'          A' +
      'ND F1.ID_COMPRA_ITEM        = B1.ID_COMPRA_ITEM'#13#10'          AND H' +
      '1.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOSICAO_LIBERADO ) AS QT' +
      'D_SE_LIBERADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT A3.ID_COMPRA_ITEM)' +
      #13#10'         FROM (SELECT B1.ID_COMPRA_ITEM'#13#10'                    ,' +
      ' SUM( COALESCE(G1.QTD, G1.VALOR)'#13#10'                         - COA' +
      'LESCE( (SELECT SUM(COALESCE(B4.QTD, B4.VALOR, 0))'#13#10'             ' +
      '                           FROM SUP_SOLIC_ESTORNO A4'#13#10'          ' +
      '                                   LEFT JOIN SUP_SOLIC_EMPENHO_I' +
      'TEM   E4 ON E4.ID_SOLIC_ESTORNO      = A4.ID_SOLIC_ESTORNO'#13#10'    ' +
      '                                         LEFT JOIN SUP_SOLIC_EMP' +
      'ENHO_FICHA  B4 ON B4.ID_SOLIC_EMPENHO_ITEM = E4.ID_SOLIC_EMPENHO' +
      '_ITEM'#13#10'                                             LEFT JOIN SU' +
      'P_RATIF_FICHA          C4 ON C4.ID_RATIF_FICHA        = B4.ID_RA' +
      'TIF_FICHA'#13#10'                                       WHERE A4.ID_SO' +
      'LIC_EMPENHO    = H1.ID_SOLIC_EMPENHO'#13#10'                          ' +
      '               AND A4.ID_ST_SOLIC_EMPENHO = :ST_PEDIDO_COMPOSICA' +
      'O_LANCADO'#13#10'                                         AND C4.ID_RA' +
      'TIF_ITEM       = D1.ID_RATIF_ITEM), 0) ) AS TOTAL_EMPENHADO'#13#10'   ' +
      '                 , SUM( (SELECT SUM(COALESCE(A2.QTD, A2.VALOR))'#13 +
      #10'                              FROM SUP_AUTORIZACAO_FICHA A2'#13#10'  ' +
      '                                 LEFT JOIN SUP_AUTORIZACAO B2 ON' +
      ' B2.ID_AUTORIZACAO = A2.ID_AUTORIZACAO'#13#10'                        ' +
      '     WHERE A2.ID_SOLIC_EMPENHO_FICHA = G1.ID_SOLIC_EMPENHO_FICHA' +
      #13#10'                               AND B2.ID_ST_AUTORIZACAO     <>' +
      ' :ST_AUTORIZACAO_CANCELADO ) ) AS TOTAL_AUTORIZACAO'#13#10'           ' +
      '      FROM SUP_COMPRA_ITEM B1'#13#10'                      LEFT JOIN S' +
      'UP_RATIF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID_C' +
      'OMPRA_ITEM'#13#10'                      LEFT JOIN SUP_RATIF_FICHA     ' +
      '    E1 ON E1.ID_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10' ' +
      '                     LEFT JOIN SUP_RATIF_ITEM          D1 ON D1.' +
      'ID_RATIF_ITEM          = E1.ID_RATIF_ITEM'#13#10'                     ' +
      ' LEFT JOIN SUP_SOLIC_EMPENHO_FICHA G1 ON G1.ID_RATIF_FICHA      ' +
      '   = E1.ID_RATIF_FICHA'#13#10'                      LEFT JOIN SUP_SOLI' +
      'C_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_EMPENHO_ITEM  = G1.ID_SOLIC_EM' +
      'PENHO_ITEM'#13#10'                      LEFT JOIN SUP_SOLIC_EMPENHO   ' +
      '    H1 ON H1.ID_SOLIC_EMPENHO       = J1.ID_SOLIC_EMPENHO'#13#10'     ' +
      '           WHERE B1.ID_SOLICITACAO_COMPRA  = A.ID_SOLICITACAO_CO' +
      'MPRA'#13#10'                  AND F1.ID_COMPRA_ITEM         = B1.ID_CO' +
      'MPRA_ITEM'#13#10'                  AND H1.ID_ST_SOLIC_EMPENHO    = 1'#13#10 +
      '                GROUP BY'#13#10'                      B1.ID_COMPRA_ITE' +
      'M'#13#10'              ) A3'#13#10'        WHERE UDF_ROUNDDEC(A3.TOTAL_EMPEN' +
      'HADO, 4) - UDF_ROUNDDEC(A3.TOTAL_AUTORIZACAO, 4) > 0 ) AS QTD_SE' +
      '_EMPENHADO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10' ' +
      '        FROM SUP_COMPRA_ITEM B1'#13#10'              LEFT JOIN SUP_RAT' +
      'IF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID_COMPRA_' +
      'ITEM'#13#10'              LEFT JOIN SUP_RATIF_FICHA         E1 ON E1.I' +
      'D_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'              L' +
      'EFT JOIN SUP_RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM         ' +
      ' = E1.ID_RATIF_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMPENHO_F' +
      'ICHA G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'      ' +
      '        LEFT JOIN SUP_SOLIC_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_EMPE' +
      'NHO_ITEM  = G1.ID_SOLIC_EMPENHO_ITEM'#13#10'              LEFT JOIN SU' +
      'P_SOLIC_ESTORNO       H1 ON H1.ID_SOLIC_ESTORNO       = J1.ID_SO' +
      'LIC_ESTORNO'#13#10'        WHERE B1.ID_SOLICITACAO_COMPRA  = A.ID_SOLI' +
      'CITACAO_COMPRA'#13#10'          AND F1.ID_COMPRA_ITEM         = B1.ID_' +
      'COMPRA_ITEM'#13#10'          AND H1.ID_ST_SOLIC_EMPENHO    = 0  ) AS Q' +
      'TD_SEE'#13#10'    '#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_ITEM)'#13#10' ' +
      '        FROM SUP_COMPRA_ITEM B1'#13#10'              LEFT JOIN SUP_RAT' +
      'IF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID_COMPRA_' +
      'ITEM'#13#10'              LEFT JOIN SUP_RATIF_FICHA         E1 ON E1.I' +
      'D_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'              L' +
      'EFT JOIN SUP_RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM         ' +
      ' = E1.ID_RATIF_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMPENHO_F' +
      'ICHA G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'      ' +
      '        LEFT JOIN SUP_SOLIC_EMPENHO_ITEM  J1 ON J1.ID_SOLIC_EMPE' +
      'NHO_ITEM  = G1.ID_SOLIC_EMPENHO_ITEM'#13#10'              LEFT JOIN SU' +
      'P_SOLIC_ESTORNO       H1 ON H1.ID_SOLIC_ESTORNO       = J1.ID_SO' +
      'LIC_ESTORNO'#13#10'        WHERE B1.ID_SOLICITACAO_COMPRA = A.ID_SOLIC' +
      'ITACAO_COMPRA'#13#10'          AND F1.ID_COMPRA_ITEM        = B1.ID_CO' +
      'MPRA_ITEM'#13#10'          AND H1.ID_ST_SOLIC_EMPENHO   = 3  ) AS QTD_' +
      'SEE_LIBERADO'#13#10'    '#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_IT' +
      'EM)'#13#10'         FROM SUP_COMPRA_ITEM B1'#13#10'              LEFT JOIN S' +
      'UP_RATIF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID_C' +
      'OMPRA_ITEM'#13#10'              LEFT JOIN SUP_RATIF_FICHA         E1 O' +
      'N E1.ID_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'         ' +
      '     LEFT JOIN SUP_RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM   ' +
      '       = E1.ID_RATIF_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_EMP' +
      'ENHO_FICHA G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10 +
      '              LEFT JOIN SUP_SOLIC_EMPENHO_ITEM  J1 ON J1.ID_SOLI' +
      'C_EMPENHO_ITEM  = G1.ID_SOLIC_EMPENHO_ITEM'#13#10'              LEFT J' +
      'OIN SUP_SOLIC_ESTORNO       H1 ON H1.ID_SOLIC_ESTORNO       = J1' +
      '.ID_SOLIC_ESTORNO'#13#10'        WHERE B1.ID_SOLICITACAO_COMPRA = A.ID' +
      '_SOLICITACAO_COMPRA'#13#10'          AND F1.ID_COMPRA_ITEM        = B1' +
      '.ID_COMPRA_ITEM'#13#10'          AND H1.ID_ST_SOLIC_EMPENHO   = 1   ) ' +
      'AS QTD_SEE_ESTORNADO'#13#10'    '#13#10'     ,(SELECT COUNT(DISTINCT A3.ID_C' +
      'OMPRA_ITEM)'#13#10'         FROM (SELECT B1.ID_COMPRA_ITEM'#13#10'          ' +
      '          , SUM(COALESCE(J1.QTD, J1.VALOR)) AS TOTAL_AUTORIZACAO' +
      #13#10'                    , SUM( (SELECT SUM(COALESCE(A2.QTD, A2.VAL' +
      'OR))'#13#10'                              FROM SUP_LIBERACAO_NF_FICHA ' +
      'A2'#13#10'                                   LEFT JOIN SUP_LIBERACAO_N' +
      'F B2 ON B2.ID_LIBERACAO_NF = A2.ID_LIBERACAO_NF'#13#10'               ' +
      '              WHERE A2.ID_AUTORIZACAO_FICHA = J1.ID_AUTORIZACAO_' +
      'FICHA'#13#10'                               AND B2.ID_ST_LIBERACAO_NF ' +
      ' <> :ST_LIBERACAO_NF_EXCLUIDO'#13#10'                               AN' +
      'D B2.ID_ST_LIBERACAO_NF  <> :ST_LIBERACAO_NF_ESTORNADO ) ) AS TO' +
      'TAL_LIBERACAO_NF'#13#10'                 FROM SUP_COMPRA_ITEM B1'#13#10'    ' +
      '                  LEFT JOIN SUP_RATIF_FICHA_DADOS   F1 ON F1.ID_' +
      'COMPRA_ITEM         = B1.ID_COMPRA_ITEM'#13#10'                      L' +
      'EFT JOIN SUP_RATIF_FICHA         E1 ON E1.ID_RATIF_FICHA_DADOS  ' +
      ' = F1.ID_RATIF_FICHA_DADOS'#13#10'                      LEFT JOIN SUP_' +
      'RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM          = E1.ID_RATI' +
      'F_ITEM'#13#10'                      LEFT JOIN SUP_SOLIC_EMPENHO_FICHA ' +
      'G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'           ' +
      '           LEFT JOIN SUP_AUTORIZACAO_FICHA   J1 ON J1.ID_SOLIC_E' +
      'MPENHO_FICHA = G1.ID_SOLIC_EMPENHO_FICHA'#13#10'                      ' +
      'LEFT JOIN SUP_AUTORIZACAO         L1 ON L1.ID_AUTORIZACAO       ' +
      '  = J1.ID_AUTORIZACAO'#13#10'                WHERE B1.ID_SOLICITACAO_C' +
      'OMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'                  AND F1.ID_COM' +
      'PRA_ITEM = B1.ID_COMPRA_ITEM'#13#10'                  AND L1.ID_ST_AUT' +
      'ORIZACAO <> :ST_AUTORIZACAO_CANCELADO'#13#10'                GROUP BY'#13 +
      #10'                      B1.ID_COMPRA_ITEM'#13#10'              ) A3'#13#10'  ' +
      '      WHERE (0 = :UTILIZA_LIBERACAO_NF OR UDF_ROUNDDEC(A3.TOTAL_' +
      'AUTORIZACAO, 4) - UDF_ROUNDDEC(A3.TOTAL_LIBERACAO_NF, 4) > 0) ) ' +
      'AS QTD_AUTORIZACAO'#13#10#13#10'     ,(SELECT COUNT(DISTINCT B1.ID_COMPRA_' +
      'ITEM)'#13#10'         FROM SUP_COMPRA_ITEM B1'#13#10'              LEFT JOIN' +
      ' SUP_RATIF_FICHA_DADOS   F1 ON F1.ID_COMPRA_ITEM         = B1.ID' +
      '_COMPRA_ITEM'#13#10'              LEFT JOIN SUP_RATIF_FICHA         E1' +
      ' ON E1.ID_RATIF_FICHA_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'       ' +
      '       LEFT JOIN SUP_RATIF_ITEM          D1 ON D1.ID_RATIF_ITEM ' +
      '         = E1.ID_RATIF_ITEM'#13#10'              LEFT JOIN SUP_SOLIC_E' +
      'MPENHO_FICHA G1 ON G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA' +
      #13#10'              LEFT JOIN SUP_AUTORIZACAO_FICHA   J1 ON J1.ID_SO' +
      'LIC_EMPENHO_FICHA = G1.ID_SOLIC_EMPENHO_FICHA'#13#10'              LEF' +
      'T JOIN SUP_LIBERACAO_NF_FICHA  M1 ON M1.ID_AUTORIZACAO_FICHA   =' +
      ' J1.ID_AUTORIZACAO_FICHA'#13#10'              LEFT JOIN SUP_LIBERACAO_' +
      'NF        N1 ON N1.ID_LIBERACAO_NF        = M1.ID_LIBERACAO_NF'#13#10 +
      '        WHERE B1.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA' +
      #13#10'          AND F1.ID_COMPRA_ITEM        = B1.ID_COMPRA_ITEM'#13#10'  ' +
      '        AND N1.ID_ST_LIBERACAO_NF   <> :ST_LIBERACAO_NF_EXCLUIDO' +
      #13#10'          AND N1.ID_ST_LIBERACAO_NF   <> :ST_LIBERACAO_NF_ESTO' +
      'RNADO ) AS QTD_LIBERACAO_NF'#13#10#13#10'  FROM SUP_SOLICITACAO_COMPRA A'#13#10 +
      '       LEFT JOIN AAC_USUARIOS       B ON B.CODIGO_USUARIO     = ' +
      'A.ID_SOLICITANTE'#13#10'       LEFT JOIN SUP_CENTRO_CONSUMO C ON C.ID_' +
      'CENTRO_CONSUMO  = A.ID_CENTRO_CONSUMO'#13#10'       LEFT JOIN SUP_UNID' +
      'ADE_ADM    D ON D.ID_UNIDADE_ADM     = C.ID_UNIDADE_ADM'#13#10#13#10' WHER' +
      'E A.NR_SOLICITACAO_COMPRA = :NR_SOLICITACAO_COMPRA'#13#10'   AND A.CP_' +
      'ANO = :CP_ANO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EXCLUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_LIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_APROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_REPROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO_DEF_COMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EM_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LANCADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LANCADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_EXCLUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_ESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_LIBERACAO_NF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_EXCLUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_ESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NR_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CP_ANO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 56
    Top = 71
  end
  object DspSolicitado: TDataSetProvider
    DataSet = SqlSolicitado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 56
    Top = 168
  end
  object SqlSolicitado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  H.NOME AS NOME_S' +
      'OLICITANTE,'#13#10'  H.NOME_COMPLETO AS NOME_COMPLETO_SOLICITANTE,'#13#10'  ' +
      'B.ESPECIFICACAO,'#13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  ' +
      'C.CD_MATERIAL,'#13#10'  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATER' +
      'IAL,'#13#10'  D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_' +
      'SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  ('#13#10'  S' +
      'ELECT FIRST 1'#13#10'    A1.DT_HISTORICO_SCOMPRA'#13#10'  FROM'#13#10'    SUP_HIST' +
      'ORICO_SCOMPRA A1'#13#10'  WHERE'#13#10'    A1.ID_SOLICITACAO_COMPRA = A.ID_S' +
      'OLICITACAO_COMPRA'#13#10'    AND A1.ST_SOLICITACAO_COMPRA = A.ST_SOLIC' +
      'ITACAO_COMPRA'#13#10'  ORDER BY'#13#10'    A1.ID_HISTORICO_SCOMPRA DESC'#13#10'  )' +
      ' AS DATA'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMP' +
      'RA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10 +
      '  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  L' +
      'EFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP' +
      '_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_S' +
      'ERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN' +
      ' SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_' +
      'PAI'#13#10'  LEFT JOIN AAC_USUARIOS H ON H.CODIGO_USUARIO = A.ID_SOLIC' +
      'ITANTE'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPR' +
      'A'#13#10'  AND A.ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_ABERTO' +
      #13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_ABERTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 56
    Top = 215
  end
  object DspLiberado: TDataSetProvider
    DataSet = SqlLiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 136
    Top = 168
  end
  object SqlLiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  H.NOME AS NOME_S' +
      'OLICITANTE,'#13#10'  H.NOME_COMPLETO AS NOME_COMPLETO_SOLICITANTE,'#13#10'  ' +
      'B.ESPECIFICACAO,'#13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  ' +
      'C.CD_MATERIAL,'#13#10'  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATER' +
      'IAL,'#13#10'  D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_' +
      'SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  ('#13#10'  S' +
      'ELECT FIRST 1'#13#10'    A1.DT_HISTORICO_SCOMPRA'#13#10'  FROM'#13#10'    SUP_HIST' +
      'ORICO_SCOMPRA A1'#13#10'  WHERE'#13#10'    A1.ID_SOLICITACAO_COMPRA = A.ID_S' +
      'OLICITACAO_COMPRA'#13#10'    AND A1.ST_SOLICITACAO_COMPRA = A.ST_SOLIC' +
      'ITACAO_COMPRA'#13#10'  ORDER BY'#13#10'    A1.ID_HISTORICO_SCOMPRA DESC'#13#10'  )' +
      ' AS DATA'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMP' +
      'RA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10 +
      '  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  L' +
      'EFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP' +
      '_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_S' +
      'ERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN' +
      ' SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_' +
      'PAI'#13#10'  LEFT JOIN AAC_USUARIOS H ON H.CODIGO_USUARIO = A.ID_SOLIC' +
      'ITANTE'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPR' +
      'A'#13#10'  AND A.ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_LIBERA' +
      'DO'#13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_ABERTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ST_SOLICITACAO_COMPRA_LIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 136
    Top = 215
  end
  object DspAprovado: TDataSetProvider
    DataSet = SqlAprovado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 216
    Top = 168
  end
  object SqlAprovado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  H.NOME AS NOME_A' +
      'PROVADOR,'#13#10'  H.NOME_COMPLETO AS NOME_COMPLETO_APROVADOR,'#13#10'  B.ES' +
      'PECIFICACAO,'#13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD' +
      '_MATERIAL,'#13#10'  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,' +
      #13#10'  D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERV' +
      'ICO AS CD_SUBGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  ('#13#10'  SELEC' +
      'T FIRST 1'#13#10'    A1.DT_HISTORICO_SCOMPRA'#13#10'  FROM'#13#10'    SUP_HISTORIC' +
      'O_SCOMPRA A1'#13#10'  WHERE'#13#10'    A1.ID_SOLICITACAO_COMPRA = A.ID_SOLIC' +
      'ITACAO_COMPRA'#13#10'    AND A1.ST_SOLICITACAO_COMPRA = A.ST_SOLICITAC' +
      'AO_COMPRA'#13#10'  ORDER BY'#13#10'    A1.ID_HISTORICO_SCOMPRA DESC'#13#10'  ) AS ' +
      'DATA'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_I' +
      'TEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LE' +
      'FT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT ' +
      'JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRU' +
      'PO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVI' +
      'CO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP' +
      '_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13 +
      #10'  LEFT JOIN AAC_USUARIOS H ON H.CODIGO_USUARIO = A.ID_APROVADOR' +
      #13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  A' +
      'ND A.ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_APROVADO'#13#10'  ' +
      'AND (B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_ABERTO OR (B.ST_COMPRA_I' +
      'TEM = :ST_COMPRA_ITEM_LIBERADO_DOT AND 0 = :UTILIZA_APROV_FIN))'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_APROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 216
    Top = 215
  end
  object DspAprovFin: TDataSetProvider
    DataSet = SqlAprovFin
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 376
    Top = 168
  end
  object SqlAprovFin: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOI' +
      'N SUP_COMPRA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACA' +
      'O_COMPRA'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MAT' +
      'ERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEF' +
      'T JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN S' +
      'UP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10' ' +
      ' LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUP' +
      'O_SERVICO_PAI'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACA' +
      'O_COMPRA'#13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIBERADO_DOT'#13 +
      #10'  AND 1 = :UTILIZA_APROV_FIN'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 376
    Top = 215
  end
  object DspAprovFinReprov: TDataSetProvider
    DataSet = SqlAprovFinReprov
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 464
    Top = 168
  end
  object SqlAprovFinReprov: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO,'#13#10'  (SELECT FIRST 1 A1.JUSTIFICATIVA FROM SUP' +
      '_HISTORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_IT' +
      'EM AND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS JUSTIFICATIVA'#13#10'F' +
      'ROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM B O' +
      'N B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN' +
      ' SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT JOIN SU' +
      'P_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRUPO E ON' +
      ' E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO F ON' +
      ' F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP_GRUPO_' +
      'SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10'WHERE'#13 +
      #10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  AND B.ST_' +
      'COMPRA_ITEM = :ST_COMPRA_ITEM_NAO_LIBERADO_DOT'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_DOT'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 464
    Top = 215
  end
  object DspReprovado: TDataSetProvider
    DataSet = SqlReprovado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 296
    Top = 168
  end
  object SqlReprovado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  H.NOME AS NOME_A' +
      'PROVADOR,'#13#10'  H.NOME_COMPLETO AS NOME_COMPLETO_APROVADOR,'#13#10'  B.ES' +
      'PECIFICACAO,'#13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD' +
      '_MATERIAL,'#13#10'  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,' +
      #13#10'  D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERV' +
      'ICO AS CD_SUBGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  ('#13#10'  SELEC' +
      'T FIRST 1'#13#10'    A1.DT_HISTORICO_SCOMPRA'#13#10'  FROM'#13#10'    SUP_HISTORIC' +
      'O_SCOMPRA A1'#13#10'  WHERE'#13#10'    A1.ID_SOLICITACAO_COMPRA = A.ID_SOLIC' +
      'ITACAO_COMPRA'#13#10'    AND A1.ST_SOLICITACAO_COMPRA = A.ST_SOLICITAC' +
      'AO_COMPRA'#13#10'  ORDER BY'#13#10'    A1.ID_HISTORICO_SCOMPRA DESC'#13#10'  ) AS ' +
      'DATA'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_I' +
      'TEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LE' +
      'FT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT ' +
      'JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRU' +
      'PO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVI' +
      'CO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP' +
      '_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13 +
      #10'  LEFT JOIN AAC_USUARIOS H ON H.CODIGO_USUARIO = A.ID_APROVADOR' +
      #13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  A' +
      'ND A.ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_REPROVADO'#13#10' ' +
      ' AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_ABERTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_REPROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_ABERTO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 296
    Top = 215
  end
  object DspDefDotLiberado: TDataSetProvider
    DataSet = SqlDefDotLiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 56
    Top = 280
  end
  object SqlDefDotLiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOI' +
      'N SUP_COMPRA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACA' +
      'O_COMPRA'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MAT' +
      'ERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEF' +
      'T JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN S' +
      'UP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10' ' +
      ' LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUP' +
      'O_SERVICO_PAI'#13#10'  LEFT JOIN SUP_COMPRA_ITEM_ID H ON H.ID_COMPRA_I' +
      'TEM_ID = B.ID_COMPRA_ITEM_ID'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA =' +
      ' :ID_SOLICITACAO_COMPRA'#13#10'  AND (((0 = :UTILIZA_DEF_COMPRADOR OR ' +
      'A.TP_SOLICITACAO <> :TP_SOLICITACAO_NORMAL) AND B.ST_COMPRA_ITEM' +
      ' = :ST_COMPRA_ITEM_LIBERADO_COMPRA AND H.ID_COMPRA_ITEM_ID IS NU' +
      'LL) OR (1 = :UTILIZA_DEF_COMPRADOR AND B.ST_COMPRA_ITEM = :ST_CO' +
      'MPRA_ITEM_LIB_LIBERACAO))'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_LIBERACAO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 56
    Top = 327
  end
  object DspDefDotNaoLiberado: TDataSetProvider
    DataSet = SqlDefDotNaoLiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 168
    Top = 280
  end
  object SqlDefDotNaoLiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO,'#13#10'  (SELECT FIRST 1 A1.JUSTIFICATIVA FROM SUP' +
      '_HISTORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_IT' +
      'EM AND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS JUSTIFICATIVA'#13#10'F' +
      'ROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM B O' +
      'N B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN' +
      ' SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT JOIN SU' +
      'P_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRUPO E ON' +
      ' E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO F ON' +
      ' F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP_GRUPO_' +
      'SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10'  LEFT' +
      ' JOIN SUP_COMPRA_ITEM_ID H ON H.ID_COMPRA_ITEM_ID = B.ID_COMPRA_' +
      'ITEM_ID'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMP' +
      'RA'#13#10'  AND (((0 = :UTILIZA_DEF_COMPRADOR OR A.TP_SOLICITACAO <> :' +
      'TP_SOLICITACAO_NORMAL) AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_NA' +
      'O_LIBERADO_COMPRA) OR (1 = :UTILIZA_DEF_COMPRADOR AND B.ST_COMPR' +
      'A_ITEM = :ST_COMPRA_ITEM_NAO_LIB_LIBERACAO))'#13#10'  AND H.ID_COMPRA_' +
      'ITEM_ID IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIB_LIBERACAO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 168
    Top = 327
  end
  object DspDefComprador: TDataSetProvider
    DataSet = SqlDefComprador
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 520
    Top = 280
  end
  object SqlDefComprador: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  H.DT_COMPRA_ITEM_ID AS' +
      ' DATA,'#13#10'  I.NOME,'#13#10'  I.NOME_COMPLETO,'#13#10#13#10' (SELECT REPLACE(LIST(T' +
      'RIM(B1.NOME), '#39',##'#39'), '#39'##'#39', UDF_CHR(13)) FROM SUP_COMPRADOR_ITEM' +
      ' A1 LEFT JOIN AAC_USUARIOS B1 ON B1.CODIGO_USUARIO = A1.ID_COMPR' +
      'ADOR WHERE A1.ID_COMPRA_ITEM_ID = B.ID_COMPRA_ITEM_ID) AS COMPRA' +
      'DORES'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_' +
      'ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  L' +
      'EFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT' +
      ' JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GR' +
      'UPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERV' +
      'ICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SU' +
      'P_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI' +
      #13#10'  LEFT JOIN SUP_COMPRA_ITEM_ID H ON H.ID_COMPRA_ITEM_ID = B.ID' +
      '_COMPRA_ITEM_ID'#13#10'  LEFT JOIN AAC_USUARIOS I ON I.CODIGO_USUARIO ' +
      '= H.ID_USUARIO'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITAC' +
      'AO_COMPRA'#13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIBERADO_COM' +
      'PRA'#13#10'  AND H.ID_COMPRA_ITEM_ID IS NOT NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 520
    Top = 327
  end
  object DspRecusado: TDataSetProvider
    DataSet = SqlRecusado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 136
    Top = 392
  end
  object SqlRecusado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT REPLACE(LIST(T' +
      'RIM(B1.NOME), '#39',##'#39'), '#39'##'#39', UDF_CHR(13)) FROM SUP_COMPRADOR_ITEM' +
      ' A1 LEFT JOIN AAC_USUARIOS B1 ON B1.CODIGO_USUARIO = A1.ID_COMPR' +
      'ADOR WHERE A1.ID_COMPRA_ITEM_ID = B.ID_COMPRA_ITEM_ID) AS COMPRA' +
      'DORES,'#13#10'  (SELECT FIRST 1 A1.DT_HISTORICO_COMPRA_IT FROM SUP_HIS' +
      'TORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM A' +
      'ND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS DATA,'#13#10'  (SELECT FIR' +
      'ST 1 B2.NOME FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUAR' +
      'IOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_I' +
      'TEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM)' +
      ' AS NOME,'#13#10'  (SELECT FIRST 1 B2.NOME_COMPLETO FROM SUP_HISTORICO' +
      '_COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A' +
      '2.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.S' +
      'T_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME_COMPLETO,'#13#10'  (SELECT F' +
      'IRST 1 A1.JUSTIFICATIVA FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1' +
      '.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_' +
      'COMPRA_ITEM) AS JUSTIFICATIVA'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13 +
      #10'  LEFT JOIN SUP_COMPRA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID' +
      '_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL' +
      ' = B.ID_MATERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_G' +
      'RUPO'#13#10'  LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  ' +
      'LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO' +
      '_SERVICO'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO ' +
      '= F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'WHERE'#13#10' A.ID_SOLICITACAO_COMPRA = :I' +
      'D_SOLICITACAO_COMPRA'#13#10' AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_RE' +
      'CUSADO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 136
    Top = 439
  end
  object DspEmProcesso: TDataSetProvider
    DataSet = SqlEmProcesso
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 56
    Top = 392
  end
  object SqlEmProcesso: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  H.ID_PROCESSO_COMPRA,'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SER' +
      'VICO,'#13#10'  B.ESPECIFICACAO,'#13#10'  COALESCE(H.QTD, B.QTD) AS QTD,'#13#10'  H' +
      '.VL_TOTAL,'#13#10'  H.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10'  C.DS_MATERIAL' +
      ','#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRUPO AS CD_SUBGRU' +
      'PO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,' +
      #13#10'  G.CD_GRUPO_SERVICO,'#13#10'  J.NR_PROCESSO_COMPRA,'#13#10'  J.ANO_PROCES' +
      'SO_COMPRA,'#13#10'  L.NOME AS NOME_COMPRADOR,'#13#10'  L.NOME_COMPLETO AS NO' +
      'ME_COMPLETO_COMPRADOR,'#13#10'  J.NR_MODALIDADE,'#13#10'  J.ANO_MODALIDADE,'#13 +
      #10'  M.SIGLA,'#13#10'  (SELECT FIRST 1 A1.DT_HISTORICO_COMPRA_IT FROM SU' +
      'P_HISTORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_I' +
      'TEM AND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS DATA,'#13#10'  (SELEC' +
      'T FIRST 1 B2.NOME FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_' +
      'USUARIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COM' +
      'PRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_' +
      'ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.NOME_COMPLETO FROM SUP_HIST' +
      'ORICO_COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARI' +
      'O = A2.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND' +
      ' A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME_COMPLETO'#13#10'FROM'#13#10' ' +
      ' SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM B ON B.ID' +
      '_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN SUP_P' +
      'ROC_COMPRA_ITEM H ON H.ID_PROC_COMPRA_ITEM = B.ID_PROC_COMPRA_IT' +
      'EM'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = H.ID_MATERIAL'#13 +
      #10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN' +
      ' SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRU' +
      'PO_SERVICO F ON F.ID_GRUPO_SERVICO = H.ID_GRUPO_SERVICO'#13#10'  LEFT ' +
      'JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERV' +
      'ICO_PAI'#13#10'  LEFT JOIN SUP_RATIF_ITEM I ON I.ID_PROC_COMPRA_ITEM =' +
      ' H.ID_PROC_COMPRA_ITEM'#13#10'  LEFT JOIN SUP_PROCESSO_COMPRA J ON J.I' +
      'D_PROCESSO_COMPRA = H.ID_PROCESSO_COMPRA'#13#10'  LEFT JOIN AAC_USUARI' +
      'OS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'  LEFT JOIN SUP_MODAL' +
      'IDADE M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10'WHERE'#13#10'  A.ID_SOLI' +
      'CITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  AND B.ST_COMPRA_ITEM ' +
      '= :ST_COMPRA_ITEM_EM_PROCESSO'#13#10'  AND H.ANULADO = 0'#13#10'  AND I.ID_R' +
      'ATIF_ITEM IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EM_PROCESSO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 56
    Top = 439
  end
  object DspRatificado: TDataSetProvider
    DataSet = SqlRatificado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 224
    Top = 392
  end
  object SqlRatificado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13#10'       B.ESPECIF' +
      'ICACAO,'#13#10'       (A.TL_RATIFICADO - COALESCE(TL_SOLICITADO, 0)) A' +
      'S QTD,'#13#10'       (A.VL_RATIFICADO - COALESCE(VL_SOLICITADO, 0)) AS' +
      ' VL_TOTAL,'#13#10'       I.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'     ' +
      '  C.DS_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10 +
      '       D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.' +
      'CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERV' +
      'ICO,'#13#10'       CASE WHEN Q.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL' +
      #13#10'            THEN (SELECT FIRST 1 A1.DT_RATIFICACAO FROM SUP_RA' +
      'TIF_ITEM_HIST A1 WHERE A1.ID_RATIF_ITEM = I.ID_RATIF_ITEM)'#13#10'    ' +
      '        ELSE (SELECT FIRST 1 B1.DT_RATIFICACAO FROM SUP_RATIF_FI' +
      'CHA_DADOS A1 LEFT JOIN SUP_RATIF_FICHA_HIST B1 ON B1.ID_RATIF_FI' +
      'CHA_DADOS = A1.ID_RATIF_FICHA_DADOS WHERE A1.ID_COMPRA_ITEM = B.' +
      'ID_COMPRA_ITEM)'#13#10'       END AS DATA,'#13#10'       CASE WHEN Q.TP_SOLI' +
      'CITACAO = :TP_SOLICITACAO_NORMAL'#13#10'            THEN (SELECT FIRST' +
      ' 1 B2.NOME FROM SUP_RATIF_ITEM_HIST A2 LEFT JOIN AAC_USUARIOS B2' +
      ' ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_RATIF_ITEM = I' +
      '.ID_RATIF_ITEM)'#13#10'            ELSE (SELECT FIRST 1 C1.NOME FROM S' +
      'UP_RATIF_FICHA_DADOS A1 LEFT JOIN SUP_RATIF_FICHA_HIST B1 ON B1.' +
      'ID_RATIF_FICHA_DADOS = A1.ID_RATIF_FICHA_DADOS LEFT JOIN AAC_USU' +
      'ARIOS C1 ON C1.CODIGO_USUARIO = B1.ID_USUARIO WHERE A1.ID_COMPRA' +
      '_ITEM = B.ID_COMPRA_ITEM)'#13#10'       END AS NOME,'#13#10'       CASE WHEN' +
      ' Q.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10'            THEN (SE' +
      'LECT FIRST 1 B2.NOME_COMPLETO FROM SUP_RATIF_ITEM_HIST A2 LEFT J' +
      'OIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A' +
      '2.ID_RATIF_ITEM = I.ID_RATIF_ITEM)'#13#10'            ELSE (SELECT FIR' +
      'ST 1 C1.NOME_COMPLETO FROM SUP_RATIF_FICHA_DADOS A1 LEFT JOIN SU' +
      'P_RATIF_FICHA_HIST B1 ON B1.ID_RATIF_FICHA_DADOS = A1.ID_RATIF_F' +
      'ICHA_DADOS LEFT JOIN AAC_USUARIOS C1 ON C1.CODIGO_USUARIO = B1.I' +
      'D_USUARIO WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM)'#13#10'       EN' +
      'D AS NOME_COMPLETO,'#13#10'       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_' +
      'PROCESSO_COMPRA,'#13#10'       L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOM' +
      'E_COMPLETO AS NOME_COMPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13 +
      #10'       J.ANO_MODALIDADE,'#13#10'       M.SIGLA,'#13#10'       N.NR_CONTRATO' +
      ','#13#10'       N.ANO_CONTRATO,'#13#10'       P.NOME_RAZAO AS DS_FORNECEDOR'#13 +
      #10'  FROM (SELECT B1.ID_COMPRA_ITEM'#13#10'             , SUM( (SELECT S' +
      'UM(COALESCE(A2.QTD, A2.VL_SERVICO, C2.QTD, C2.VL_TOTAL))'#13#10'      ' +
      '                 FROM SUP_RATIF_FICHA A2'#13#10'                      ' +
      '      LEFT JOIN SUP_RATIF_FICHA_DADOS B2 ON B2.ID_RATIF_FICHA_DA' +
      'DOS = A2.ID_RATIF_FICHA_DADOS'#13#10'                            LEFT ' +
      'JOIN SUP_RATIF_ITEM        C2 ON C2.ID_RATIF_ITEM        = A2.ID' +
      '_RATIF_ITEM'#13#10'                      WHERE A2.ID_RATIF_ITEM  = D1.' +
      'ID_RATIF_ITEM'#13#10'                        AND B2.ID_COMPRA_ITEM = B' +
      '1.ID_COMPRA_ITEM ) ) AS TL_RATIFICADO'#13#10'             , SUM(D1.VL_' +
      'TOTAL) AS VL_RATIFICADO'#13#10'             , SUM(COALESCE(E1.QTD_SOLI' +
      'CITADO, 0) )   AS TL_SOLICITADO'#13#10'             , SUM(COALESCE(E1.' +
      'VALOR_SOLICITADO, 0) ) AS VL_SOLICITADO'#13#10'          FROM SUP_SOLI' +
      'CITACAO_COMPRA A1'#13#10'               LEFT JOIN SUP_COMPRA_ITEM     ' +
      ' B1 ON B1.ID_SOLICITACAO_COMPRA  = A1.ID_SOLICITACAO_COMPRA'#13#10'   ' +
      '            LEFT JOIN SUP_PROC_COMPRA_ITEM C1 ON C1.ID_PROC_COMP' +
      'RA_ITEM    = B1.ID_PROC_COMPRA_ITEM'#13#10'               LEFT JOIN SU' +
      'P_RATIF_ITEM       D1 ON D1.ID_PROC_COMPRA_ITEM    = C1.ID_PROC_' +
      'COMPRA_ITEM'#13#10'                                                 OR' +
      ' D1.ID_RATIF_ITEM          = (SELECT FIRST 1 B3.ID_RATIF_ITEM'#13#10' ' +
      '                                                                ' +
      '                  FROM SUP_RATIF_FICHA_DADOS A3'#13#10'               ' +
      '                                                                ' +
      '         LEFT JOIN SUP_RATIF_FICHA B3 ON B3.ID_RATIF_FICHA_DADOS' +
      ' = A3.ID_RATIF_FICHA_DADOS'#13#10'                                    ' +
      '                                              WHERE A3.ID_COMPRA' +
      '_ITEM = B1.ID_COMPRA_ITEM )'#13#10'               LEFT JOIN (SELECT A3' +
      '.ID_RATIF_ITEM'#13#10'                               , E3.ID_COMPRA_IT' +
      'EM'#13#10'                               , SUM( COALESCE(B3.QTD, B3.VA' +
      'LOR)'#13#10'                                     -COALESCE( (SELECT SU' +
      'M(COALESCE(B4.QTD, B4.VALOR, 0))'#13#10'                              ' +
      '                     FROM SUP_SOLIC_ESTORNO A4'#13#10'                ' +
      '                                        LEFT JOIN SUP_SOLIC_EMPE' +
      'NHO_ITEM E4 ON E4.ID_SOLIC_ESTORNO = A4.ID_SOLIC_ESTORNO'#13#10'      ' +
      '                                                  LEFT JOIN SUP_' +
      'SOLIC_EMPENHO_FICHA B4 ON B4.ID_SOLIC_EMPENHO_ITEM = E4.ID_SOLIC' +
      '_EMPENHO_ITEM'#13#10'                                                 ' +
      '       LEFT JOIN SUP_RATIF_FICHA C4 ON C4.ID_RATIF_FICHA = B4.ID' +
      '_RATIF_FICHA'#13#10'                                                  ' +
      'WHERE A4.ID_SOLIC_EMPENHO     = C3.ID_SOLIC_EMPENHO'#13#10'           ' +
      '                                         AND A4.ID_ST_SOLIC_EMPE' +
      'NHO  = :ST_PEDIDO_COMPOSICAO_LANCADO'#13#10'                          ' +
      '                          AND C4.ID_RATIF_ITEM        = A3.ID_RA' +
      'TIF_ITEM                      ), 0) ) AS QTD_SOLICITADO'#13#10'       ' +
      '                        , SUM( B3.VALOR'#13#10'                       ' +
      '              -COALESCE( (SELECT SUM(B4.VALOR)'#13#10'                ' +
      '                                   FROM SUP_SOLIC_ESTORNO A4'#13#10'  ' +
      '                                                      LEFT JOIN ' +
      'SUP_SOLIC_EMPENHO_ITEM  E4 ON E4.ID_SOLIC_ESTORNO       = A4.ID_' +
      'SOLIC_ESTORNO'#13#10'                                                 ' +
      '       LEFT JOIN SUP_SOLIC_EMPENHO_FICHA B4 ON B4.ID_SOLIC_EMPEN' +
      'HO_ITEM  = E4.ID_SOLIC_EMPENHO_ITEM'#13#10'                           ' +
      '                             LEFT JOIN SUP_RATIF_FICHA         C' +
      '4 ON C4.ID_RATIF_FICHA         = B4.ID_RATIF_FICHA'#13#10'            ' +
      '                                      WHERE A4.ID_SOLIC_EMPENHO ' +
      '    = C3.ID_SOLIC_EMPENHO'#13#10'                                     ' +
      '               AND A4.ID_ST_SOLIC_EMPENHO  = :ST_PEDIDO_COMPOSIC' +
      'AO_LANCADO'#13#10'                                                    ' +
      'AND C4.ID_RATIF_ITEM        = A3.ID_RATIF_ITEM                  ' +
      '    ), 0) ) AS VALOR_SOLICITADO'#13#10#13#10'                            F' +
      'ROM SUP_RATIF_FICHA A3'#13#10'                                 LEFT  J' +
      'OIN SUP_RATIF_FICHA_DADOS   E3 ON E3.ID_RATIF_FICHA_DADOS   = A3' +
      '.ID_RATIF_FICHA_DADOS'#13#10'                                 INNER JO' +
      'IN SUP_SOLIC_EMPENHO_FICHA B3 ON B3.ID_RATIF_FICHA         = A3.' +
      'ID_RATIF_FICHA'#13#10'                                 LEFT  JOIN SUP_' +
      'SOLIC_EMPENHO_ITEM  F3 ON F3.ID_SOLIC_EMPENHO_ITEM  = B3.ID_SOLI' +
      'C_EMPENHO_ITEM'#13#10'                                 LEFT  JOIN SUP_' +
      'SOLIC_EMPENHO       C3 ON C3.ID_SOLIC_EMPENHO       = F3.ID_SOLI' +
      'C_EMPENHO'#13#10'                           WHERE C3.ID_SOLIC_EMPENHO ' +
      '<> :ST_PEDIDO_COMPOSICAO_CANCELADO'#13#10'                           G' +
      'ROUP BY'#13#10'                                 A3.ID_RATIF_ITEM,'#13#10'   ' +
      '                              E3.ID_COMPRA_ITEM'#13#10'               ' +
      '          ) E1 ON E1.ID_RATIF_ITEM = D1.ID_RATIF_ITEM AND E1.ID_' +
      'COMPRA_ITEM = B1.ID_COMPRA_ITEM'#13#10'                   WHERE A1.ID_' +
      'SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'                   ' +
      '  AND D1.ID_RATIF_ITEM IS NOT NULL'#13#10'                   GROUP BY'#13 +
      #10'                         B1.ID_COMPRA_ITEM'#13#10'       ) A'#13#10'       ' +
      'LEFT JOIN SUP_COMPRA_ITEM        B ON B.ID_COMPRA_ITEM         =' +
      ' A.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_SOLICITACAO_COMPRA Q ON ' +
      'Q.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       LEFT ' +
      'JOIN SUP_RATIF_FICHA_DADOS  T ON T.ID_COMPRA_ITEM         = B.ID' +
      '_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_FICHA        R ON R.ID_' +
      'RATIF_FICHA_DADOS   = T.ID_RATIF_FICHA_DADOS'#13#10'       LEFT JOIN S' +
      'UP_RATIF_ITEM         I ON I.ID_RATIF_ITEM          = R.ID_RATIF' +
      '_ITEM'#13#10'       LEFT JOIN SUP_MATERIAL           C ON C.ID_MATERIA' +
      'L            = I.ID_MATERIAL'#13#10'       LEFT JOIN SUP_GRUPO        ' +
      '      D ON D.ID_GRUPO               = C.ID_GRUPO'#13#10'       LEFT JO' +
      'IN SUP_GRUPO              E ON E.ID_GRUPO               = D.ID_G' +
      'RUPO_PAI'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO      F ON F.ID_GRUP' +
      'O_SERVICO       = I.ID_GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO' +
      '_SERVICO      G ON G.ID_GRUPO_SERVICO       = F.ID_GRUPO_SERVICO' +
      '_PAI'#13#10'       LEFT JOIN SUP_PROCESSO_COMPRA    J ON J.ID_PROCESSO' +
      '_COMPRA     = I.ID_PROCESSO_COMPRA'#13#10'       LEFT JOIN AAC_USUARIO' +
      'S           L ON L.CODIGO_USUARIO         = J.ID_COMPRADOR'#13#10'    ' +
      '   LEFT JOIN SUP_MODALIDADE         M ON M.ID_MODALIDADE        ' +
      '  = J.ID_MODALIDADE'#13#10'       LEFT JOIN SUP_CONTRATO           N O' +
      'N N.ID_CONTRATO            = I.ID_CONTRATO'#13#10'       LEFT JOIN SIS' +
      '_PESSOA             P ON P.ID_PESSOA              = N.ID_CREDOR'#13 +
      #10#13#10' WHERE UDF_ROUNDDEC(A.TL_RATIFICADO, 4) - UDF_ROUNDDEC(A.TL_S' +
      'OLICITADO, 4) > 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LANCADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LANCADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 224
    Top = 439
  end
  object DspAnulado: TDataSetProvider
    DataSet = SqlAnulado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 304
    Top = 392
  end
  object SqlAnulado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.ESPECIFICACAO,'#13#10'  B.UN_SERVICO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  J.NR_PROCESSO_COMPRA,'#13 +
      #10'  J.ANO_PROCESSO_COMPRA,'#13#10'  L.NOME AS NOME_COMPRADOR,'#13#10'  L.NOME' +
      '_COMPLETO AS NOME_COMPLETO_COMPRADOR,'#13#10'  J.NR_MODALIDADE,'#13#10'  J.A' +
      'NO_MODALIDADE,'#13#10'  M.SIGLA,'#13#10'  H.JUSTIFICATIVA_ANULACAO AS JUSTIF' +
      'ICATIVA,'#13#10'  H.DT_ANULACAO AS DATA,'#13#10'  N.NOME,'#13#10'  N.NOME_COMPLETO' +
      #13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM ' +
      'B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT J' +
      'OIN SUP_PROC_COMPRA_ITEM H ON H.ID_PROC_COMPRA_ITEM = B.ID_PROC_' +
      'COMPRA_ITEM'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = H.ID_' +
      'MATERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  ' +
      'LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOI' +
      'N SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = H.ID_GRUPO_SERVICO' +
      #13#10'  LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_G' +
      'RUPO_SERVICO_PAI'#13#10'  LEFT JOIN SUP_RATIF_ITEM I ON I.ID_PROC_COMP' +
      'RA_ITEM = H.ID_PROC_COMPRA_ITEM'#13#10'  LEFT JOIN SUP_PROCESSO_COMPRA' +
      ' J ON J.ID_PROCESSO_COMPRA = H.ID_PROCESSO_COMPRA'#13#10'  LEFT JOIN A' +
      'AC_USUARIOS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'  LEFT JOIN ' +
      'SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10'  LEFT JO' +
      'IN AAC_USUARIOS N ON N.CODIGO_USUARIO = H.ID_USUARIO_ANULACAO'#13#10'W' +
      'HERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  AND ' +
      'H.ANULADO = 1'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 304
    Top = 439
  end
  object DspSESolicitado: TDataSetProvider
    DataSet = SqlSESolicitado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 400
    Top = 392
  end
  object SqlSESolicitado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'MPENHO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_EMPENHO,'#13#10'       Q.DT_SOLI' +
      'CITACAO AS DATA,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO'#13#10'  FROM' +
      ' SUP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS    H ' +
      'ON H.ID_COMPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN' +
      ' SUP_RATIF_FICHA          A ON A.ID_RATIF_FICHA_DADOS   = H.ID_R' +
      'ATIF_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM           K ON' +
      ' K.ID_RATIF_ITEM          = A.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN ' +
      'SUP_MATERIAL             C ON C.ID_MATERIAL            = K.ID_MA' +
      'TERIAL'#13#10'       LEFT JOIN SUP_GRUPO                D ON D.ID_GRUP' +
      'O               = C.ID_GRUPO'#13#10'       LEFT JOIN SUP_GRUPO        ' +
      '        E ON E.ID_GRUPO               = D.ID_GRUPO_PAI'#13#10'       L' +
      'EFT JOIN SUP_GRUPO_SERVICO        F ON F.ID_GRUPO_SERVICO       ' +
      '= K.ID_GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO        ' +
      'G ON G.ID_GRUPO_SERVICO       = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'      ' +
      ' LEFT JOIN SUP_RATIF_FICHA_DADOS    O ON O.ID_COMPRA_ITEM       ' +
      '  = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_FICHA          ' +
      'N ON N.ID_RATIF_FICHA_DADOS   = O.ID_RATIF_FICHA_DADOS'#13#10'       L' +
      'EFT JOIN SUP_RATIF_ITEM           I ON I.ID_RATIF_ITEM          ' +
      '= N.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_PROCESSO_COMPRA      J' +
      ' ON J.ID_PROCESSO_COMPRA     = I.ID_PROCESSO_COMPRA'#13#10'       LEFT' +
      ' JOIN AAC_USUARIOS             L ON L.CODIGO_USUARIO         = J' +
      '.ID_COMPRADOR'#13#10'       LEFT JOIN SUP_MODALIDADE           M ON M.' +
      'ID_MODALIDADE          = J.ID_MODALIDADE'#13#10#13#10'       LEFT JOIN SUP' +
      '_SOLIC_EMPENHO_FICHA  P ON P.ID_RATIF_FICHA         = N.ID_RATIF' +
      '_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM   X ON X.ID_SOLI' +
      'C_EMPENHO_ITEM  = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       LEFT JOIN SUP_' +
      'SOLIC_EMPENHO        Q ON Q.ID_SOLIC_EMPENHO       = X.ID_SOLIC_' +
      'EMPENHO'#13#10'       LEFT JOIN SUP_CONTRATO             S ON S.ID_CON' +
      'TRATO            = I.ID_CONTRATO'#13#10'       LEFT JOIN SIS_PESSOA   ' +
      '            U ON U.ID_PESSOA              = S.ID_CREDOR'#13#10'       ' +
      'LEFT JOIN AAC_USUARIOS             V ON V.CODIGO_USUARIO        ' +
      ' = Q.ID_SOLICITANTE'#13#10' WHERE B.ID_SOLICITACAO_COMPRA = :ID_SOLICI' +
      'TACAO_COMPRA'#13#10'   AND Q.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOS' +
      'ICAO_ABERTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_ABERTO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 400
    Top = 439
  end
  object DspSELiberado: TDataSetProvider
    DataSet = SqlSELiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 488
    Top = 392
  end
  object SqlSELiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'MPENHO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_EMPENHO,'#13#10'       V.NOME,'#13#10 +
      '       V.NOME_COMPLETO,'#13#10'       Q.DT_LIBERACAO AS DATA'#13#10'  FROM S' +
      'UP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS H ON H.' +
      'ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_FI' +
      'CHA A ON A.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA_DADOS'#13#10'      ' +
      ' LEFT JOIN SUP_RATIF_ITEM K ON K.ID_RATIF_ITEM = A.ID_RATIF_ITEM' +
      #13#10#13#10'       LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = K.ID_MATE' +
      'RIAL'#13#10'       LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10' ' +
      '      LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'    ' +
      '   LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = K.ID_GR' +
      'UPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_' +
      'SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'       LEFT JOIN SUP_RATIF_F' +
      'ICHA_DADOS O ON O.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT' +
      ' JOIN SUP_RATIF_FICHA N ON N.ID_RATIF_FICHA_DADOS = O.ID_RATIF_F' +
      'ICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM I ON I.ID_RATIF_ITEM' +
      ' = N.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_PROCESSO_COMPRA J ON ' +
      'J.ID_PROCESSO_COMPRA = I.ID_PROCESSO_COMPRA'#13#10'       LEFT JOIN AA' +
      'C_USUARIOS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'       LEFT J' +
      'OIN SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10#13#10'   ' +
      '    LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RATIF_FICHA = N.' +
      'ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM X ON X.I' +
      'D_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       LEFT JOIN' +
      ' SUP_SOLIC_EMPENHO Q ON Q.ID_SOLIC_EMPENHO = X.ID_SOLIC_EMPENHO'#13 +
      #10'       LEFT JOIN SUP_CONTRATO S ON S.ID_CONTRATO = I.ID_CONTRAT' +
      'O'#13#10'       LEFT JOIN SIS_PESSOA U ON U.ID_PESSOA = S.ID_CREDOR'#13#10' ' +
      '      LEFT JOIN AAC_USUARIOS V ON V.CODIGO_USUARIO = Q.ID_USUARI' +
      'O_LIBERACAO'#13#10' WHERE B.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_CO' +
      'MPRA'#13#10'   AND Q.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOSICAO_LIB' +
      'ERADO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_LIBERADO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 488
    Top = 439
  end
  object DspSEEmpenhado: TDataSetProvider
    DataSet = SqlSEEmpenhado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 576
    Top = 392
  end
  object SqlSEEmpenhado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       (A.TL_EMPENHADO - COALESCE(TL_A' +
      'UTORIZACAO,0)) AS QTD,'#13#10'       (A.VL_EMPENHADO - COALESCE(VL_AUT' +
      'ORIZACAO,0)) AS VL_TOTAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_M' +
      'ATERIAL,'#13#10'       C.DS_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C' +
      '.TP_MATERIAL,'#13#10'       D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GR' +
      'UPO,'#13#10'       F.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       ' +
      'G.CD_GRUPO_SERVICO,'#13#10'       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_' +
      'PROCESSO_COMPRA,'#13#10'       L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOM' +
      'E_COMPLETO AS NOME_COMPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13 +
      #10'       J.ANO_MODALIDADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO' +
      ','#13#10'       S.ANO_CONTRATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,' +
      #13#10'       Q.NR_SOLIC_EMPENHO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_EMPEN' +
      'HO,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO,'#13#10'       Q.NR_EMPENH' +
      'O,'#13#10'       Q.DT_EMPENHO,'#13#10'       R.DT_HR_EXECUCAO AS DATA'#13#10'  FRO' +
      'M (SELECT H1.ID_SOLIC_EMPENHO'#13#10'             , B1.ID_COMPRA_ITEM'#13 +
      #10'             , SUM( COALESCE(G1.QTD, G1.VALOR) -'#13#10'             ' +
      '       COALESCE( (SELECT SUM(COALESCE(B4.QTD, B4.VALOR, 0))'#13#10'   ' +
      '                              FROM SUP_SOLIC_ESTORNO A4'#13#10'       ' +
      '                               LEFT JOIN SUP_SOLIC_EMPENHO_ITEM ' +
      ' E4 ON E4.ID_SOLIC_ESTORNO       = A4.ID_SOLIC_ESTORNO'#13#10'        ' +
      '                              LEFT JOIN SUP_SOLIC_EMPENHO_FICHA ' +
      'B4 ON B4.ID_SOLIC_EMPENHO_ITEM  = E4.ID_SOLIC_EMPENHO_ITEM'#13#10'    ' +
      '                                  LEFT JOIN SUP_RATIF_FICHA     ' +
      '    C4 ON C4.ID_RATIF_FICHA         = B4.ID_RATIF_FICHA'#13#10'       ' +
      '                         WHERE A4.ID_SOLIC_EMPENHO    = H1.ID_SO' +
      'LIC_EMPENHO'#13#10'                                  AND A4.ID_ST_SOLI' +
      'C_EMPENHO <> 2'#13#10'                                  AND C4.ID_RATI' +
      'F_ITEM = D1.ID_RATIF_ITEM), 0) ) AS TL_EMPENHADO'#13#10'             ,' +
      ' SUM( G1.VALOR -'#13#10'                    COALESCE( (SELECT SUM(B4.V' +
      'ALOR)'#13#10'                                 FROM SUP_SOLIC_ESTORNO A' +
      '4'#13#10'                                      LEFT JOIN SUP_SOLIC_EMP' +
      'ENHO_ITEM  E4 ON E4.ID_SOLIC_ESTORNO       = A4.ID_SOLIC_ESTORNO' +
      #13#10'                                      LEFT JOIN SUP_SOLIC_EMPE' +
      'NHO_FICHA B4 ON B4.ID_SOLIC_EMPENHO_ITEM  = E4.ID_SOLIC_EMPENHO_' +
      'ITEM'#13#10'                                      LEFT JOIN SUP_RATIF_' +
      'FICHA         C4 ON C4.ID_RATIF_FICHA         = B4.ID_RATIF_FICH' +
      'A'#13#10'                                WHERE A4.ID_SOLIC_EMPENHO = H' +
      '1.ID_SOLIC_EMPENHO'#13#10'                                  AND A4.ID_' +
      'ST_SOLIC_EMPENHO <> 2'#13#10'                                  AND C4.' +
      'ID_RATIF_ITEM = D1.ID_RATIF_ITEM), 0) ) AS VL_EMPENHADO'#13#10'       ' +
      '      , SUM(J1.QTD_AUTORIZADO ) AS TL_AUTORIZACAO'#13#10'             ' +
      ', SUM(J1.VL_AUTORIZADO )  AS VL_AUTORIZACAO'#13#10'          FROM SUP_' +
      'COMPRA_ITEM B1'#13#10'               LEFT JOIN SUP_RATIF_FICHA_DADOS  ' +
      '  F1 ON F1.ID_COMPRA_ITEM         = B1.ID_COMPRA_ITEM'#13#10'         ' +
      '      LEFT JOIN SUP_RATIF_FICHA          E1 ON E1.ID_RATIF_FICHA' +
      '_DADOS   = F1.ID_RATIF_FICHA_DADOS'#13#10'               LEFT JOIN SUP' +
      '_RATIF_ITEM           D1 ON D1.ID_RATIF_ITEM          = E1.ID_RA' +
      'TIF_ITEM'#13#10'               LEFT JOIN SUP_SOLIC_EMPENHO_FICHA  G1 O' +
      'N G1.ID_RATIF_FICHA         = E1.ID_RATIF_FICHA'#13#10'               ' +
      'LEFT JOIN SUP_SOLIC_EMPENHO_ITEM   L1 ON L1.ID_SOLIC_EMPENHO_ITE' +
      'M  = G1.ID_SOLIC_EMPENHO_ITEM'#13#10'               LEFT JOIN SUP_SOLI' +
      'C_EMPENHO        H1 ON H1.ID_SOLIC_EMPENHO       = L1.ID_SOLIC_E' +
      'MPENHO'#13#10'               LEFT JOIN (SELECT A2.ID_SOLIC_EMPENHO_FIC' +
      'HA'#13#10'                               , SUM(COALESCE(A2.QTD, A2.VAL' +
      'OR)) AS QTD_AUTORIZADO'#13#10'                               , SUM(A2.' +
      'VALOR)                   AS VL_AUTORIZADO'#13#10'                     ' +
      '       FROM SUP_AUTORIZACAO_FICHA A2'#13#10'                          ' +
      '       LEFT JOIN SUP_AUTORIZACAO B2 ON B2.ID_AUTORIZACAO = A2.ID' +
      '_AUTORIZACAO'#13#10'                           WHERE B2.ID_ST_AUTORIZA' +
      'CAO <> 2'#13#10'                           GROUP BY A2.ID_SOLIC_EMPENH' +
      'O_FICHA ) AS J1 ON J1.ID_SOLIC_EMPENHO_FICHA = G1.ID_SOLIC_EMPEN' +
      'HO_FICHA'#13#10'         WHERE B1.ID_SOLICITACAO_COMPRA = :ID_SOLICITA' +
      'CAO_COMPRA'#13#10'           AND F1.ID_COMPRA_ITEM        = B1.ID_COMP' +
      'RA_ITEM'#13#10'           AND H1.ID_ST_SOLIC_EMPENHO   = 1'#13#10'         G' +
      'ROUP BY'#13#10'               H1.ID_SOLIC_EMPENHO,'#13#10'               B1.' +
      'ID_COMPRA_ITEM'#13#10#13#10'       ) A'#13#10'       LEFT JOIN SUP_COMPRA_ITEM B' +
      ' ON B.ID_COMPRA_ITEM = A.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RA' +
      'TIF_FICHA_DADOS H ON H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'      ' +
      ' LEFT JOIN SUP_RATIF_FICHA I ON I.ID_RATIF_FICHA_DADOS = H.ID_RA' +
      'TIF_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM K ON K.ID_RATIF' +
      '_ITEM = I.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_MATERIAL C ON C.' +
      'ID_MATERIAL = K.ID_MATERIAL'#13#10'       LEFT JOIN SUP_GRUPO D ON D.I' +
      'D_GRUPO = C.ID_GRUPO'#13#10'       LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO' +
      ' = D.ID_GRUPO_PAI'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_' +
      'GRUPO_SERVICO = K.ID_GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_S' +
      'ERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'     ' +
      '  LEFT JOIN SUP_PROCESSO_COMPRA J ON J.ID_PROCESSO_COMPRA = K.ID' +
      '_PROCESSO_COMPRA'#13#10'       LEFT JOIN AAC_USUARIOS L ON L.CODIGO_US' +
      'UARIO = J.ID_COMPRADOR'#13#10'       LEFT JOIN SUP_MODALIDADE M ON M.I' +
      'D_MODALIDADE = J.ID_MODALIDADE'#13#10'       LEFT JOIN SUP_RATIF_FICHA' +
      ' N ON N.ID_RATIF_ITEM = K.ID_RATIF_ITEM'#13#10'       LEFT JOIN SUP_RA' +
      'TIF_FICHA_DADOS O ON O.ID_RATIF_FICHA_DADOS = N.ID_RATIF_FICHA_D' +
      'ADOS'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RATIF_F' +
      'ICHA = N.ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM' +
      ' Z ON Z.ID_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       ' +
      'LEFT JOIN SUP_SOLIC_EMPENHO Q ON Q.ID_SOLIC_EMPENHO = Z.ID_SOLIC' +
      '_EMPENHO'#13#10'       LEFT JOIN SUP_CONTRATO S ON S.ID_CONTRATO = K.I' +
      'D_CONTRATO'#13#10'       LEFT JOIN SIS_PESSOA U ON U.ID_PESSOA = S.ID_' +
      'CREDOR'#13#10#13#10'       LEFT JOIN API_PEDIDO_EMPENHO R ON R.ID_PEDIDO_C' +
      'OMPOSICAO = Q.ID_PEDIDO_COMPOSICAO'#13#10'       LEFT JOIN AAC_USUARIO' +
      'S V ON V.CODIGO_USUARIO = R.ID_USUARIO_EXECUCAO'#13#10#13#10' WHERE UDF_RO' +
      'UNDDEC(A.TL_EMPENHADO, 4) - UDF_ROUNDDEC(A.TL_AUTORIZACAO, 4) > ' +
      '0'#13#10'   AND Q.NR_EMPENHO IS NOT NULL'#13#10'   AND A.ID_SOLIC_EMPENHO = ' +
      'Q.ID_SOLIC_EMPENHO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 576
    Top = 439
  end
  object DspAutorizacao: TDataSetProvider
    DataSet = SqlAutorizacao
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 312
    Top = 502
  end
  object SqlAutorizacao: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPEC' +
      'IFICACAO,'#13#10'  (A.TL_AUTORIZACAO - COALESCE(A.TL_LIBERACAO_NF,0)) ' +
      'AS QTD,'#13#10'  (A.VL_AUTORIZACAO - COALESCE(A.VL_LIBERACAO_NF,0)) AS' +
      ' VL_TOTAL,'#13#10'  I.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10'  C.DS_MATERIAL' +
      ','#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRUPO AS CD_SUBGRU' +
      'PO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,' +
      #13#10'  G.CD_GRUPO_SERVICO,'#13#10'  J.NR_PROCESSO_COMPRA,'#13#10'  J.ANO_PROCES' +
      'SO_COMPRA,'#13#10'  L.NOME AS NOME_COMPRADOR,'#13#10'  L.NOME_COMPLETO AS NO' +
      'ME_COMPLETO_COMPRADOR,'#13#10'  J.NR_MODALIDADE,'#13#10'  J.ANO_MODALIDADE,'#13 +
      #10'  M.SIGLA,'#13#10'  S.NR_CONTRATO,'#13#10'  S.ANO_CONTRATO,'#13#10'  U.NOME_RAZAO' +
      ' AS DS_FORNECEDOR,'#13#10'  O.NR_AUTORIZACAO,'#13#10'  O.ANO_AUTORIZACAO,'#13#10' ' +
      ' O.DT_CADASTRO AS DATA,'#13#10'  Q.NOME,'#13#10'  Q.NOME_COMPLETO'#13#10'FROM'#13#10'  (' +
      #13#10'        SELECT'#13#10'            B1.ID_COMPRA_ITEM,'#13#10'            L1' +
      '.ID_AUTORIZACAO,'#13#10'            SUM(COALESCE(J1.QTD, J1.VALOR)) AS' +
      ' TL_AUTORIZACAO,'#13#10'            SUM(J1.VALOR) AS VL_AUTORIZACAO,'#13#10 +
      #13#10'            SUM(M1.QTD_LIBERADO ) AS TL_LIBERACAO_NF,'#13#10'       ' +
      '     SUM(M1.VL_LIBERADO ) AS VL_LIBERACAO_NF'#13#10'        FROM'#13#10'    ' +
      '        SUP_COMPRA_ITEM B1'#13#10'            LEFT JOIN SUP_RATIF_FICH' +
      'A_DADOS F1 ON F1.ID_COMPRA_ITEM = B1.ID_COMPRA_ITEM'#13#10'           ' +
      ' LEFT JOIN SUP_RATIF_FICHA E1 ON E1.ID_RATIF_FICHA_DADOS = F1.ID' +
      '_RATIF_FICHA_DADOS'#13#10'            LEFT JOIN SUP_RATIF_ITEM D1 ON D' +
      '1.ID_RATIF_ITEM = E1.ID_RATIF_ITEM'#13#10'            LEFT JOIN SUP_SO' +
      'LIC_EMPENHO_FICHA G1 ON G1.ID_RATIF_FICHA = E1.ID_RATIF_FICHA'#13#10' ' +
      '           LEFT JOIN SUP_AUTORIZACAO_FICHA J1 ON J1.ID_SOLIC_EMP' +
      'ENHO_FICHA = G1.ID_SOLIC_EMPENHO_FICHA'#13#10'            LEFT JOIN SU' +
      'P_AUTORIZACAO L1 ON L1.ID_AUTORIZACAO = J1.ID_AUTORIZACAO'#13#10'     ' +
      '       LEFT JOIN ('#13#10'                SELECT'#13#10'                    ' +
      'A2.ID_AUTORIZACAO_FICHA,'#13#10'                    SUM(COALESCE(A2.QT' +
      'D, A2.VALOR)) AS QTD_LIBERADO,'#13#10'                    SUM(A2.VALOR' +
      ') AS VL_LIBERADO'#13#10'                FROM'#13#10'                    SUP_' +
      'LIBERACAO_NF_FICHA A2'#13#10'                    LEFT JOIN SUP_LIBERAC' +
      'AO_NF B2 ON B2.ID_LIBERACAO_NF = A2.ID_LIBERACAO_NF'#13#10'           ' +
      '     WHERE'#13#10'                    B2.ID_ST_LIBERACAO_NF <> :ST_LIB' +
      'ERACAO_NF_EXCLUIDO'#13#10'                    AND B2.ID_ST_LIBERACAO_N' +
      'F <> :ST_LIBERACAO_NF_ESTORNADO'#13#10'                GROUP BY'#13#10'     ' +
      '               A2.ID_AUTORIZACAO_FICHA'#13#10'            ) AS M1 ON M' +
      '1.ID_AUTORIZACAO_FICHA = J1.ID_AUTORIZACAO_FICHA'#13#10'        WHERE'#13 +
      #10'            B1.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10 +
      '            AND F1.ID_COMPRA_ITEM = B1.ID_COMPRA_ITEM'#13#10'         ' +
      '   AND L1.ID_ST_AUTORIZACAO <> :ST_AUTORIZACAO_CANCELADO'#13#10'      ' +
      '  GROUP BY'#13#10'            B1.ID_COMPRA_ITEM,'#13#10'            L1.ID_AU' +
      'TORIZACAO'#13#10'  ) A'#13#10#13#10'  LEFT JOIN SUP_COMPRA_ITEM B ON B.ID_COMPRA' +
      '_ITEM = A.ID_COMPRA_ITEM'#13#10'  LEFT JOIN SUP_RATIF_FICHA_DADOS H ON' +
      ' H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'  LEFT JOIN SUP_RATIF_FICH' +
      'A N ON N.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA_DADOS'#13#10'  LEFT J' +
      'OIN SUP_RATIF_ITEM I ON I.ID_RATIF_ITEM = N.ID_RATIF_ITEM'#13#10'  LEF' +
      'T JOIN SUP_PROCESSO_COMPRA J ON J.ID_PROCESSO_COMPRA = I.ID_PROC' +
      'ESSO_COMPRA'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_' +
      'MATERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  ' +
      'LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOI' +
      'N SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO' +
      #13#10'  LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_G' +
      'RUPO_SERVICO_PAI'#13#10'  LEFT JOIN AAC_USUARIOS L ON L.CODIGO_USUARIO' +
      ' = J.ID_COMPRADOR'#13#10'  LEFT JOIN SUP_MODALIDADE M ON M.ID_MODALIDA' +
      'DE = J.ID_MODALIDADE'#13#10'  LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P' +
      '.ID_RATIF_FICHA = N.ID_RATIF_FICHA'#13#10'  LEFT JOIN SUP_CONTRATO S O' +
      'N S.ID_CONTRATO = I.ID_CONTRATO'#13#10'  LEFT JOIN SUP_FORNECEDOR R ON' +
      ' R.ID_FORNECEDOR = I.ID_FORNECEDOR'#13#10'  LEFT JOIN SIS_PESSOA U ON ' +
      'U.ID_PESSOA = R.ID_CREDOR'#13#10'  LEFT JOIN SUP_AUTORIZACAO_FICHA Z O' +
      'N Z.ID_SOLIC_EMPENHO_FICHA = P.ID_SOLIC_EMPENHO_FICHA'#13#10'  LEFT JO' +
      'IN SUP_AUTORIZACAO O ON O.ID_AUTORIZACAO = Z.ID_AUTORIZACAO'#13#10'  L' +
      'EFT JOIN AAC_USUARIOS Q ON Q.CODIGO_USUARIO = O.ID_RESPONSAVEL'#13#10 +
      'WHERE'#13#10'  (0 = :UTILIZA_LIBERACAO_NF OR UDF_ROUNDDEC(A.TL_AUTORIZ' +
      'ACAO, 4) - UDF_ROUNDDEC(A.TL_LIBERACAO_NF, 4) > 0)'#13#10'  AND O.ID_A' +
      'UTORIZACAO = A.ID_AUTORIZACAO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_EXCLUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_ESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_LIBERACAO_NF'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 312
    Top = 549
  end
  object DspLiberacaoNF: TDataSetProvider
    DataSet = SqlLiberacaoNF
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 400
    Top = 502
  end
  object SqlLiberacaoNF: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'  B.ID_SOLICITACAO_COMPRA,'#13#10'  B.ID_COMPRA_ITEM,' +
      #13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,'#13#10'  V.QTD,'#13#10'  V.VALOR AS VL' +
      '_TOTAL,'#13#10'  I.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10'  C.DS_MATERIAL,'#13#10 +
      '  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRUPO AS CD_SUBGRUPO,' +
      #13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10' ' +
      ' G.CD_GRUPO_SERVICO,'#13#10'  J.NR_PROCESSO_COMPRA,'#13#10'  J.ANO_PROCESSO_' +
      'COMPRA,'#13#10'  L.NOME AS NOME_COMPRADOR,'#13#10'  L.NOME_COMPLETO AS NOME_' +
      'COMPLETO_COMPRADOR,'#13#10'  J.NR_MODALIDADE,'#13#10'  J.ANO_MODALIDADE,'#13#10'  ' +
      'M.SIGLA,'#13#10'  S.NR_CONTRATO,'#13#10'  S.ANO_CONTRATO,'#13#10'  U.NOME_RAZAO AS' +
      ' DS_FORNECEDOR,'#13#10'  X.ID_LIBERACAO_NF AS NR_LIBERACAO_NF,'#13#10'  X.DT' +
      '_CADASTRO AS DATA,'#13#10'  K.NOME,'#13#10'  K.NOME_COMPLETO'#13#10'FROM'#13#10'  SUP_CO' +
      'MPRA_ITEM B'#13#10'  LEFT JOIN SUP_RATIF_FICHA_DADOS O ON O.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM'#13#10'  LEFT JOIN SUP_RATIF_FICHA N ON N.ID_R' +
      'ATIF_FICHA_DADOS = O.ID_RATIF_FICHA_DADOS'#13#10'  LEFT JOIN SUP_RATIF' +
      '_ITEM I ON I.ID_RATIF_ITEM = N.ID_RATIF_ITEM'#13#10'  LEFT JOIN SUP_PR' +
      'OCESSO_COMPRA J ON J.ID_PROCESSO_COMPRA = I.ID_PROCESSO_COMPRA'#13#10 +
      #13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = I.ID_MATERIAL'#13#10' ' +
      ' LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN S' +
      'UP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO' +
      '_SERVICO F ON F.ID_GRUPO_SERVICO = I.ID_GRUPO_SERVICO'#13#10'  LEFT JO' +
      'IN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVIC' +
      'O_PAI'#13#10#13#10'  LEFT JOIN AAC_USUARIOS L ON L.CODIGO_USUARIO = J.ID_C' +
      'OMPRADOR'#13#10'  LEFT JOIN SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID' +
      '_MODALIDADE'#13#10#13#10'  LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RAT' +
      'IF_FICHA = N.ID_RATIF_FICHA'#13#10'  LEFT JOIN SUP_CONTRATO S ON S.ID_' +
      'CONTRATO = I.ID_CONTRATO'#13#10'  LEFT JOIN SIS_PESSOA U ON U.ID_PESSO' +
      'A = S.ID_CREDOR'#13#10'  LEFT JOIN SUP_AUTORIZACAO_FICHA Q ON Q.ID_SOL' +
      'IC_EMPENHO_FICHA = P.ID_SOLIC_EMPENHO_FICHA'#13#10'  LEFT JOIN SUP_LIB' +
      'ERACAO_NF_FICHA V ON V.ID_AUTORIZACAO_FICHA = Q.ID_AUTORIZACAO_F' +
      'ICHA'#13#10'  LEFT JOIN SUP_LIBERACAO_NF X ON X.ID_LIBERACAO_NF = V.ID' +
      '_LIBERACAO_NF'#13#10'  LEFT JOIN AAC_USUARIOS K ON K.CODIGO_USUARIO = ' +
      'X.ID_USUARIO'#13#10#13#10'WHERE B.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_' +
      'COMPRA'#13#10'  AND X.ID_ST_LIBERACAO_NF <> :ST_LIBERACAO_NF_EXCLUIDO'#13 +
      #10'  AND X.ID_ST_LIBERACAO_NF <> :ST_LIBERACAO_NF_ESTORNADO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_EXCLUIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_ESTORNADO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 400
    Top = 549
  end
  object DspAutCompLiberado: TDataSetProvider
    DataSet = SqlAutCompLiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 288
    Top = 280
  end
  object SqlAutCompLiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.ESPECIFICACAO,'#13#10'  B.UN_SERVICO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO'#13#10'FROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOI' +
      'N SUP_COMPRA_ITEM B ON B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACA' +
      'O_COMPRA'#13#10'  LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MAT' +
      'ERIAL'#13#10'  LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEF' +
      'T JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN S' +
      'UP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10' ' +
      ' LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUP' +
      'O_SERVICO_PAI'#13#10'  LEFT JOIN SUP_COMPRA_ITEM_ID H ON H.ID_COMPRA_I' +
      'TEM_ID = B.ID_COMPRA_ITEM_ID'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA =' +
      ' :ID_SOLICITACAO_COMPRA'#13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITE' +
      'M_LIBERADO_COMPRA'#13#10'  AND H.ID_COMPRA_ITEM_ID IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 288
    Top = 327
  end
  object DspAutCompNaoLiberado: TDataSetProvider
    DataSet = SqlAutCompNaoLiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 408
    Top = 280
  end
  object SqlAutCompNaoLiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.UN_SERVICO,'#13#10'  B.ESPECIFICACAO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO,'#13#10'  (SELECT FIRST 1 A1.JUSTIFICATIVA FROM SUP' +
      '_HISTORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_IT' +
      'EM AND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS JUSTIFICATIVA'#13#10'F' +
      'ROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM B O' +
      'N B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN' +
      ' SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT JOIN SU' +
      'P_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRUPO E ON' +
      ' E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO F ON' +
      ' F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP_GRUPO_' +
      'SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10'  LEFT' +
      ' JOIN SUP_COMPRA_ITEM_ID H ON H.ID_COMPRA_ITEM_ID = B.ID_COMPRA_' +
      'ITEM_ID'#13#10'WHERE'#13#10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMP' +
      'RA'#13#10'  AND B.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA' +
      #13#10'  AND H.ID_COMPRA_ITEM_ID IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 408
    Top = 327
  end
  object DspRecusadoDefComp: TDataSetProvider
    DataSet = SqlRecusadoDefComp
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 624
    Top = 280
  end
  object SqlRecusadoDefComp: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  B.ID_COMPRA_ITEM,'#13#10'  B.ESPECIFICACAO,'#13#10'  B.UN_SERVICO,' +
      #13#10'  B.QTD,'#13#10'  B.VL_TOTAL,'#13#10'  B.QUANTITATIVO,'#13#10'  C.CD_MATERIAL,'#13#10 +
      '  C.DS_MATERIAL,'#13#10'  C.UN_MATERIAL,'#13#10'  C.TP_MATERIAL,'#13#10'  D.CD_GRU' +
      'PO AS CD_SUBGRUPO,'#13#10'  E.CD_GRUPO,'#13#10'  F.CD_GRUPO_SERVICO AS CD_SU' +
      'BGRUPO_SERVICO,'#13#10'  G.CD_GRUPO_SERVICO,'#13#10'  (SELECT FIRST 1 A1.DT_' +
      'HISTORICO_COMPRA_IT FROM SUP_HISTORICO_COMPRA_IT A1 WHERE A1.ID_' +
      'COMPRA_ITEM = B.ID_COMPRA_ITEM AND A1.ST_COMPRA_ITEM = B.ST_COMP' +
      'RA_ITEM) AS DATA,'#13#10'  (SELECT FIRST 1 B2.NOME FROM SUP_HISTORICO_' +
      'COMPRA_IT A2 LEFT JOIN AAC_USUARIOS B2 ON B2.CODIGO_USUARIO = A2' +
      '.ID_USUARIO WHERE A2.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM AND A2.ST' +
      '_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS NOME,'#13#10'  (SELECT FIRST 1 B2.' +
      'NOME_COMPLETO FROM SUP_HISTORICO_COMPRA_IT A2 LEFT JOIN AAC_USUA' +
      'RIOS B2 ON B2.CODIGO_USUARIO = A2.ID_USUARIO WHERE A2.ID_COMPRA_' +
      'ITEM = B.ID_COMPRA_ITEM AND A2.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM' +
      ') AS NOME_COMPLETO,'#13#10'  (SELECT FIRST 1 A1.JUSTIFICATIVA FROM SUP' +
      '_HISTORICO_COMPRA_IT A1 WHERE A1.ID_COMPRA_ITEM = B.ID_COMPRA_IT' +
      'EM AND A1.ST_COMPRA_ITEM = B.ST_COMPRA_ITEM) AS JUSTIFICATIVA'#13#10'F' +
      'ROM'#13#10'  SUP_SOLICITACAO_COMPRA A'#13#10'  LEFT JOIN SUP_COMPRA_ITEM B O' +
      'N B.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN' +
      ' SUP_MATERIAL C ON C.ID_MATERIAL = B.ID_MATERIAL'#13#10'  LEFT JOIN SU' +
      'P_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'  LEFT JOIN SUP_GRUPO E ON' +
      ' E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO F ON' +
      ' F.ID_GRUPO_SERVICO = B.ID_GRUPO_SERVICO'#13#10'  LEFT JOIN SUP_GRUPO_' +
      'SERVICO G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10'WHERE'#13 +
      #10'  A.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  AND B.ST_' +
      'COMPRA_ITEM = :ST_COMPRA_ITEM_RECUSADO_DEF_COMP'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO_DEF_COMP'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 624
    Top = 327
  end
  object DspHistoricoFluxo: TDataSetProvider
    DataSet = SqlHistoricoFluxo
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 192
    Top = 24
  end
  object SqlHistoricoFluxo: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT CASE WHEN A.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10'    ' +
      '        THEN 0'#13#10'            ELSE 1'#13#10'       END AS TP_ETAPA'#13#10'    ' +
      ' , '#39'Solicitado'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_SCOMPRA AS DA' +
      'TA'#13#10'     , H.NOME'#13#10'     , H.NOME_COMPLETO'#13#10'     , CAST('#39#39' AS VAR' +
      'CHAR(1000)) AS JUSTIFICATIVA'#13#10'     , CASE WHEN A.TP_SOLICITACAO ' +
      '= :TP_SOLICITACAO_NORMAL'#13#10'            THEN 0'#13#10'            ELSE D' +
      '.NR_PROCESSO_COMPRA'#13#10'       END AS NR_DOCUMENTO'#13#10'     , CASE WHE' +
      'N A.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10'            THEN 0'#13 +
      #10'            ELSE D.ANO_PROCESSO_COMPRA'#13#10'       END AS ANO_DOCUM' +
      'ENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13 +
      #10'       INNER JOIN SUP_HISTORICO_SCOMPRA   C ON C.ID_SOLICITACAO' +
      '_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER JOIN SUP_SOLICI' +
      'TACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_C' +
      'OMPRA'#13#10'       LEFT  JOIN AAC_USUARIOS            H ON H.CODIGO_U' +
      'SUARIO         = A.ID_SOLICITANTE'#13#10'       LEFT  JOIN SUP_PROCESS' +
      'O_COMPRA     D ON D.ID_PROCESSO_COMPRA     = A.ID_PROCESSO_COMPR' +
      'A'#13#10' WHERE B.ID_COMPRA_ITEM        = :ID_COMPRA_ITEM'#13#10'   AND C.ST' +
      '_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_ABERTO'#13#10#13#10'UNION ALL' +
      #13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Liberado'#39' AS DS_ETAPA'#13#10'     , ' +
      'C.DT_HISTORICO_SCOMPRA AS DATA'#13#10'     , H.NOME'#13#10'     , H.NOME_COM' +
      'PLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'   ' +
      '  , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM ' +
      'SUP_COMPRA_ITEM B'#13#10'       INNER JOIN SUP_HISTORICO_SCOMPRA   C O' +
      'N C.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INN' +
      'ER JOIN SUP_SOLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = ' +
      'B.ID_SOLICITACAO_COMPRA'#13#10'       LEFT  JOIN AAC_USUARIOS         ' +
      '   H ON H.CODIGO_USUARIO         = A.ID_SOLICITANTE'#13#10' WHERE B.ID' +
      '_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND C.ST_SOLICITACAO_COMPRA =' +
      ' :ST_SOLICITACAO_COMPRA_LIBERADO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_' +
      'ETAPA'#13#10'     , '#39'Aprovado'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_SCOM' +
      'PRA AS DATA'#13#10'     , H.NOME'#13#10'     , H.NOME_COMPLETO'#13#10'     , '#39#39' AS' +
      ' JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUME' +
      'NTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10 +
      '       INNER JOIN SUP_HISTORICO_SCOMPRA   C ON C.ID_SOLICITACAO_' +
      'COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER JOIN SUP_SOLICIT' +
      'ACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_CO' +
      'MPRA'#13#10'       LEFT  JOIN AAC_USUARIOS            H ON H.CODIGO_US' +
      'UARIO         = A.ID_APROVADOR'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_CO' +
      'MPRA_ITEM'#13#10'   AND C.ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMP' +
      'RA_APROVADO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Reprov' +
      'ado'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_SCOMPRA AS DATA'#13#10'     , ' +
      'H.NOME'#13#10'     , H.NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'    ' +
      ' , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10' ' +
      '    , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'       INNER JOIN SU' +
      'P_HISTORICO_SCOMPRA   C ON C.ID_SOLICITACAO_COMPRA  = B.ID_SOLIC' +
      'ITACAO_COMPRA'#13#10'       INNER JOIN SUP_SOLICITACAO_COMPRA  A ON A.' +
      'ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       LEFT  J' +
      'OIN AAC_USUARIOS            H ON H.CODIGO_USUARIO         = A.ID' +
      '_APROVADOR'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND C.' +
      'ST_SOLICITACAO_COMPRA = :ST_SOLICITACAO_COMPRA_REPROVADO'#13#10#13#10'UNIO' +
      'N ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Aprova'#231#227'o financeira - ap' +
      'rovado'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'  ' +
      '   , D.NOME AS NOME'#13#10'     , D.NOME_COMPLETO AS NOME_COMPLETO'#13#10'  ' +
      '   , '#39#39' AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ' +
      'ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPR' +
      'A_ITEM B'#13#10'       INNER JOIN SUP_HISTORICO_COMPRA_IT C ON C.ID_CO' +
      'MPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'       INNER JOIN SUP_SOLI' +
      'CITACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO' +
      '_COMPRA'#13#10'       LEFT  JOIN AAC_USUARIOS            D ON D.CODIGO' +
      '_USUARIO         = C.ID_USUARIO'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_C' +
      'OMPRA_ITEM'#13#10'   AND C.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIBERADO_D' +
      'OT'#13#10'  AND 1 = :UTILIZA_APROV_FIN'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_' +
      'ETAPA'#13#10'     , '#39'Aprova'#231#227'o financeira - reprovado'#39' AS DS_ETAPA'#13#10'  ' +
      '   , C.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D.NOME AS NOME'#13#10'  ' +
      '   , D.NOME_COMPLETO AS NOME_COMPLETO'#13#10'     , C.JUSTIFICATIVA AS' +
      ' JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUME' +
      'NTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10 +
      '       INNER JOIN SUP_HISTORICO_COMPRA_IT C ON C.ID_COMPRA_ITEM ' +
      '        = B.ID_COMPRA_ITEM'#13#10'       INNER JOIN SUP_SOLICITACAO_CO' +
      'MPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10' ' +
      '      LEFT  JOIN AAC_USUARIOS            D ON D.CODIGO_USUARIO  ' +
      '       = C.ID_USUARIO'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM' +
      #13#10'   AND C.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_NAO_LIBERADO_DOT'#13#10'  ' +
      ' AND 1 = :UTILIZA_APROV_FIN'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA' +
      #13#10'     , '#39'Defini'#231#227'o de dota'#231#227'o - liberado'#39' AS DS_ETAPA'#13#10'     , C' +
      '.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D.NOME AS NOME'#13#10'     , D' +
      '.NOME_COMPLETO AS NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'   ' +
      '  , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10 +
      '     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'       INNER JOIN S' +
      'UP_SOLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLI' +
      'CITACAO_COMPRA'#13#10'       INNER JOIN SUP_HISTORICO_COMPRA_IT C ON C' +
      '.ID_COMPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'       LEFT  JOIN AA' +
      'C_USUARIOS            D ON D.CODIGO_USUARIO         = C.ID_USUAR' +
      'IO'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND CASE WHEN ' +
      '(0 = :UTILIZA_DEF_COMPRADOR OR A.TP_SOLICITACAO <> :TP_SOLICITAC' +
      'AO_NORMAL)'#13#10'            THEN CAST(:ST_COMPRA_ITEM_LIBERADO_COMPR' +
      'A AS INTEGER)'#13#10'            ELSE CAST(:ST_COMPRA_ITEM_LIB_LIBERAC' +
      'AO AS INTEGER)'#13#10'       END = C.ST_COMPRA_ITEM'#13#10#13#10'UNION ALL'#13#10#13#10'SE' +
      'LECT 0 AS TP_ETAPA'#13#10'     , '#39'Defini'#231#227'o de dota'#231#227'o - n'#227'o liberado'#39 +
      ' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D.' +
      'NOME AS NOME'#13#10'     , D.NOME_COMPLETO AS NOME_COMPLETO'#13#10'     , C.' +
      'JUSTIFICATIVA AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     ,' +
      ' 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP' +
      '_COMPRA_ITEM B'#13#10'       INNER JOIN SUP_SOLICITACAO_COMPRA  A ON A' +
      '.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER ' +
      'JOIN SUP_HISTORICO_COMPRA_IT C ON C.ID_COMPRA_ITEM         = B.I' +
      'D_COMPRA_ITEM'#13#10'       LEFT  JOIN AAC_USUARIOS            D ON D.' +
      'CODIGO_USUARIO         = C.ID_USUARIO'#13#10' WHERE B.ID_COMPRA_ITEM =' +
      ' :ID_COMPRA_ITEM'#13#10'   AND CASE WHEN (0 = :UTILIZA_DEF_COMPRADOR O' +
      'R A.TP_SOLICITACAO <> :TP_SOLICITACAO_NORMAL)'#13#10'            THEN ' +
      'CAST(:ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA AS INTEGER)'#13#10'          ' +
      '  ELSE CAST(:ST_COMPRA_ITEM_NAO_LIB_LIBERACAO AS INTEGER)'#13#10'     ' +
      '  END = C.ST_COMPRA_ITEM'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10' ' +
      '    , '#39'Autoriza'#231#227'o de compra - liberado'#39' AS DS_ETAPA'#13#10'     , C.D' +
      'T_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D.NOME AS NOME'#13#10'     , D.N' +
      'OME_COMPLETO AS NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     ' +
      ', 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'  ' +
      '   , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'       INNER JOIN SUP' +
      '_SOLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICI' +
      'TACAO_COMPRA'#13#10'       INNER JOIN SUP_HISTORICO_COMPRA_IT C ON C.I' +
      'D_COMPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'       LEFT  JOIN AAC_' +
      'USUARIOS            D ON D.CODIGO_USUARIO         = C.ID_USUARIO' +
      #13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND C.ST_COMPRA_' +
      'ITEM = :ST_COMPRA_ITEM_LIBERADO_COMPRA'#13#10'   AND 1 = :UTILIZA_DEF_' +
      'COMPRADOR'#13#10'   AND A.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10#13#10'U' +
      'NION ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Autoriza'#231#227'o de compra ' +
      '- n'#227'o liberado'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_COMPRA_IT AS ' +
      'DATA'#13#10'     , D.NOME AS NOME'#13#10'     , D.NOME_COMPLETO AS NOME_COMP' +
      'LETO'#13#10'     , C.JUSTIFICATIVA AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DO' +
      'CUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TO' +
      'TAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'       INNER JOIN SUP_SOLICITACAO' +
      '_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA' +
      #13#10'       INNER JOIN SUP_HISTORICO_COMPRA_IT C ON C.ID_COMPRA_ITE' +
      'M         = B.ID_COMPRA_ITEM'#13#10'       LEFT  JOIN AAC_USUARIOS    ' +
      '        D ON D.CODIGO_USUARIO         = C.ID_USUARIO'#13#10' WHERE B.I' +
      'D_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND C.ST_COMPRA_ITEM = :ST_C' +
      'OMPRA_ITEM_NAO_LIBERADO_COMPRA'#13#10'   AND 1 = :UTILIZA_DEF_COMPRADO' +
      'R'#13#10'   AND A.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10#13#10'UNION ALL' +
      #13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Defini'#231#227'o de comprador - defin' +
      'ido'#39' AS DS_ETAPA'#13#10'     , H.DT_COMPRA_ITEM_ID AS DATA'#13#10'     , I.N' +
      'OME'#13#10'     , I.NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , ' +
      '0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'    ' +
      ' , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'       INNER JOIN SUP_S' +
      'OLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITA' +
      'CAO_COMPRA'#13#10'       INNER JOIN SUP_COMPRA_ITEM_ID      H ON H.ID_' +
      'COMPRA_ITEM_ID      = B.ID_COMPRA_ITEM_ID'#13#10'       LEFT  JOIN AAC' +
      '_USUARIOS            I ON I.CODIGO_USUARIO         = H.ID_USUARI' +
      'O'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10#13#10'UNION ALL'#13#10#13#10'SEL' +
      'ECT 0 AS TP_ETAPA'#13#10'     , '#39'Defini'#231#227'o de comprador - n'#227'o definido' +
      #39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D' +
      '.NOME AS NOME'#13#10'     , D.NOME_COMPLETO AS NOME_COMPLETO'#13#10'     , C' +
      '.JUSTIFICATIVA AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     ' +
      ', 0 AS ANO_DOCUMENTO'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SU' +
      'P_COMPRA_ITEM B'#13#10'       INNER JOIN SUP_SOLICITACAO_COMPRA  A ON ' +
      'A.ID_SOLICITACAO_COMPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER' +
      ' JOIN SUP_HISTORICO_COMPRA_IT C ON C.ID_COMPRA_ITEM         = B.' +
      'ID_COMPRA_ITEM'#13#10'       LEFT  JOIN AAC_USUARIOS            D ON D' +
      '.CODIGO_USUARIO         = C.ID_USUARIO'#13#10' WHERE B.ID_COMPRA_ITEM ' +
      '= :ID_COMPRA_ITEM'#13#10'   AND C.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_REC' +
      'USADO_DEF_COMP'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 1 AS TP_ETAPA'#13#10'     , '#39'Em ' +
      'processo de compra'#39' AS DS_ETAPA'#13#10'     , C.DT_HISTORICO_COMPRA_IT' +
      ' AS DATA'#13#10'     , D.NOME AS NOME'#13#10'     , D.NOME_COMPLETO AS NOME_' +
      'COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , F.NR_PROCESSO_COMPR' +
      'A AS NR_DOCUMENTO'#13#10'     , F.ANO_PROCESSO_COMPRA AS ANO_DOCUMENTO' +
      #13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'   ' +
      '    INNER JOIN SUP_SOLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_COM' +
      'PRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER JOIN SUP_HISTORICO_' +
      'COMPRA_IT C ON C.ID_COMPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'    ' +
      '   LEFT  JOIN AAC_USUARIOS            D ON D.CODIGO_USUARIO     ' +
      '    = C.ID_USUARIO'#13#10'       LEFT  JOIN SUP_PROC_COMPRA_ITEM    E ' +
      'ON E.ID_PROC_COMPRA_ITEM    = B.ID_PROC_COMPRA_ITEM'#13#10'       LEFT' +
      '  JOIN SUP_PROCESSO_COMPRA     F ON F.ID_PROCESSO_COMPRA     = E' +
      '.ID_PROCESSO_COMPRA'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10 +
      '   AND A.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13#10'   AND C.ST_CO' +
      'MPRA_ITEM = :ST_COMPRA_ITEM_EM_PROCESSO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0' +
      ' AS TP_ETAPA'#13#10'     , '#39'Recusado pelo comprador'#39' AS DS_ETAPA'#13#10'    ' +
      ' , C.DT_HISTORICO_COMPRA_IT AS DATA'#13#10'     , D.NOME AS NOME'#13#10'    ' +
      ' , D.NOME_COMPLETO AS NOME_COMPLETO'#13#10'     , C.JUSTIFICATIVA AS J' +
      'USTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENT' +
      'O'#13#10'     , B.QTD'#13#10'     , B.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM B'#13#10'  ' +
      '     INNER JOIN SUP_SOLICITACAO_COMPRA  A ON A.ID_SOLICITACAO_CO' +
      'MPRA  = B.ID_SOLICITACAO_COMPRA'#13#10'       INNER JOIN SUP_HISTORICO' +
      '_COMPRA_IT C ON C.ID_COMPRA_ITEM         = B.ID_COMPRA_ITEM'#13#10'   ' +
      '    LEFT  JOIN AAC_USUARIOS            D ON D.CODIGO_USUARIO    ' +
      '     = C.ID_USUARIO'#13#10' WHERE B.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10 +
      '   AND C.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_RECUSADO'#13#10#13#10'UNION ALL'#13 +
      #10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'Ratificado/adjudicado'#39' AS DS_ET' +
      'APA'#13#10'     , CASE WHEN H.TP_SOLICITACAO = :TP_SOLICITACAO_NORMAL'#13 +
      #10'            THEN C.DT_RATIFICACAO'#13#10'            ELSE E.DT_RATIFI' +
      'CACAO'#13#10'       END AS DATA'#13#10'     , CASE WHEN H.TP_SOLICITACAO = :' +
      'TP_SOLICITACAO_NORMAL'#13#10'            THEN D.NOME'#13#10'            ELSE' +
      ' F.NOME'#13#10'       END AS NOME'#13#10'     , CASE WHEN H.TP_SOLICITACAO =' +
      ' :TP_SOLICITACAO_NORMAL'#13#10'            THEN D.NOME_COMPLETO'#13#10'     ' +
      '       ELSE F.NOME_COMPLETO'#13#10'       END AS NOME_COMPLETO'#13#10'     ,' +
      ' '#39#39' AS JUSTIFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_' +
      'DOCUMENTO'#13#10'     , G.QTD'#13#10'     , G.VL_TOTAL'#13#10'  FROM SUP_RATIF_FIC' +
      'HA_DADOS A'#13#10'       LEFT JOIN SUP_RATIF_FICHA        B ON B.ID_RA' +
      'TIF_FICHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13#10'       LEFT JOIN SUP' +
      '_RATIF_ITEM_HIST    C ON C.ID_RATIF_ITEM          = B.ID_RATIF_I' +
      'TEM'#13#10'                                         AND C.ID_RATIF_ITE' +
      'M_HIST     = (SELECT FIRST 1 A3.ID_RATIF_ITEM_HIST'#13#10'            ' +
      '                                                               F' +
      'ROM SUP_RATIF_ITEM_HIST A3'#13#10'                                    ' +
      '                                      WHERE A3.ID_RATIF_ITEM = B' +
      '.ID_RATIF_ITEM )'#13#10'       LEFT JOIN AAC_USUARIOS           D ON D' +
      '.CODIGO_USUARIO         = C.ID_USUARIO'#13#10'       LEFT JOIN SUP_RAT' +
      'IF_FICHA_HIST   E ON E.ID_RATIF_FICHA         = B.ID_RATIF_FICHA' +
      ' AND E.ID_RATIF_FICHA_DADOS = B.ID_RATIF_FICHA_DADOS'#13#10'          ' +
      '                               AND E.ID_RATIF_FICHA_HIST    = (S' +
      'ELECT FIRST 1 A4.ID_RATIF_FICHA_HIST'#13#10'                          ' +
      '                                                 FROM SUP_RATIF_' +
      'FICHA_HIST A4'#13#10'                                                 ' +
      '                         WHERE A4.ID_RATIF_FICHA = B.ID_RATIF_FI' +
      'CHA'#13#10'                                                           ' +
      '                 AND A4.ID_RATIF_FICHA_DADOS = B.ID_RATIF_FICHA_' +
      'DADOS )'#13#10'       LEFT JOIN AAC_USUARIOS           F ON F.CODIGO_U' +
      'SUARIO         = E.ID_USUARIO'#13#10'       LEFT JOIN SUP_COMPRA_ITEM ' +
      '       G ON G.ID_COMPRA_ITEM         = A.ID_COMPRA_ITEM'#13#10'       ' +
      'LEFT JOIN SUP_SOLICITACAO_COMPRA H ON H.ID_SOLICITACAO_COMPRA  =' +
      ' G.ID_SOLICITACAO_COMPRA'#13#10' WHERE A.ID_COMPRA_ITEM = :ID_COMPRA_I' +
      'TEM'#13#10'   AND H.TP_SOLICITACAO IN (:TP_SOLICITACAO_NORMAL, :TP_SOL' +
      'ICITACAO_ADITAMENTO)'#13#10' GROUP BY'#13#10'       A.ID_COMPRA_ITEM,'#13#10'     ' +
      '  H.TP_SOLICITACAO,'#13#10'       C.DT_RATIFICACAO,'#13#10'       E.DT_RATIF' +
      'ICACAO,'#13#10'       D.NOME,'#13#10'       F.NOME,'#13#10'       D.NOME_COMPLETO,' +
      #13#10'       F.NOME_COMPLETO,'#13#10'       C.VL_TOTAL,'#13#10'       G.QTD,'#13#10'  ' +
      '     G.VL_TOTAL'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 0 AS TP_ETAPA'#13#10'     , '#39'An' +
      'ulado'#39' AS DS_ETAPA'#13#10'     , B.DT_ANULACAO AS DATA'#13#10'     , C.NOME'#13 +
      #10'     , C.NOME_COMPLETO'#13#10'     , B.JUSTIFICATIVA_ANULACAO AS JUST' +
      'IFICATIVA'#13#10'     , 0 AS NR_DOCUMENTO'#13#10'     , 0 AS ANO_DOCUMENTO'#13#10 +
      '     , A.QTD'#13#10'     , A.VL_TOTAL'#13#10'  FROM SUP_COMPRA_ITEM A'#13#10'     ' +
      '  INNER JOIN SUP_PROC_COMPRA_ITEM  B ON B.ID_PROC_COMPRA_ITEM  =' +
      ' A.ID_PROC_COMPRA_ITEM'#13#10'       LEFT  JOIN AAC_USUARIOS          ' +
      'C ON C.CODIGO_USUARIO       = B.ID_USUARIO_ANULACAO'#13#10' WHERE A.ID' +
      '_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND B.ANULADO = 1'#13#10#13#10'UNION AL' +
      'L'#13#10#13#10'SELECT 2 AS TP_ETAPA'#13#10'     , '#39'Solicita'#231#227'o de empenho - soli' +
      'citado'#39' AS DS_ETAPA'#13#10'     , E.DT_SOLICITACAO AS DATA'#13#10'     , F.N' +
      'OME'#13#10'     , F.NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , ' +
      'E.NR_SOLIC_EMPENHO AS NR_DOCUMENTO'#13#10'     , E.CP_ANO AS ANO_DOCUM' +
      'ENTO'#13#10'     , SUM(C.QTD) AS QTD'#13#10'     , SUM(C.VALOR) AS VALOR'#13#10'  ' +
      'FROM SUP_RATIF_FICHA_DADOS A'#13#10'       INNER JOIN SUP_RATIF_FICHA ' +
      '        B ON B.ID_RATIF_FICHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13#10 +
      '       INNER JOIN SUP_SOLIC_EMPENHO_FICHA C ON C.ID_RATIF_FICHA ' +
      '        = B.ID_RATIF_FICHA'#13#10'       INNER JOIN SUP_SOLIC_EMPENHO_' +
      'ITEM  D ON D.ID_SOLIC_EMPENHO_ITEM  = C.ID_SOLIC_EMPENHO_ITEM'#13#10' ' +
      '      INNER JOIN SUP_SOLIC_EMPENHO       E ON E.ID_SOLIC_EMPENHO' +
      '       = D.ID_SOLIC_EMPENHO'#13#10'       LEFT  JOIN AAC_USUARIOS     ' +
      '       F ON F.CODIGO_USUARIO         = E.ID_SOLICITANTE'#13#10' WHERE ' +
      'A.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AND E.ID_ST_SOLIC_EMPENHO' +
      ' <> :ST_PEDIDO_COMPOSICAO_CANCELADO'#13#10' GROUP BY'#13#10'       E.DT_SOLI' +
      'CITACAO,'#13#10'       F.NOME,'#13#10'       F.NOME_COMPLETO,'#13#10'       E.NR_S' +
      'OLIC_EMPENHO,'#13#10'       E.CP_ANO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 2 AS TP_ET' +
      'APA'#13#10'     , '#39'Solicita'#231#227'o de empenho - liberado'#39' AS DS_ETAPA'#13#10'   ' +
      '  , E.DT_LIBERACAO AS DATA'#13#10'     , F.NOME'#13#10'     , F.NOME_COMPLET' +
      'O'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , E.NR_SOLIC_EMPENHO AS NR_D' +
      'OCUMENTO'#13#10'     , E.CP_ANO AS ANO_DOCUMENTO'#13#10'     , SUM(C.QTD) AS' +
      ' QTD'#13#10'     , SUM(C.VALOR) AS VALOR'#13#10'  FROM SUP_RATIF_FICHA_DADOS' +
      ' A'#13#10'       INNER JOIN SUP_RATIF_FICHA         B ON B.ID_RATIF_FI' +
      'CHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13#10'       INNER JOIN SUP_SOLI' +
      'C_EMPENHO_FICHA C ON C.ID_RATIF_FICHA         = B.ID_RATIF_FICHA' +
      #13#10'       INNER JOIN SUP_SOLIC_EMPENHO_ITEM  D ON D.ID_SOLIC_EMPE' +
      'NHO_ITEM  = C.ID_SOLIC_EMPENHO_ITEM'#13#10'       INNER JOIN SUP_SOLIC' +
      '_EMPENHO       E ON E.ID_SOLIC_EMPENHO       = D.ID_SOLIC_EMPENH' +
      'O'#13#10'       LEFT  JOIN AAC_USUARIOS            F ON F.CODIGO_USUAR' +
      'IO         = E.ID_USUARIO_LIBERACAO'#13#10' WHERE A.ID_COMPRA_ITEM    ' +
      '   = :ID_COMPRA_ITEM'#13#10'   AND E.ID_ST_SOLIC_EMPENHO <> :ST_PEDIDO' +
      '_COMPOSICAO_CANCELADO'#13#10'   AND E.DT_LIBERACAO IS NOT NULL'#13#10' GROUP' +
      ' BY'#13#10'       E.DT_LIBERACAO,'#13#10'       F.NOME,'#13#10'       F.NOME_COMPL' +
      'ETO,'#13#10'       E.NR_SOLIC_EMPENHO,'#13#10'       E.CP_ANO'#13#10#13#10'UNION ALL'#13#10 +
      #13#10'SELECT 2 AS TP_ETAPA'#13#10'     , '#39'Solicita'#231#227'o de empenho - empenha' +
      'do'#39' AS DS_ETAPA'#13#10'     , G.DT_HR_EXECUCAO AS DATA'#13#10'     , F.NOME'#13 +
      #10'     , F.NOME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , E.NR' +
      '_SOLIC_EMPENHO AS NR_DOCUMENTO'#13#10'     , E.CP_ANO AS ANO_DOCUMENTO' +
      #13#10'     , SUM(C.QTD) AS QTD'#13#10'     , SUM(C.VALOR) AS VALOR'#13#10'  FROM' +
      ' SUP_RATIF_FICHA_DADOS A'#13#10'       INNER JOIN SUP_RATIF_FICHA     ' +
      '    B ON B.ID_RATIF_FICHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13#10'    ' +
      '   INNER JOIN SUP_SOLIC_EMPENHO_FICHA C ON C.ID_RATIF_FICHA     ' +
      '    = B.ID_RATIF_FICHA'#13#10'       INNER JOIN SUP_SOLIC_EMPENHO_ITEM' +
      '  D ON D.ID_SOLIC_EMPENHO_ITEM  = C.ID_SOLIC_EMPENHO_ITEM'#13#10'     ' +
      '  INNER JOIN SUP_SOLIC_EMPENHO       E ON E.ID_SOLIC_EMPENHO    ' +
      '   = D.ID_SOLIC_EMPENHO'#13#10'       INNER JOIN API_PEDIDO_EXECUCAO  ' +
      '   G ON G.ID_PEDIDO_COMPOSICAO   = E.ID_PEDIDO_COMPOSICAO'#13#10'     ' +
      '  LEFT  JOIN AAC_USUARIOS            F ON F.CODIGO_USUARIO      ' +
      '   = G.ID_USUARIO_EXECUCAO'#13#10' WHERE A.ID_COMPRA_ITEM = :ID_COMPRA' +
      '_ITEM'#13#10'   AND G.DT_HR_EXECUCAO IS NOT NULL'#13#10' GROUP BY'#13#10'       G.' +
      'DT_HR_EXECUCAO,'#13#10'       F.NOME,'#13#10'       F.NOME_COMPLETO,'#13#10'      ' +
      ' E.NR_SOLIC_EMPENHO,'#13#10'       E.CP_ANO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 3 A' +
      'S TP_ETAPA'#13#10'     , '#39'Solicita'#231#227'o de estorno - estornado'#39' AS DS_ET' +
      'APA'#13#10'     , G.DT_HR_EXECUCAO AS DATA'#13#10'     , F.NOME'#13#10'     , F.NO' +
      'ME_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , E.NR_SOLIC_ESTOR' +
      'NO AS NR_DOCUMENTO'#13#10'     , E.CP_ANO AS ANO_DOCUMENTO'#13#10'     , SUM' +
      '(C.QTD) AS QTD'#13#10'     , SUM(C.VALOR) AS VALOR'#13#10'  FROM SUP_RATIF_F' +
      'ICHA_DADOS A'#13#10'       INNER JOIN SUP_RATIF_FICHA         B ON B.I' +
      'D_RATIF_FICHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13#10'       INNER JOI' +
      'N SUP_SOLIC_EMPENHO_FICHA C ON C.ID_RATIF_FICHA         = B.ID_R' +
      'ATIF_FICHA'#13#10'       INNER JOIN SUP_SOLIC_EMPENHO_ITEM  D ON D.ID_' +
      'SOLIC_EMPENHO_ITEM  = C.ID_SOLIC_EMPENHO_ITEM'#13#10'       INNER JOIN' +
      ' SUP_SOLIC_ESTORNO       E ON E.ID_SOLIC_ESTORNO       = D.ID_SO' +
      'LIC_ESTORNO'#13#10'       INNER JOIN API_PEDIDO_EXECUCAO     G ON G.ID' +
      '_PEDIDO_COMPOSICAO   = E.ID_PEDIDO_COMPOSICAO'#13#10'       LEFT  JOIN' +
      ' AAC_USUARIOS            F ON F.CODIGO_USUARIO         = G.ID_US' +
      'UARIO_EXECUCAO'#13#10' WHERE A.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'#13#10'   AN' +
      'D G.DT_HR_EXECUCAO IS NOT NULL'#13#10' GROUP BY'#13#10'       G.DT_HR_EXECUC' +
      'AO,'#13#10'       F.NOME,'#13#10'       F.NOME_COMPLETO,'#13#10'       E.NR_SOLIC_' +
      'ESTORNO,'#13#10'       E.CP_ANO'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT 4 AS TP_ETAPA'#13#10 +
      '     , '#39'Autoriza'#231#227'o de fornecimento'#39' AS DS_ETAPA'#13#10'     , E.DT_CA' +
      'DASTRO AS DATA'#13#10'     , F.NOME'#13#10'     , F.NOME_COMPLETO'#13#10'     , '#39#39 +
      ' AS JUSTIFICATIVA'#13#10'     , E.NR_AUTORIZACAO AS NR_DOCUMENTO'#13#10'    ' +
      ' , E.ANO_AUTORIZACAO AS ANO_DOCUMENTO'#13#10'     , SUM(D.QTD) AS QTD'#13 +
      #10'     , SUM(D.VALOR) AS VALOR'#13#10'  FROM SUP_RATIF_FICHA_DADOS A'#13#10' ' +
      '      INNER JOIN SUP_RATIF_FICHA         B ON B.ID_RATIF_FICHA_D' +
      'ADOS   = A.ID_RATIF_FICHA_DADOS'#13#10'       INNER JOIN SUP_SOLIC_EMP' +
      'ENHO_FICHA C ON C.ID_RATIF_FICHA         = B.ID_RATIF_FICHA'#13#10'   ' +
      '    INNER JOIN SUP_AUTORIZACAO_FICHA   D ON D.ID_SOLIC_EMPENHO_F' +
      'ICHA = C.ID_SOLIC_EMPENHO_FICHA'#13#10'       INNER JOIN SUP_AUTORIZAC' +
      'AO         E ON E.ID_AUTORIZACAO         = D.ID_AUTORIZACAO'#13#10'   ' +
      '    LEFT  JOIN AAC_USUARIOS            F ON F.CODIGO_USUARIO    ' +
      '     = E.ID_RESPONSAVEL'#13#10' WHERE A.ID_COMPRA_ITEM = :ID_COMPRA_IT' +
      'EM'#13#10'   AND E.ID_ST_AUTORIZACAO <> :ST_AUTORIZACAO_CANCELADO'#13#10' GR' +
      'OUP BY'#13#10'       E.DT_CADASTRO,'#13#10'       F.NOME,'#13#10'       F.NOME_COM' +
      'PLETO,'#13#10'       E.NR_AUTORIZACAO,'#13#10'       E.ANO_AUTORIZACAO'#13#10#13#10'UN' +
      'ION ALL'#13#10#13#10'SELECT 5 AS TP_ETAPA'#13#10'     , '#39'Libera'#231#227'o de NF'#39' AS DS_' +
      'ETAPA'#13#10'     , G.DT_CADASTRO AS DATA'#13#10'     , F.NOME'#13#10'     , F.NOM' +
      'E_COMPLETO'#13#10'     , '#39#39' AS JUSTIFICATIVA'#13#10'     , G.ID_LIBERACAO_NF' +
      ' AS NR_DOCUMENTO'#13#10'     , UDF_YEAR(G.DT_LIBERACAO_NF) AS ANO_DOCU' +
      'MENTO'#13#10'     , SUM(E.QTD) AS QTD'#13#10'     , SUM(E.VALOR) AS VALOR'#13#10' ' +
      ' FROM SUP_RATIF_FICHA_DADOS A'#13#10'       INNER JOIN SUP_RATIF_FICHA' +
      '         B ON B.ID_RATIF_FICHA_DADOS   = A.ID_RATIF_FICHA_DADOS'#13 +
      #10'       INNER JOIN SUP_SOLIC_EMPENHO_FICHA C ON C.ID_RATIF_FICHA' +
      '         = B.ID_RATIF_FICHA'#13#10'       INNER JOIN SUP_AUTORIZACAO_F' +
      'ICHA   D ON D.ID_SOLIC_EMPENHO_FICHA = C.ID_SOLIC_EMPENHO_FICHA'#13 +
      #10'       INNER JOIN SUP_LIBERACAO_NF_FICHA  E ON E.ID_AUTORIZACAO' +
      '_FICHA   = D.ID_AUTORIZACAO_FICHA'#13#10'       INNER JOIN SUP_LIBERAC' +
      'AO_NF        G ON G.ID_LIBERACAO_NF        = E.ID_LIBERACAO_NF'#13#10 +
      '       LEFT  JOIN AAC_USUARIOS            F ON F.CODIGO_USUARIO ' +
      '        = G.ID_USUARIO'#13#10' WHERE A.ID_COMPRA_ITEM = :ID_COMPRA_ITE' +
      'M'#13#10' GROUP BY'#13#10'       G.DT_CADASTRO,'#13#10'       F.NOME,'#13#10'       F.NO' +
      'ME_COMPLETO,'#13#10'       G.ID_LIBERACAO_NF,'#13#10'       G.DT_LIBERACAO_N' +
      'F'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_LIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_APROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_REPROVADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_APROV_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_NAO_LIBERADO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UTILIZA_DEF_COMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO_DEF_COMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EM_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_RECUSADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_NORMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_ADITAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 192
    Top = 71
  end
  object DspHistoricoFluxoItem: TDataSetProvider
    DataSet = SqlHistoricoFluxoItem
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 304
    Top = 24
  end
  object SqlHistoricoFluxoItem: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  E.NR_SOLICITACAO_COMPRA,'#13#10'  E.CP_ANO,'#13#10'  E.DT_SOLICITA' +
      'CAO_COMPRA,'#13#10'  E.TP_SOLICITACAO,'#13#10'  E.TP_SOLICITACAO_COMPRA,'#13#10'  ' +
      'G.NOME,'#13#10'  G.NOME_COMPLETO,'#13#10'  I.CD_UNIDADE_ADM,'#13#10'  I.DS_UNIDADE' +
      '_ADM,'#13#10'  H.CD_CENTRO_CONSUMO,'#13#10'  H.DS_CENTRO_CONSUMO,'#13#10#13#10'  A.ESP' +
      'ECIFICACAO,'#13#10'  A.QUANTITATIVO,'#13#10'  A.UN_SERVICO,'#13#10'  B.UN_MATERIAL' +
      ','#13#10'  B.CD_MATERIAL,'#13#10'  B.DS_MATERIAL,'#13#10'  D.CD_GRUPO_SERVICO,'#13#10'  ' +
      'C.CD_GRUPO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'  C.DS_GRUPO_SERVICO' +
      ' AS DS_SUBGRUPO_SERVICO'#13#10'FROM'#13#10'  SUP_COMPRA_ITEM A'#13#10'  LEFT JOIN ' +
      'SUP_PROC_COMPRA_ITEM F ON F.ID_PROC_COMPRA_ITEM = A.ID_PROC_COMP' +
      'RA_ITEM'#13#10'  LEFT JOIN SUP_MATERIAL B ON B.ID_MATERIAL = COALESCE(' +
      'F.ID_MATERIAL, A.ID_MATERIAL)'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO C O' +
      'N C.ID_GRUPO_SERVICO = COALESCE(F.ID_GRUPO_SERVICO, A.ID_GRUPO_S' +
      'ERVICO)'#13#10'  LEFT JOIN SUP_GRUPO_SERVICO D ON D.ID_GRUPO_SERVICO =' +
      ' C.ID_GRUPO_SERVICO_PAI'#13#10'  LEFT JOIN SUP_SOLICITACAO_COMPRA E ON' +
      ' E.ID_SOLICITACAO_COMPRA = A.ID_SOLICITACAO_COMPRA'#13#10'  LEFT JOIN ' +
      'AAC_USUARIOS G ON G.CODIGO_USUARIO = E.ID_SOLICITANTE'#13#10'  LEFT JO' +
      'IN SUP_CENTRO_CONSUMO H ON H.ID_CENTRO_CONSUMO = E.ID_CENTRO_CON' +
      'SUMO'#13#10'  LEFT JOIN SUP_UNIDADE_ADM I ON I.ID_UNIDADE_ADM = H.ID_U' +
      'NIDADE_ADM'#13#10'WHERE'#13#10'  A.ID_COMPRA_ITEM = :ID_COMPRA_ITEM'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COMPRA_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 304
    Top = 71
  end
  object DspRessuprimento: TDataSetProvider
    DataSet = SqlRessuprimento
    Options = [poRetainServerOrder, poUseQuoteChar]
    BeforeGetRecords = DspRessuprimentoBeforeGetRecords
    Left = 440
    Top = 24
  end
  object SqlRessuprimento: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT ANO_SOLICITACAO_COMPRA'#13#10'     , NR_SOLICITACAO_COMPRA'#13#10'   ' +
      '  , TP_SOLICITACAO'#13#10'     , DT_SOLICITACAO_COMPRA'#13#10'     , ORDEM'#13#10 +
      '     , CD_MATERIAL'#13#10'     , DS_MATERIAL'#13#10'     , UN_MATERIAL'#13#10'    ' +
      ' , TP_MATERIAL'#13#10'     , CD_SUBGRUPO'#13#10'     , CD_GRUPO'#13#10'     , QTD_' +
      'ADJUDICADA - QTD_LIBERACAO_NF AS QTD_NAO_ENTREGUE'#13#10'     , QTD_EM' +
      '_DEFINICAO_DE_DOTACAO'#13#10'     , QTD_AGUARDANDO_PROCESSO'#13#10'     , QT' +
      'D_EM_PROCESSO'#13#10'     , QTD_ADJUDICADA - QTD_SE          AS QTD_EM' +
      '_ADJUDICACAO'#13#10'     , QTD_SE - QTD_AF                  AS QTD_EM_' +
      'SE'#13#10'     , QTD_AF - QTD_LIBERACAO_NF        AS QTD_EM_AF'#13#10'     ,' +
      ' LISTA_AF'#13#10'  FROM (SELECT A.CP_ANO AS ANO_SOLICITACAO_COMPRA'#13#10'  ' +
      '           , A.NR_SOLICITACAO_COMPRA'#13#10'             , A.TP_SOLICI' +
      'TACAO'#13#10'             , A.DT_SOLICITACAO_COMPRA'#13#10'             , G.' +
      'ORDEM'#13#10'             , B.CD_MATERIAL'#13#10'             , B.DS_MATERIA' +
      'L'#13#10'             , B.DS_COMPLETA'#13#10'             , B.UN_MATERIAL'#13#10' ' +
      '            , B.TP_MATERIAL'#13#10'             , C.CD_GRUPO AS CD_SUB' +
      'GRUPO'#13#10'             , D.CD_GRUPO AS CD_GRUPO'#13#10'             , CAS' +
      'E WHEN G.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_LIB_DOT'#13#10'             ' +
      '       THEN G.QTD'#13#10'                    ELSE 0'#13#10'               EN' +
      'D QTD_EM_DEFINICAO_DE_DOTACAO'#13#10'             , CASE WHEN G.ST_COM' +
      'PRA_ITEM IN (:ST_COMPRA_ITEM_LIB_LIBERACAO, :ST_COMPRA_ITEM_LIB_' +
      'COMPRA)'#13#10'                    THEN G.QTD'#13#10'                    ELS' +
      'E 0'#13#10'               END QTD_AGUARDANDO_PROCESSO'#13#10'             , ' +
      'CASE WHEN G.ST_COMPRA_ITEM = :ST_COMPRA_ITEM_EM_PROCESSO AND H.I' +
      'D_RATIF_FICHA IS NULL'#13#10'                    THEN G.QTD'#13#10'         ' +
      '           ELSE 0'#13#10'               END QTD_EM_PROCESSO'#13#10'         ' +
      '    , COALESCE(H.QTD, G.QTD) AS QTD_ADJUDICADA'#13#10'    '#13#10'          ' +
      '   , (SELECT COALESCE(SUM( CASE WHEN B1.ID_SOLIC_EMPENHO IS NOT ' +
      'NULL THEN A1.QTD ELSE A1.QTD * -1 END), 0)'#13#10'                  FR' +
      'OM SUP_SOLIC_EMPENHO_FICHA A1'#13#10'                       LEFT JOIN ' +
      'SUP_SOLIC_EMPENHO_ITEM B1 ON B1.ID_SOLIC_EMPENHO_ITEM = A1.ID_SO' +
      'LIC_EMPENHO_ITEM'#13#10'                       LEFT JOIN SUP_SOLIC_EMP' +
      'ENHO C1 ON C1.ID_SOLIC_EMPENHO = B1.ID_SOLIC_EMPENHO'#13#10'          ' +
      '             LEFT JOIN SUP_SOLIC_ESTORNO D1 ON D1.ID_SOLIC_ESTOR' +
      'NO = B1.ID_SOLIC_ESTORNO'#13#10'                 WHERE A1.ID_RATIF_FIC' +
      'HA = H.ID_RATIF_FICHA'#13#10'                   AND COALESCE(C1.ID_ST_' +
      'SOLIC_EMPENHO, D1.ID_ST_SOLIC_EMPENHO) <> :ST_PEDIDO_COMPOSICAO_' +
      'CANCELADO ) AS QTD_SE'#13#10#13#10'             , (SELECT COALESCE(SUM(B1.' +
      'QTD), 0)'#13#10'                       FROM SUP_SOLIC_EMPENHO_FICHA A1' +
      #13#10'                            LEFT JOIN SUP_AUTORIZACAO_FICHA B1' +
      ' ON B1.ID_SOLIC_EMPENHO_FICHA = A1.ID_SOLIC_EMPENHO_FICHA'#13#10'     ' +
      '                       LEFT JOIN SUP_AUTORIZACAO       C1 ON C1.' +
      'ID_AUTORIZACAO = B1.ID_AUTORIZACAO'#13#10'                WHERE A1.ID_' +
      'RATIF_FICHA = H.ID_RATIF_FICHA'#13#10'                  AND C1.ID_ST_A' +
      'UTORIZACAO IN (:ST_AUTORIZACAO_ABERTO, :ST_AUTORIZACAO_FINALIZAD' +
      'O)                 ) AS QTD_AF'#13#10'                '#13#10'             ,' +
      ' (SELECT LIST('#39'AF '#39' || C1.NR_AUTORIZACAO || '#39'/'#39' || C1.ANO_AUTORI' +
      'ZACAO, '#39', '#39')'#13#10'                  FROM SUP_SOLIC_EMPENHO_FICHA A1'#13 +
      #10'                       LEFT JOIN SUP_AUTORIZACAO_FICHA B1 ON B1' +
      '.ID_SOLIC_EMPENHO_FICHA  = A1.ID_SOLIC_EMPENHO_FICHA'#13#10'          ' +
      '             LEFT JOIN SUP_AUTORIZACAO       C1 ON C1.ID_AUTORIZ' +
      'ACAO          = B1.ID_AUTORIZACAO'#13#10'                 WHERE A1.ID_' +
      'RATIF_FICHA = H.ID_RATIF_FICHA'#13#10'                   AND C1.ID_ST_' +
      'AUTORIZACAO = :ST_AUTORIZACAO_ABERTO                            ' +
      '                   ) AS LISTA_AF'#13#10'    '#13#10'             , (SELECT C' +
      'OALESCE(SUM(C1.QTD), 0)'#13#10'                  FROM SUP_SOLIC_EMPENH' +
      'O_FICHA A1'#13#10'                       LEFT JOIN SUP_AUTORIZACAO_FIC' +
      'HA B1 ON B1.ID_SOLIC_EMPENHO_FICHA = A1.ID_SOLIC_EMPENHO_FICHA'#13#10 +
      '                       LEFT JOIN SUP_LIBERACAO_NF_FICHA C1 ON C1' +
      '.ID_AUTORIZACAO_FICHA = B1.ID_AUTORIZACAO_FICHA'#13#10'               ' +
      '        LEFT JOIN SUP_LIBERACAO_NF D1 ON D1.ID_LIBERACAO_NF = C1' +
      '.ID_LIBERACAO_NF'#13#10'                 WHERE A1.ID_RATIF_FICHA = H.I' +
      'D_RATIF_FICHA'#13#10'                   AND D1.ID_ST_LIBERACAO_NF IN (' +
      ':ST_LIBERACAO_NF_PENDENTE, :ST_LIBERACAO_NF_LIBERADO)           ' +
      '  ) AS QTD_LIBERACAO_NF'#13#10#13#10'          FROM SUP_SOLICITACAO_COMPRA' +
      ' A'#13#10'               LEFT JOIN SUP_COMPRA_ITEM        G ON G.ID_SO' +
      'LICITACAO_COMPRA  = A.ID_SOLICITACAO_COMPRA'#13#10'               LEFT' +
      ' JOIN SUP_MATERIAL           B ON B.ID_MATERIAL            = G.I' +
      'D_MATERIAL'#13#10'               LEFT JOIN SUP_GRUPO              C ON' +
      ' C.ID_GRUPO               = B.ID_GRUPO'#13#10'               LEFT JOIN' +
      ' SUP_GRUPO              D ON D.ID_GRUPO               = C.ID_GRU' +
      'PO_PAI'#13#10'               LEFT JOIN SUP_PROC_COMPRA_ITEM   E ON E.I' +
      'D_PROC_COMPRA_ITEM    = G.ID_PROC_COMPRA_ITEM'#13#10'               LE' +
      'FT JOIN SUP_RATIF_FICHA_DADOS  F ON F.ID_COMPRA_ITEM         = G' +
      '.ID_COMPRA_ITEM'#13#10'               LEFT JOIN SUP_RATIF_FICHA       ' +
      ' H ON H.ID_RATIF_FICHA_DADOS   = F.ID_RATIF_FICHA_DADOS'#13#10'       ' +
      '        LEFT JOIN SUP_PROCESSO_COMPRA    I ON I.ID_PROCESSO_COMP' +
      'RA     = E.ID_PROCESSO_COMPRA'#13#10'         WHERE A.CP_ANO = :CP_ANO' +
      #13#10'           AND G.ST_COMPRA_ITEM IN (:ST_COMPRA_ITEM_LIB_DOT, :' +
      'ST_COMPRA_ITEM_LIB_LIBERACAO, :ST_COMPRA_ITEM_LIB_COMPRA, :ST_CO' +
      'MPRA_ITEM_EM_PROCESSO)'#13#10'           AND A.ST_SOLICITACAO_COMPRA =' +
      ' :ST_SOLICITACAO_COMPRA_APROVADA'#13#10'           AND A.TP_SOLICITACA' +
      'O_COMPRA = :TP_SOLICITACAO_COMPRA_MATERIAL'#13#10'           AND (E.AN' +
      'ULADO IS NULL OR E.ANULADO = 0)'#13#10'           AND I.ID_ST_PROCESSO' +
      '_COMPRA NOT IN (4, 5)'#13#10'          /*FILTRO_PERSONALIZADO*/'#13#10'     ' +
      '    ORDER BY'#13#10'               A.CP_ANO,'#13#10'               A.NR_SOLI' +
      'CITACAO_COMPRA,'#13#10'                G.ORDEM'#13#10'       )'#13#10' WHERE UDF_R' +
      'OUNDDEC(QTD_ADJUDICADA - QTD_LIBERACAO_NF, 4) > 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EM_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_FINALIZADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_AUTORIZACAO_ABERTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_PENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_LIBERACAO_NF_LIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CP_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_DOT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_LIBERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_LIB_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_COMPRA_ITEM_EM_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_SOLICITACAO_COMPRA_APROVADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TP_SOLICITACAO_COMPRA_MATERIAL'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 440
    Top = 71
  end
  object DspSEESolicitado: TDataSetProvider
    DataSet = SqlSEESolicitado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 48
    Top = 504
  end
  object SqlSEESolicitado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'STORNO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_ESTORNO,'#13#10'       Q.DT_SOLI' +
      'CITACAO AS DATA,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO'#13#10'  FROM' +
      ' SUP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS    H ' +
      'ON H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RAT' +
      'IF_FICHA          A ON A.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA' +
      '_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM           K ON K.ID_RATI' +
      'F_ITEM = A.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_MATERIAL       ' +
      '      C ON C.ID_MATERIAL = K.ID_MATERIAL'#13#10'       LEFT JOIN SUP_G' +
      'RUPO                D ON D.ID_GRUPO = C.ID_GRUPO'#13#10'       LEFT JO' +
      'IN SUP_GRUPO                E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  ' +
      '     LEFT JOIN SUP_GRUPO_SERVICO        F ON F.ID_GRUPO_SERVICO ' +
      '= K.ID_GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO        ' +
      'G ON G.ID_GRUPO_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'       LEFT ' +
      'JOIN SUP_RATIF_FICHA_DADOS    O ON O.ID_COMPRA_ITEM = B.ID_COMPR' +
      'A_ITEM'#13#10'       LEFT JOIN SUP_RATIF_FICHA          N ON N.ID_RATI' +
      'F_FICHA_DADOS = O.ID_RATIF_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RAT' +
      'IF_ITEM           I ON I.ID_RATIF_ITEM = N.ID_RATIF_ITEM'#13#10'  '#13#10'  ' +
      '     LEFT JOIN SUP_PROCESSO_COMPRA      J ON J.ID_PROCESSO_COMPR' +
      'A = I.ID_PROCESSO_COMPRA'#13#10'       LEFT JOIN AAC_USUARIOS         ' +
      '    L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'       LEFT JOIN SUP' +
      '_MODALIDADE           M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10#13#10 +
      '       LEFT JOIN SUP_SOLIC_EMPENHO_FICHA  P ON P.ID_RATIF_FICHA ' +
      '= N.ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM   X ' +
      'ON X.ID_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       LEF' +
      'T JOIN SUP_SOLIC_ESTORNO        Q ON Q.ID_SOLIC_ESTORNO = X.ID_S' +
      'OLIC_ESTORNO'#13#10'       LEFT JOIN SUP_CONTRATO             S ON S.I' +
      'D_CONTRATO = I.ID_CONTRATO'#13#10'       LEFT JOIN SIS_PESSOA         ' +
      '      U ON U.ID_PESSOA = S.ID_CREDOR'#13#10'       LEFT JOIN AAC_USUAR' +
      'IOS             V ON V.CODIGO_USUARIO = Q.ID_SOLICITANTE'#13#10'WHERE ' +
      'B.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA'#13#10'  AND Q.ID_ST_' +
      'SOLIC_EMPENHO   = 0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 48
    Top = 551
  end
  object DspSEELiberado: TDataSetProvider
    DataSet = SqlSEELiberado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 136
    Top = 504
  end
  object SqlSEELiberado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'STORNO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_ESTORNO,'#13#10'       Q.DT_SOLI' +
      'CITACAO AS DATA,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO'#13#10'  FROM' +
      ' SUP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS H ON ' +
      'H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_' +
      'FICHA A ON A.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA_DADOS'#13#10'    ' +
      '   LEFT JOIN SUP_RATIF_ITEM K ON K.ID_RATIF_ITEM = A.ID_RATIF_IT' +
      'EM'#13#10#13#10'       LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = K.ID_MA' +
      'TERIAL'#13#10'       LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13 +
      #10'       LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  ' +
      '     LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = K.ID_' +
      'GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUP' +
      'O_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'       LEFT JOIN SUP_RATIF' +
      '_FICHA_DADOS O ON O.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LE' +
      'FT JOIN SUP_RATIF_FICHA N ON N.ID_RATIF_FICHA_DADOS = O.ID_RATIF' +
      '_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM I ON I.ID_RATIF_IT' +
      'EM = N.ID_RATIF_ITEM'#13#10'      '#13#10'       LEFT JOIN SUP_PROCESSO_COMP' +
      'RA J ON J.ID_PROCESSO_COMPRA = I.ID_PROCESSO_COMPRA'#13#10'       LEFT' +
      ' JOIN AAC_USUARIOS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'     ' +
      '  LEFT JOIN SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID_MODALIDAD' +
      'E'#13#10#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RATIF_FI' +
      'CHA = N.ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM ' +
      'X ON X.ID_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       L' +
      'EFT JOIN SUP_SOLIC_ESTORNO Q ON Q.ID_SOLIC_ESTORNO = X.ID_SOLIC_' +
      'ESTORNO'#13#10#13#10'       LEFT JOIN SUP_CONTRATO S ON S.ID_CONTRATO = I.' +
      'ID_CONTRATO'#13#10'       LEFT JOIN SIS_PESSOA U ON U.ID_PESSOA = S.ID' +
      '_CREDOR'#13#10'       LEFT JOIN AAC_USUARIOS V ON V.CODIGO_USUARIO = Q' +
      '.ID_SOLICITANTE'#13#10' WHERE B.ID_SOLICITACAO_COMPRA = :ID_SOLICITACA' +
      'O_COMPRA'#13#10'   AND Q.ID_ST_SOLIC_EMPENHO = 3'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 136
    Top = 551
  end
  object DspSEEEstornado: TDataSetProvider
    DataSet = SqlSEEEstornado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 224
    Top = 504
  end
  object SqlSEEEstornado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'STORNO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_ESTORNO,'#13#10'       Q.DT_SOLI' +
      'CITACAO AS DATA,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO'#13#10'  FROM' +
      ' SUP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS H ON ' +
      'H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_' +
      'FICHA A ON A.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA_DADOS'#13#10'    ' +
      '   LEFT JOIN SUP_RATIF_ITEM K ON K.ID_RATIF_ITEM = A.ID_RATIF_IT' +
      'EM'#13#10#13#10'       LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = K.ID_MA' +
      'TERIAL'#13#10'       LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13 +
      #10'       LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  ' +
      '     LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = K.ID_' +
      'GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUP' +
      'O_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'       LEFT JOIN SUP_RATIF' +
      '_FICHA_DADOS O ON O.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LE' +
      'FT JOIN SUP_RATIF_FICHA N ON N.ID_RATIF_FICHA_DADOS = O.ID_RATIF' +
      '_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM I ON I.ID_RATIF_IT' +
      'EM = N.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_PROCESSO_COMPRA J O' +
      'N J.ID_PROCESSO_COMPRA = I.ID_PROCESSO_COMPRA'#13#10'       LEFT JOIN ' +
      'AAC_USUARIOS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'       LEFT' +
      ' JOIN SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10#13#10' ' +
      '      LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RATIF_FICHA = ' +
      'N.ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM X ON X' +
      '.ID_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       LEFT JO' +
      'IN SUP_SOLIC_ESTORNO Q ON Q.ID_SOLIC_ESTORNO = X.ID_SOLIC_ESTORN' +
      'O'#13#10'       LEFT JOIN SUP_CONTRATO S ON S.ID_CONTRATO = I.ID_CONTR' +
      'ATO'#13#10'       LEFT JOIN SIS_PESSOA U ON U.ID_PESSOA = T.ID_PESSOA'#13 +
      #10'       LEFT JOIN AAC_USUARIOS V ON V.CODIGO_USUARIO = Q.ID_SOLI' +
      'CITANTE'#13#10' WHERE B.ID_SOLICITACAO_COMPRA   = :ID_SOLICITACAO_COMP' +
      'RA'#13#10'   AND Q.ID_ST_SOLIC_EMPENHO = 1'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 224
    Top = 551
  end
  object DspSECancelado: TDataSetProvider
    DataSet = SqlSECancelado
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 584
    Top = 488
  end
  object SqlSECancelado: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT'#13#10'       B.ID_COMPRA_ITEM,'#13#10'       B.UN_SERVICO,'#13 +
      #10'       B.ESPECIFICACAO,'#13#10'       P.QTD,'#13#10'       P.VALOR AS VL_TO' +
      'TAL,'#13#10'       K.QUANTITATIVO,'#13#10'       C.CD_MATERIAL,'#13#10'       C.DS' +
      '_MATERIAL,'#13#10'       C.UN_MATERIAL,'#13#10'       C.TP_MATERIAL,'#13#10'      ' +
      ' D.CD_GRUPO AS CD_SUBGRUPO,'#13#10'       E.CD_GRUPO,'#13#10'       F.CD_GRU' +
      'PO_SERVICO AS CD_SUBGRUPO_SERVICO,'#13#10'       G.CD_GRUPO_SERVICO,'#13#10 +
      '       J.NR_PROCESSO_COMPRA,'#13#10'       J.ANO_PROCESSO_COMPRA,'#13#10'   ' +
      '    L.NOME AS NOME_COMPRADOR,'#13#10'       L.NOME_COMPLETO AS NOME_CO' +
      'MPLETO_COMPRADOR,'#13#10'       J.NR_MODALIDADE,'#13#10'       J.ANO_MODALID' +
      'ADE,'#13#10'       M.SIGLA,'#13#10'       S.NR_CONTRATO,'#13#10'       S.ANO_CONTR' +
      'ATO,'#13#10'       U.NOME_RAZAO AS DS_FORNECEDOR,'#13#10'       Q.NR_SOLIC_E' +
      'MPENHO,'#13#10'       Q.CP_ANO AS ANO_SOLIC_EMPENHO,'#13#10'       Q.DT_SOLI' +
      'CITACAO AS DATA,'#13#10'       V.NOME,'#13#10'       V.NOME_COMPLETO'#13#10'  FROM' +
      ' SUP_COMPRA_ITEM B'#13#10'       LEFT JOIN SUP_RATIF_FICHA_DADOS H ON ' +
      'H.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LEFT JOIN SUP_RATIF_' +
      'FICHA A ON A.ID_RATIF_FICHA_DADOS = H.ID_RATIF_FICHA_DADOS'#13#10'    ' +
      '   LEFT JOIN SUP_RATIF_ITEM K ON K.ID_RATIF_ITEM = A.ID_RATIF_IT' +
      'EM'#13#10#13#10'       LEFT JOIN SUP_MATERIAL C ON C.ID_MATERIAL = K.ID_MA' +
      'TERIAL'#13#10'       LEFT JOIN SUP_GRUPO D ON D.ID_GRUPO = C.ID_GRUPO'#13 +
      #10'       LEFT JOIN SUP_GRUPO E ON E.ID_GRUPO = D.ID_GRUPO_PAI'#13#10'  ' +
      '     LEFT JOIN SUP_GRUPO_SERVICO F ON F.ID_GRUPO_SERVICO = K.ID_' +
      'GRUPO_SERVICO'#13#10'       LEFT JOIN SUP_GRUPO_SERVICO G ON G.ID_GRUP' +
      'O_SERVICO = F.ID_GRUPO_SERVICO_PAI'#13#10#13#10'       LEFT JOIN SUP_RATIF' +
      '_FICHA_DADOS O ON O.ID_COMPRA_ITEM = B.ID_COMPRA_ITEM'#13#10'       LE' +
      'FT JOIN SUP_RATIF_FICHA N ON N.ID_RATIF_FICHA_DADOS = O.ID_RATIF' +
      '_FICHA_DADOS'#13#10'       LEFT JOIN SUP_RATIF_ITEM I ON I.ID_RATIF_IT' +
      'EM = N.ID_RATIF_ITEM'#13#10#13#10'       LEFT JOIN SUP_PROCESSO_COMPRA J O' +
      'N J.ID_PROCESSO_COMPRA = I.ID_PROCESSO_COMPRA'#13#10'       LEFT JOIN ' +
      'AAC_USUARIOS L ON L.CODIGO_USUARIO = J.ID_COMPRADOR'#13#10'       LEFT' +
      ' JOIN SUP_MODALIDADE M ON M.ID_MODALIDADE = J.ID_MODALIDADE'#13#10#13#10' ' +
      '      LEFT JOIN SUP_SOLIC_EMPENHO_FICHA P ON P.ID_RATIF_FICHA = ' +
      'N.ID_RATIF_FICHA'#13#10'       LEFT JOIN SUP_SOLIC_EMPENHO_ITEM X ON X' +
      '.ID_SOLIC_EMPENHO_ITEM = P.ID_SOLIC_EMPENHO_ITEM'#13#10'       LEFT JO' +
      'IN SUP_SOLIC_EMPENHO Q ON Q.ID_SOLIC_EMPENHO = X.ID_SOLIC_EMPENH' +
      'O'#13#10'       LEFT JOIN SUP_CONTRATO S ON S.ID_CONTRATO = I.ID_CONTR' +
      'ATO'#13#10'       LEFT JOIN SIS_PESSOA U ON U.ID_PESSOA = S.ID_CREDOR'#13 +
      #10'       LEFT JOIN AAC_USUARIOS V ON V.CODIGO_USUARIO = Q.ID_SOLI' +
      'CITANTE'#13#10' WHERE B.ID_SOLICITACAO_COMPRA = :ID_SOLICITACAO_COMPRA' +
      #13#10'   AND Q.ID_ST_SOLIC_EMPENHO   = :ST_PEDIDO_COMPOSICAO_CANCELA' +
      'DO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SOLICITACAO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ST_PEDIDO_COMPOSICAO_CANCELADO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 584
    Top = 535
  end
end
