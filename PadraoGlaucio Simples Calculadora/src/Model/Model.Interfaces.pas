unit Model.Interfaces;

interface

type
  ICalculadora = interface
    ['{D0B38B4A-F123-458F-81A2-C8C516F59C32}']
    function Add(Value: String): ICalculadora; overload;
    function Add(Value: Integer): ICalculadora; overload;
    function Somar(): String;
	function Churros(): String;
  end;

implementation

end.
