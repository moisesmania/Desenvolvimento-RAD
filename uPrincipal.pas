unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    PnlTopo: TPanel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Alunos1: TMenuItem;
    Servios1: TMenuItem;
    APIREST1: TMenuItem;
    Sair1: TMenuItem;
    PnlMenu: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure APIREST1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uAPI;

{$R *.dfm}

procedure TFrmPrincipal.APIREST1Click(Sender: TObject);
begin
  FrmAPI := TFrmAPI.Create(Self);
  FrmAPI.Show;
end;

end.
