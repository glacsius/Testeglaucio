unit Model.Calculadora;

interface

uses Model.Interfaces, System.Generics.Collections;

type
  TModelCalculadora = class(TInterfacedObject, ICalculadora)
  private
    FLista: TList<Integer>;
  public
    Constructor Create();
    Destructor Destroy(); override;
    class function New: ICalculadora;
    function Add(Value: String): ICalculadora; overload;
    function Add(Value: Integer): ICalculadora; overload;
    function Somar(): String;

  end;

implementation

uses
  System.SysUtils;

{ TCalculadora }

function TModelCalculadora.Add(Value: String): ICalculadora;
var
  Valor: Integer;
begin
  Result := Self;

  if not TryStrToInt(Value, Valor) then
    raise Exception.Create('Esse valor ' + Value + ' não é válido');

  FLista.Add(Valor);
end;

function TModelCalculadora.Add(Value: Integer): ICalculadora;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TModelCalculadora.Create;
begin
  FLista := TList<Integer>.Create;
end;

destructor TModelCalculadora.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TModelCalculadora.New: ICalculadora;
begin
  Result := Self.Create;
end;

function TModelCalculadora.Somar: String;
var
  soma, i: Integer;
begin
  soma := 0;
  for i := 0 to Pred(FLista.Count) do
    soma := soma + FLista[i];

  Result := soma.ToString();
end;

end.
