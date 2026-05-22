object FrmAlunos: TFrmAlunos
  Left = 0
  Top = 0
  Caption = 'FrmAlunos'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 48
      Height = 19
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 43
      Width = 49
      Height = 19
      Caption = 'E-Mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 419
      Top = 43
      Width = 67
      Height = 19
      Caption = 'Telefone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 419
      Top = 18
      Width = 46
      Height = 19
      Caption = 'Idade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtName: TEdit
      Left = 78
      Top = 16
      Width = 308
      Height = 21
      TabOrder = 0
    end
    object edtEmail: TEdit
      Left = 79
      Top = 43
      Width = 307
      Height = 21
      TabOrder = 1
    end
    object edtTelefone: TEdit
      Left = 492
      Top = 43
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtIdade: TEdit
      Left = 492
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 3
    end
    object btnInserir: TButton
      Left = 513
      Top = 80
      Width = 100
      Height = 25
      Caption = 'Novo / Limpar'
      TabOrder = 4
      OnClick = btnInserirClick
    end
    object Button2Click: TButton
      Left = 407
      Top = 80
      Width = 100
      Height = 25
      Caption = 'Salvar / Gravar'
      TabOrder = 5
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 301
      Top = 80
      Width = 100
      Height = 25
      Caption = 'Excluir Registro'
      TabOrder = 6
      OnClick = btnExcluirClick
    end
    object edtBuscaNome: TEdit
      Left = 24
      Top = 82
      Width = 161
      Height = 21
      TabOrder = 7
    end
    object chkFiltrarMaiores: TCheckBox
      Left = 540
      Top = 20
      Width = 73
      Height = 17
      Caption = '+18'
      TabOrder = 8
    end
  end
  object btnFiltrar: TBitBtn
    Left = 191
    Top = 80
    Width = 104
    Height = 25
    Caption = 'Pesquisar / Filtrar'
    TabOrder = 1
    OnClick = btnFiltrarClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 121
    Width = 635
    Height = 178
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=Prova'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 120
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 408
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 512
    Top = 200
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 264
    Top = 200
  end
end
