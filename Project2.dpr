program Project2;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  Uapi in 'Uapi.pas' {FrmAPI},
  uAlunos in 'uAlunos.pas' {FrmAlunos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmAPI, FrmAPI);
  Application.CreateForm(TFrmAlunos, FrmAlunos);
  Application.Run;
end.
