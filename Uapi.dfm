object frmAPI: TfrmAPI
  Left = 0
  Top = 0
  Caption = 'Usuar'#225'rios API'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  TextHeight = 15
  object btnCarregar: TButton
    Left = 0
    Top = 0
    Width = 800
    Height = 81
    Align = alTop
    Caption = 'Carregar Dados da API'
    TabOrder = 0
    OnClick = btnCarregarClick
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 81
    Width = 800
    Height = 419
    Align = alClient
    TabOrder = 1
    ExplicitTop = 248
    ExplicitHeight = 252
  end
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 704
    Top = 88
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 704
    Top = 136
  end
  object RESTResponse1: TRESTResponse
    Left = 704
    Top = 184
  end
end
