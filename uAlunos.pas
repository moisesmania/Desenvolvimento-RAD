unit uAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmAlunos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    edtIdade: TEdit;
    btnInserir: TButton;  // Corrigido para o seu novo Name
    btnExcluir: TButton; // Corrigido para o seu novo Name
    edtBuscaNome: TEdit;
    chkFiltrarMaiores: TCheckBox;
    btnFiltrar: TBitBtn;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink; // Driver MySQL correto
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);   // Ajustado
    procedure btnExcluirClick(Sender: TObject);  // Ajustado
    procedure btnFiltrarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AtribuirCampos;
    procedure AtualizarGrid;
  public
  end;

var
  FrmAlunos: TFrmAlunos;

implementation

{$R *.dfm}

procedure TFrmAlunos.FormCreate(Sender: TObject);
begin
  // Alinha o formulário MDIChild adequadamente
  Position := poDefault;

  // Estrutura SQL usando Parâmetro (:NOME) e Macro (&FILTRO) como pede a prova
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM alunos');
  FDQuery1.SQL.Add('WHERE nome LIKE :NOME');
  FDQuery1.SQL.Add('&FILTRO');
  FDQuery1.SQL.Add('ORDER BY nome');

  try
    FDConnection1.Connected := True;
    AtualizarGrid;
  except
    on E: Exception do
      ShowMessage('Erro ao conectar ao banco MySQL: ' + E.Message);
  end;
end;

procedure TFrmAlunos.AtualizarGrid;
begin
  FDQuery1.Close;

  // PARTE 2: Aplicando o parâmetro de busca por nome
  FDQuery1.ParamByName('NOME').AsString := '%' + edtBuscaNome.Text + '%';

  // PARTE 2: Aplicando a macro para maiores de 18 anos
  if chkFiltrarMaiores.Checked then
    FDQuery1.MacroByName('FILTRO').AsRaw := 'AND idade >= 18'
  else
    FDQuery1.MacroByName('FILTRO').AsRaw := '';

  FDQuery1.Open;
end;

procedure TFrmAlunos.btnFiltrarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TFrmAlunos.btnInserirClick(Sender: TObject);
begin
  // Limpa o formulário para criar um novo aluno
  edtName.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtIdade.Clear;
  edtName.SetFocus;
end;

procedure TFrmAlunos.btnSalvarClick(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  if edtName.Text = '' then
  begin
    ShowMessage('O nome do aluno não pode ficar em branco.');
    Exit;
  end;

  QryExec := TFDQuery.Create(nil);
  try
    QryExec.Connection := FDConnection1;

    // Se o registro selecionado corresponder ao campo de texto, faz UPDATE, senão faz INSERT
    if (not FDQuery1.IsEmpty) and (edtName.Text = FDQuery1.FieldByName('nome').AsString) then
    begin
      QryExec.SQL.Add('UPDATE alunos SET nome = :nome, email = :email, telefone = :telefone, idade = :idade WHERE id = :id');
      QryExec.ParamByName('id').AsInteger := FDQuery1.FieldByName('id').AsInteger;
    end
    else
    begin
      QryExec.SQL.Add('INSERT INTO alunos (nome, email, telefone, idade) VALUES (:nome, :email, :telefone, :idade)');
    end;

    QryExec.ParamByName('nome').AsString := edtName.Text;
    QryExec.ParamByName('email').AsString := edtEmail.Text;
    QryExec.ParamByName('telefone').AsString := edtTelefone.Text;
    QryExec.ParamByName('idade').AsInteger := StrToIntDef(edtIdade.Text, 0);
    QryExec.ExecSQL;

    ShowMessage('Aluno salvo com sucesso!');
    AtualizarGrid;
  finally
    QryExec.Free;
  end;
end;

procedure TFrmAlunos.btnExcluirClick(Sender: TObject);
var
  QryExec: TFDQuery;
begin
  if FDQuery1.IsEmpty then Exit;

  if MessageDlg('Confirma a exclusão deste aluno?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QryExec := TFDQuery.Create(nil);
    try
      QryExec.Connection := FDConnection1;
      QryExec.SQL.Add('DELETE FROM alunos WHERE id = :id');
      QryExec.ParamByName('id').AsInteger := FDQuery1.FieldByName('id').AsInteger;
      QryExec.ExecSQL;

      ShowMessage('Registro removido.');
      AtualizarGrid;
      btnInserirClick(nil);
    finally
      QryExec.Free;
    end;
  end;
end;

procedure TFrmAlunos.AtribuirCampos;
begin
  if not FDQuery1.IsEmpty then
  begin
    edtName.Text     := FDQuery1.FieldByName('nome').AsString;
    edtEmail.Text    := FDQuery1.FieldByName('email').AsString;
    edtTelefone.Text := FDQuery1.FieldByName('telefone').AsString;
    edtIdade.Text    := FDQuery1.FieldByName('idade').AsString;
  end;
end;

procedure TFrmAlunos.DBGrid1CellClick(Column: TColumn);
begin
  AtribuirCampos;
end;

procedure TFrmAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmAlunos := nil;
end;

end.
