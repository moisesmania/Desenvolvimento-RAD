object frmAlunos: TfrmAlunos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Alunos'
  ClientHeight = 600
  ClientWidth = 900
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 170
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 120
      Top = 16
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 390
      Top = 16
      Width = 29
      Height = 15
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 120
      Top = 64
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object Label5: TLabel
      Left = 320
      Top = 64
      Width = 29
      Height = 15
      Caption = 'Idade'
    end
    object edtNome: TEdit
      Left = 120
      Top = 32
      Width = 250
      Height = 23
      TabOrder = 0
    end
    object edtEmail: TEdit
      Left = 390
      Top = 32
      Width = 250
      Height = 23
      TabOrder = 1
    end
    object edtTelefone: TEdit
      Left = 120
      Top = 80
      Width = 180
      Height = 23
      TabOrder = 2
    end
    object edtIdade: TEdit
      Left = 320
      Top = 80
      Width = 80
      Height = 23
      TabOrder = 3
    end
    object btnSalvar: TButton
      Left = 224
      Top = 134
      Width = 90
      Height = 30
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 342
      Top = 134
      Width = 90
      Height = 30
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object edtPesquisar: TEdit
      Left = 500
      Top = 120
      Width = 200
      Height = 23
      TabOrder = 6
    end
    object btnPesquisar: TButton
      Left = 720
      Top = 118
      Width = 120
      Height = 30
      Caption = 'Pesquisar'
      TabOrder = 7
      OnClick = btnPesquisarClick
    end
    object btnEditar: TButton
      Left = 128
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 8
      OnClick = btnEditarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 170
    Width = 900
    Height = 430
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=prova'
      'User_Name=root'
      'DriverID=MySQL')
    Left = 664
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 664
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 672
    Top = 136
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\moise\Downloads\SGA_Delphi12_Completo_Final\libmysql\li' +
      'bmysql.dll'
    Left = 664
    Top = 192
  end
end
