object FrmAPI: TFrmAPI
  Left = 0
  Top = 0
  Caption = 'Consumo API REST'
  ClientHeight = 561
  ClientWidth = 984
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object PnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object BtnBuscar: TButton
    Left = 15
    Top = 12
    Width = 170
    Height = 35
    Caption = 'Carregar Usu'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnBuscarClick
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 60
    Width = 984
    Height = 501
    Align = alClient
    DefaultColWidth = 180
    DefaultRowHeight = 28
    RowCount = 2
    TabOrder = 2
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://jsonplaceholder.typicode.com'
    Params = <>
    SynchronizedEvents = False
    Left = 96
    Top = 248
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = 'users'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 232
    Top = 248
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 360
    Top = 248
  end
end
