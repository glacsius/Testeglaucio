unit View.Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Model.Interfaces;

type
  TfrmCalculadora = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FCalculadora: ICalculadora;
  public
    procedure abrirTela(Value: ICalculadora);
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

uses Model.Calculadora, System.Generics.Collections, System.Threading;

procedure TfrmCalculadora.abrirTela(Value: ICalculadora);
begin
  FCalculadora := Value;
  Self.ShowModal;
end;

procedure TfrmCalculadora.Button1Click(Sender: TObject);
begin
  // aqui é desacoplado com a Model.Calculadora, pois a View só vai trabalhar com a interface
  Memo1.Lines.Add(
    FCalculadora
      .Add(Edit1.Text)
      .Add(Edit2.Text)
      .Somar())
  ;

  // aqui eu acoplo, pois eu preciso colocar no Uses da view o Model.Calculadora
  // se eu tenho q colocar o Model.Calculadora, não faz sentido eu usar Interface
  // Interface desacopla sendo q tenho q puxar a unit da mesma forma. Ta acoplado igual
  // Se não tivesse interface, não iria mudar nada o meu código abaixo. Sé teria q add um freeAndNil.
  Memo1.Lines.Add(
    TModelCalculadora.New
        .Add(Edit1.Text)
        .Add(Edit2.Text)
        .Somar()
  );
end;

procedure TfrmCalculadora.Button2Click(Sender: TObject);
var
  i: Integer;
  lista: TList<String>;
begin

  TThread.CreateAnonymousThread(
    procedure
    begin
      Memo1.Lines.Add(
        FCalculadora
        .Add(Edit1.Text)
        .Add(Edit2.Text)
        .Somar())
      ;
    end).Start;


  lista := TList<String>.Create;
  for i := 1 to 10 do
  begin
    //tasks.Add( TTask.Create( mostrar(i) ) );

    TThread.CreateAnonymousThread(
      procedure
      var
        aux : Integer;
      begin
        aux := i;
        Sleep(100+(aux*10));
        //Memo1.Lines.Add(aux.ToString());
        lista.Add(aux.ToString+' - '+FormatDateTime('ss:zzz', Now));
        {Memo1.Lines.Add(
          TModelCalculadora.New
          .Add(i)
          .Add(Edit2.Text)
          .Somar())
        ;  }
      end).Start;

  end;

  //sleep(5000);
  lista.Add('9999');
  Memo1.Lines.Add('--------------------------');
  for i := 0 to Pred(lista.Count) do
    Memo1.Lines.Add(lista[i]);
  FreeAndNil(Lista);
end;

end.
