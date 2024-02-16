object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 650
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 650
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 713
    ExplicitHeight = 649
    DesignSize = (
      717
      650)
    object Label4: TLabel
      Left = 367
      Top = 587
      Width = 56
      Height = 15
      Caption = 'Data in'#237'cio'
    end
    object Label8: TLabel
      Left = 473
      Top = 587
      Width = 50
      Height = 15
      Caption = 'Data final'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 715
      Height = 328
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 711
      object pnlBomba1: TPanel
        Left = 9
        Top = 1
        Width = 346
        Height = 160
        TabOrder = 0
        object lblBomba1: TLabel
          Left = 15
          Top = 11
          Width = 42
          Height = 15
          Caption = 'BOMBA'
        end
        object Label1: TLabel
          Left = 15
          Top = 65
          Width = 55
          Height = 15
          Caption = 'Valor/Litro'
        end
        object Label2: TLabel
          Left = 15
          Top = 35
          Width = 29
          Height = 15
          Caption = 'Litros'
        end
        object Label3: TLabel
          Left = 15
          Top = 95
          Width = 73
          Height = 15
          Caption = 'Valor Imposto'
        end
        object edtValorLitro1: TEdit
          Left = 112
          Top = 62
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          StyleElements = [seFont, seBorder]
        end
        object edtLitros1: TEdit
          Left = 112
          Top = 32
          Width = 121
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
        end
        object edtValorImposto1: TEdit
          Left = 112
          Top = 92
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          StyleElements = [seFont, seBorder]
        end
        object btnAbastece1: TButton
          Left = 248
          Top = 53
          Width = 81
          Height = 41
          Caption = 'Abastece'
          TabOrder = 3
          OnClick = btnAbastece1Click
        end
      end
      object Panel3: TPanel
        Left = 361
        Top = 1
        Width = 346
        Height = 160
        TabOrder = 1
        object lblBomba2: TLabel
          Left = 15
          Top = 11
          Width = 42
          Height = 15
          Caption = 'BOMBA'
        end
        object Label5: TLabel
          Left = 15
          Top = 65
          Width = 55
          Height = 15
          Caption = 'Valor/Litro'
        end
        object Label6: TLabel
          Left = 15
          Top = 35
          Width = 29
          Height = 15
          Caption = 'Litros'
        end
        object Label7: TLabel
          Left = 15
          Top = 95
          Width = 73
          Height = 15
          Caption = 'Valor Imposto'
        end
        object edtValorLitro2: TEdit
          Left = 112
          Top = 62
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          StyleElements = [seFont, seBorder]
        end
        object edtLitros2: TEdit
          Left = 112
          Top = 32
          Width = 121
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
        end
        object edtValorImposto2: TEdit
          Left = 112
          Top = 92
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          StyleElements = [seFont, seBorder]
        end
        object btnAbastece2: TButton
          Left = 256
          Top = 53
          Width = 81
          Height = 41
          Caption = 'Abastece'
          TabOrder = 3
          OnClick = btnAbastece2Click
        end
      end
      object Panel4: TPanel
        Left = 9
        Top = 162
        Width = 346
        Height = 160
        TabOrder = 2
        object lblBomba3: TLabel
          Left = 15
          Top = 11
          Width = 42
          Height = 15
          Caption = 'BOMBA'
        end
        object Label9: TLabel
          Left = 15
          Top = 65
          Width = 55
          Height = 15
          Caption = 'Valor/Litro'
        end
        object Label10: TLabel
          Left = 15
          Top = 35
          Width = 29
          Height = 15
          Caption = 'Litros'
        end
        object Label11: TLabel
          Left = 15
          Top = 95
          Width = 73
          Height = 15
          Caption = 'Valor Imposto'
        end
        object edtValorLitro3: TEdit
          Left = 112
          Top = 62
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          StyleElements = [seFont, seBorder]
        end
        object edtLitros3: TEdit
          Left = 112
          Top = 32
          Width = 121
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
        end
        object edtValorImposto3: TEdit
          Left = 112
          Top = 92
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          StyleElements = [seFont, seBorder]
        end
        object btnAbastece3: TButton
          Left = 248
          Top = 53
          Width = 81
          Height = 41
          Caption = 'Abastece'
          TabOrder = 3
          OnClick = btnAbastece3Click
        end
      end
      object Panel5: TPanel
        Left = 361
        Top = 162
        Width = 346
        Height = 160
        TabOrder = 3
        object lblBomba4: TLabel
          Left = 15
          Top = 11
          Width = 42
          Height = 15
          Caption = 'BOMBA'
        end
        object Label13: TLabel
          Left = 15
          Top = 65
          Width = 55
          Height = 15
          Caption = 'Valor/Litro'
        end
        object Label14: TLabel
          Left = 15
          Top = 35
          Width = 29
          Height = 15
          Caption = 'Litros'
        end
        object Label15: TLabel
          Left = 15
          Top = 95
          Width = 73
          Height = 15
          Caption = 'Valor Imposto'
        end
        object edtValorLitro4: TEdit
          Left = 112
          Top = 62
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          StyleElements = [seFont, seBorder]
        end
        object edtLitros4: TEdit
          Left = 112
          Top = 32
          Width = 121
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
        end
        object edtValorImposto4: TEdit
          Left = 112
          Top = 92
          Width = 121
          Height = 23
          Alignment = taRightJustify
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          StyleElements = [seFont, seBorder]
        end
        object btnAbastece4: TButton
          Left = 248
          Top = 53
          Width = 81
          Height = 41
          Caption = 'Abastece'
          TabOrder = 3
          OnClick = btnAbastece4Click
        end
      end
    end
    object btnReport: TButton
      Left = 585
      Top = 590
      Width = 121
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = 'Relat'#243'rio'
      TabOrder = 1
      OnClick = btnReportClick
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 329
      Width = 715
      Height = 236
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsGridAbastecimento
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_ABASTECIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_BOMBA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_HORA'
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITROS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_IMPOSTO'
          Width = 64
          Visible = True
        end>
    end
    object dtInicio: TDateTimePicker
      Left = 367
      Top = 608
      Width = 100
      Height = 23
      Date = 45338.000000000000000000
      Time = 0.180244259259779900
      TabOrder = 3
    end
    object dtFim: TDateTimePicker
      Left = 473
      Top = 608
      Width = 100
      Height = 23
      Date = 45338.000000000000000000
      Time = 0.180244259259779900
      TabOrder = 4
    end
  end
  object dsGridAbastecimento: TDataSource
    DataSet = DMPrincipal.qryGridAbastecimento
    Left = 672
    Top = 472
  end
end
