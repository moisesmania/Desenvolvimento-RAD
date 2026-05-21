unit Uapi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,System.JSON , Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  REST.Types, REST.Client, Data.Bind.Components,Data.Bind.ObjectScope;

type
  TFrmAPI = class(TForm)
    PnlSuperior: TPanel;
    BtnBuscar: TButton;
    StringGrid1: TStringGrid;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAPI: TFrmAPI;

implementation

{$R *.dfm}

procedure TFrmAPI.BtnBuscarClick(Sender: TObject);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  i: Integer;
begin
  RESTRequest1.Execute;

  JSONArray := TJSONObject.ParseJSONValue(
    RESTResponse1.Content
  ) as TJSONArray;

  StringGrid1.RowCount := JSONArray.Count + 1;

  for i := 0 to JSONArray.Count - 1 do
  begin
    JSONObject := JSONArray.Items[i] as TJSONObject;

    StringGrid1.Cells[0, i + 1] :=
      JSONObject.GetValue<string>('name');

    StringGrid1.Cells[1, i + 1] :=
      JSONObject.GetValue<string>('username');

    StringGrid1.Cells[2, i + 1] :=
      JSONObject.GetValue<string>('email');

    StringGrid1.Cells[3, i + 1] :=
      JSONObject.GetValue<string>('phone');

    StringGrid1.Cells[4, i + 1] :=
      JSONObject.GetValue<string>('website');
  end;
end;

procedure TFrmAPI.FormCreate(Sender: TObject);
begin
      StringGrid1.Cells[0,0] := 'Nome';
      StringGrid1.Cells[1,0] := 'Username';
      StringGrid1.Cells[2,0] := 'Email';
      StringGrid1.Cells[3,0] := 'Telefone';
      StringGrid1.Cells[4,0] := 'Website';

end;

end.
