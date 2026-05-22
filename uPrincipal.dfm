object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Escolar REST'
  ClientHeight = 421
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 40
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 40
  object Label1: TLabel
    Left = 20
    Top = 7
    Width = 135
    Height = 40
    Cursor = crHandPoint
    Caption = 'Cadastros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = 40
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 120
    Top = 7
    Width = 103
    Height = 40
    Cursor = crHandPoint
    Caption = 'Servi'#231'os'
  end
  object Label3: TLabel
    Left = 220
    Top = 7
    Width = 47
    Height = 40
    Cursor = crHandPoint
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = 40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 90
    Hint = '90'
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Sistema Escolar - Delphi 12'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object PnlMenu: TPanel
      Left = 0
      Top = 16
      Width = 624
      Height = 74
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'SGE '#8212' Sistema de Gest'#227'o Escolar'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 144
    object Servios1: TMenuItem
      Caption = 'Servi'#231'os'
      object APIREST1: TMenuItem
        Caption = 'API REST'
        OnClick = APIREST1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Alunos1: TMenuItem
        Caption = 'Alunos'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
