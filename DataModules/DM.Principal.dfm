object DMPrincipal: TDMPrincipal
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Delphi\Posto-ABC-Kaue\POSTO_ABC_DB.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 272
    Top = 80
  end
  object qryGridAbastecimento: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvEInsert, uvEUpdate, uvAutoCommitUpdates]
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'SELECT ID_ABASTECIMENTO,'
      'ID_BOMBA,'
      'DATA_HORA,'
      'LITROS,'
      'VALOR,'
      'VALOR_IMPOSTO'
      'FROM ABASTECIMENTO')
    Left = 408
    Top = 80
    object qryGridAbastecimentoID_ABASTECIMENTO: TIntegerField
      FieldName = 'ID_ABASTECIMENTO'
      Origin = 'ID_ABASTECIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGridAbastecimentoID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      Required = True
    end
    object qryGridAbastecimentoDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object qryGridAbastecimentoLITROS: TFMTBCDField
      FieldName = 'LITROS'
      Origin = 'LITROS'
      Precision = 18
      Size = 3
    end
    object qryGridAbastecimentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 3
    end
    object qryGridAbastecimentoVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      Precision = 18
      Size = 3
    end
  end
end
