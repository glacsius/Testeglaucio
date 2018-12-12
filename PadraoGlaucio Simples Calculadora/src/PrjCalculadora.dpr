program PrjCalculadora;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {frmMain} ,
  Model.Interfaces in 'Model\Model.Interfaces.pas',
  Model.Calculadora in 'Model\Model.Calculadora.pas',
  Controller.Calculadora in 'Controller\Controller.Calculadora.pas',
  View.Calculadora in 'View\View.Calculadora.pas' {frmCalculadora};

{$R *.res}

begin
{$IFDEF RELEASE}
  ReportMemoryLeaksOnShutdown := false;
{$ELSE}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
