unit Controller.Calculadora;

interface

Type
  TControllerCalculadora = class
  private
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure abrirTelaCalculadora;
  end;

implementation

uses
  Model.Calculadora, View.Calculadora;

{ TControllerCalculadora }

procedure TControllerCalculadora.abrirTelaCalculadora;
begin
  with TfrmCalculadora.Create(nil) do begin
    abrirTela(TModelCalculadora.New);
    DisposeOf;
  end;
end;

constructor TControllerCalculadora.Create;
begin

end;

destructor TControllerCalculadora.Destroy;
begin

  inherited;
end;

end.
