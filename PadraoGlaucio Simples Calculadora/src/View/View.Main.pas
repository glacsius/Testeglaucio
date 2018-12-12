unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Controller.Calculadora;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  c: TControllerCalculadora;
begin
  c := TControllerCalculadora.Create;
  c.abrirTelaCalculadora;
  FreeAndNil(c);
end;

end.
