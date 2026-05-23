object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'SGA - Sistema de Gerenciamento de Alunos'
  ClientHeight = 700
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object lblMensagem: TLabel
    Left = 0
    Top = 80
    Width = 1000
    Height = 620
    Align = alClient
    Alignment = taCenter
    Caption = 
      'Acesse o menu superior para cadastrar, editar e pesquisar os dad' +
      'os do SGA'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentColor = False
    ParentFont = False
    WordWrap = True
    ExplicitTop = 0
    ExplicitWidth = 847
    ExplicitHeight = 32
  end
  object DBText1: TDBText
    Left = 0
    Top = 0
    Width = 1000
    Height = 80
    Align = alTop
    Alignment = taCenter
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 24
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Alunos1: TMenuItem
        Caption = 'Alunos'
        OnClick = Alunos1Click
      end
    end
    object Integracoes1: TMenuItem
      Caption = 'Integra'#231#245'es'
      object UsuariosAPI1: TMenuItem
        Caption = 'Usu'#225'rios API'
        OnClick = UsuariosAPI1Click
      end
    end
  end
end
