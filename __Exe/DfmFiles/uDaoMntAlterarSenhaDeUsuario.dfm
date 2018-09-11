inherited DaoMntAlterarSenhaUsuario: TDaoMntAlterarSenhaUsuario
  OldCreateOrder = True
  Height = 175
  Width = 163
  object SqlAlterarUsuario: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT'#13#10'  A.CODIGO_USUARIO,'#13#10'  A.NOME,'#13#10'  A.NOME_COMPLETO,'#13#10'  A.' +
      'SENHA,'#13#10'  A.INTRUSO'#13#10'FROM'#13#10'  AAC_USUARIOS  A'#13#10'WHERE'#13#10'  A.CODIGO_' +
      'USUARIO = :CODIGO_USUARIO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 51
    Top = 37
    object SqlAlterarUsuarioCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Required = True
    end
    object SqlAlterarUsuarioSENHA: TIntegerField
      FieldName = 'SENHA'
      Required = True
    end
    object SqlAlterarUsuarioINTRUSO: TStringField
      FieldName = 'INTRUSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object SqlAlterarUsuarioNOME: TStringField
      FieldName = 'NOME'
      Required = True
      FixedChar = True
      Size = 15
    end
    object SqlAlterarUsuarioNOME_COMPLETO: TStringField
      FieldName = 'NOME_COMPLETO'
      Required = True
      FixedChar = True
      Size = 40
    end
  end
  object SqlUpdateSenhaUsuario: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'UPDATE AAC_USUARIOS A'#13#10'  SET A.SENHA = :SENHA, A.CRC = :CRC, A.I' +
      'NTRUSO = "N"'#13#10'WHERE'#13#10' A.CODIGO_USUARIO = :CODIGO_USUARIO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CRC'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = DaoConexao.SqcConexao
    Left = 52
    Top = 93
  end
end
