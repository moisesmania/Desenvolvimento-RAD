unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;

    Cadastros1: TMenuItem;
    Alunos1: TMenuItem;

    Integracoes1: TMenuItem;
    UsuariosAPI1: TMenuItem;
    lblMensagem: TLabel;
    DBText1: TDBText;

    procedure FormCreate(Sender: TObject);

    procedure Alunos1Click(Sender: TObject);
    procedure UsuariosAPI1Click(Sender: TObject);


  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uAlunos, uAPI;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  WindowState := wsMaximized;
  Position := poScreenCenter;
  FormStyle := fsMDIForm;

  // FUNDO
  Color := clWhite;

  // TEXTO CENTRAL
  lblMensagem.Caption :=
    'Gerencie alunos, organize informações e acesse os recursos do sistema de forma rápida e segura.' +
    sLineBreak + sLineBreak +
    'Acesse o menu superior para cadastrar, editar e pesquisar os dados do sistema.';


end;

procedure TfrmPrincipal.Alunos1Click(Sender: TObject);
begin

  if not Assigned(frmAlunos) then
    frmAlunos := TfrmAlunos.Create(Application);

  frmAlunos.Show;

end;

procedure TfrmPrincipal.UsuariosAPI1Click(Sender: TObject);
begin

  if not Assigned(frmAPI) then
    frmAPI := TfrmAPI.Create(Application);

  frmAPI.Show;

end;

end.
