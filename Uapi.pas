unit uAPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  System.JSON, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, REST.Client, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Grids;

type
  TfrmAPI = class(TForm)
    btnCarregar: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    StringGrid2: TStringGrid;

    procedure FormCreate(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);

  end;

var
  frmAPI: TfrmAPI;

implementation

{$R *.dfm}

procedure TfrmAPI.FormCreate(Sender: TObject);
begin
  FormStyle := fsMDIChild;

  RESTClient1.BaseURL := 'https://jsonplaceholder.typicode.com/users';

  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;

  // CONFIGURA GRID
  StringGrid2.ColCount := 5;
  StringGrid2.RowCount := 1;

  StringGrid2.Cells[0,0] := 'Nome';
  StringGrid2.Cells[1,0] := 'Username';
  StringGrid2.Cells[2,0] := 'Email';
  StringGrid2.Cells[3,0] := 'Telefone';
  StringGrid2.Cells[4,0] := 'Website';

  StringGrid2.ColWidths[0] := 180;
  StringGrid2.ColWidths[1] := 120;
  StringGrid2.ColWidths[2] := 220;
  StringGrid2.ColWidths[3] := 150;
  StringGrid2.ColWidths[4] := 150;
end;

procedure TfrmAPI.btnCarregarClick(Sender: TObject);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin
  RESTRequest1.Method := rmGET;
  RESTRequest1.Execute;

  JSONArray := TJSONObject.ParseJSONValue(
    RESTResponse1.Content
  ) as TJSONArray;

  try

    // quantidade de linhas
    StringGrid2.RowCount := JSONArray.Count + 1;

    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONObject := JSONArray.Items[I] as TJSONObject;

      StringGrid2.Cells[0, I + 1] :=
        JSONObject.GetValue<string>('name');

      StringGrid2.Cells[1, I + 1] :=
        JSONObject.GetValue<string>('username');

      StringGrid2.Cells[2, I + 1] :=
        JSONObject.GetValue<string>('email');

      StringGrid2.Cells[3, I + 1] :=
        JSONObject.GetValue<string>('phone');

      StringGrid2.Cells[4, I + 1] :=
        JSONObject.GetValue<string>('website');
    end;

  finally
    JSONArray.Free;
  end;
end;

end.
