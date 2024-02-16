object ReportAbastecimento: TReportAbastecimento
  Left = 0
  Top = 0
  Caption = 'ReportAbastecimento'
  ClientHeight = 862
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object rpAbastecimentos: TRLReport
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    AdjustableMargins = True
    DataSource = dsReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rpAbastecimentosBeforePrint
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 32
      object RLDBText2: TRLDBText
        Left = 196
        Top = 6
        Width = 76
        Height = 16
        Alignment = taCenter
        DataField = 'ID_TANQUE'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 45
        Top = 8
        Width = 82
        Height = 16
        Alignment = taCenter
        DataField = 'DATA_HORA'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 338
        Top = 6
        Width = 80
        Height = 16
        Alignment = taCenter
        DataField = 'DESCRICAO'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 480
        Top = 6
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 577
        Top = 6
        Width = 114
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_IMPOSTO'
        DataSource = dsReport
        Text = ''
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btColumnHeader
      object RLLabel1: TRLLabel
        Left = 48
        Top = 8
        Width = 80
        Height = 19
        Caption = 'Data/Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 200
        Top = 8
        Width = 62
        Height = 19
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 344
        Top = 8
        Width = 59
        Height = 19
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 481
        Top = 8
        Width = 44
        Height = 19
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 624
        Top = 8
        Width = 66
        Height = 19
        Caption = 'Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 64
      BandType = btColumnFooter
      object RLLabel6: TRLLabel
        Left = 240
        Top = 24
        Width = 138
        Height = 19
        Caption = 'Totais do per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText6: TRLDBText
        Left = 440
        Top = 24
        Width = 95
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL_VALOR'
        DataSource = dsTotais
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 577
        Top = 24
        Width = 110
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTAL_IMPOSTO'
        DataSource = dsTotais
        Text = ''
      end
    end
  end
  object qryReport: TFDQuery
    Connection = DMPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT '
      'A.DATA_HORA,'
      'T.ID_TANQUE,'
      'B.DESCRICAO,'
      'A.VALOR,'
      'A.VALOR_IMPOSTO'
      'FROM ABASTECIMENTO A'
      'JOIN BOMBA B ON A.ID_BOMBA = B.ID_BOMBA'
      'JOIN TANQUE T ON B.ID_TANQUE = T.ID_TANQUE'
      'WHERE CAST(A.DATA_HORA AS DATE) BETWEEN :dtini AND :dtfim;')
    Left = 560
    Top = 248
    ParamData = <
      item
        Name = 'DTINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object qryReportDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object qryReportID_TANQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryReportDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryReportVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 3
    end
    object qryReportVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      Precision = 18
      Size = 3
    end
  end
  object dsReport: TDataSource
    DataSet = qryReport
    Left = 416
    Top = 248
  end
  object qryTotais: TFDQuery
    Connection = DMPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT SUM(AB.VALOR) AS TOTAL_VALOR,'
      'SUM(AB.VALOR_IMPOSTO) AS TOTAL_IMPOSTO'
      'FROM ABASTECIMENTO AB'
      'WHERE CAST(AB.DATA_HORA AS DATE) BETWEEN :dtini AND :dtfim;')
    Left = 424
    Top = 376
    ParamData = <
      item
        Name = 'DTINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryTotaisTOTAL_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_VALOR'
      Origin = 'TOTAL_VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 38
      Size = 3
    end
    object qryTotaisTOTAL_IMPOSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_IMPOSTO'
      Origin = 'TOTAL_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 38
      Size = 3
    end
  end
  object dsTotais: TDataSource
    DataSet = qryTotais
    Left = 296
    Top = 312
  end
end
