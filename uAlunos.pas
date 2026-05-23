unit uAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.DApt, FireDAC.Phys.Intf,
  FireDAC.Stan.Async, FireDAC.DatS, FireDAC.DApt.Intf;

type
  TfrmAlunos = class(TForm)
    Panel1: TPanel;

    Label2: TLabel;
    edtNome: TEdit;

    Label3: TLabel;
    edtEmail: TEdit;

    Label4: TLabel;
    edtTelefone: TEdit;

    Label5: TLabel;
    edtIdade: TEdit;

    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;

    edtPesquisar: TEdit;

    DBGrid1: TDBGrid;

    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;

    procedure FormCreate(Sender: TObject);

    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);

    procedure DBGrid1CellClick(Column: TColumn);

  private

    FID: Integer;

    procedure CarregarDados;
    procedure Limpar;
    procedure ConfigurarGrid;

  public

  end;

var
  frmAlunos: TfrmAlunos;

implementation

{$R *.dfm}

procedure TfrmAlunos.FormCreate(Sender: TObject);
begin
  FormStyle := fsMDIChild;

  // MYSQL
  FDConnection1.LoginPrompt := False;

  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('DriverID=MySQL');
  FDConnection1.Params.Add('Server=127.0.0.1');
  FDConnection1.Params.Add('Database=Prova');
  FDConnection1.Params.Add('User_Name=root');
  FDConnection1.Params.Add('Password=');

  FDConnection1.Connected := True;

  // VISUAL GRID
  DBGrid1.Options := DBGrid1.Options + [dgRowSelect];
  DBGrid1.ReadOnly := True;
  DBGrid1.Font.Size := 10;


  CarregarDados;

end;

procedure TfrmAlunos.ConfigurarGrid;
begin

  if DBGrid1.Columns.Count >= 5 then
  begin
    DBGrid1.Columns[0].Width := 50;
    DBGrid1.Columns[1].Width := 180;
    DBGrid1.Columns[2].Width := 220;
    DBGrid1.Columns[3].Width := 140;
    DBGrid1.Columns[4].Width := 70;
  end;

end;

procedure TfrmAlunos.CarregarDados;
begin

  FDQuery1.Close;

  FDQuery1.SQL.Text :=
    'SELECT * FROM alunos ' +
    'WHERE nome LIKE :NOME ' +
    'ORDER BY nome';

  FDQuery1.ParamByName('NOME').AsString :=
    '%' + edtPesquisar.Text + '%';

  FDQuery1.Open;

  // MANTER GRID FIXO
  ConfigurarGrid;

end;

procedure TfrmAlunos.Limpar;
begin
  FID := 0;

  edtNome.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtIdade.Clear;
end;

procedure TfrmAlunos.btnSalvarClick(Sender: TObject);
begin

  FDQuery1.Close;

  FDQuery1.SQL.Text :=
    'INSERT INTO alunos(nome,email,telefone,idade) ' +
    'VALUES(:nome,:email,:telefone,:idade)';

  FDQuery1.ParamByName('nome').AsString := edtNome.Text;
  FDQuery1.ParamByName('email').AsString := edtEmail.Text;
  FDQuery1.ParamByName('telefone').AsString := edtTelefone.Text;
  FDQuery1.ParamByName('idade').AsInteger :=
    StrToIntDef(edtIdade.Text, 0);

  FDQuery1.ExecSQL;

  ShowMessage('Aluno cadastrado com sucesso.');

  CarregarDados;
  Limpar;

end;

procedure TfrmAlunos.btnEditarClick(Sender: TObject);
begin

  if FID = 0 then
  begin
    ShowMessage('Selecione um registro no grid.');
    Exit;
  end;

  FDQuery1.Close;

  FDQuery1.SQL.Text :=
    'UPDATE alunos SET ' +
    'nome=:nome,email=:email,telefone=:telefone,idade=:idade ' +
    'WHERE id=:id';

  FDQuery1.ParamByName('id').AsInteger := FID;

  FDQuery1.ParamByName('nome').AsString := edtNome.Text;
  FDQuery1.ParamByName('email').AsString := edtEmail.Text;
  FDQuery1.ParamByName('telefone').AsString := edtTelefone.Text;
  FDQuery1.ParamByName('idade').AsInteger :=
    StrToIntDef(edtIdade.Text, 0);

  FDQuery1.ExecSQL;

  ShowMessage('Aluno atualizado com sucesso.');

  CarregarDados;
  Limpar;

end;

procedure TfrmAlunos.btnExcluirClick(Sender: TObject);
begin

  if FID = 0 then
  begin
    ShowMessage('Selecione um registro.');
    Exit;
  end;

  FDQuery1.Close;

  FDQuery1.SQL.Text :=
    'DELETE FROM alunos WHERE id=:id';

  FDQuery1.ParamByName('id').AsInteger := FID;

  FDQuery1.ExecSQL;

  ShowMessage('Aluno excluído.');

  CarregarDados;
  Limpar;

end;

procedure TfrmAlunos.btnPesquisarClick(Sender: TObject);
begin
  CarregarDados;
end;

procedure TfrmAlunos.DBGrid1CellClick(Column: TColumn);
begin

  FID := FDQuery1.FieldByName('id').AsInteger;

  edtNome.Text :=
    FDQuery1.FieldByName('nome').AsString;

  edtEmail.Text :=
    FDQuery1.FieldByName('email').AsString;

  edtTelefone.Text :=
    FDQuery1.FieldByName('telefone').AsString;

  edtIdade.Text :=
    FDQuery1.FieldByName('idade').AsString;

end;

end.
