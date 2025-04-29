program weatherApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in '..\..\source\ULogin.pas' {FLogin},
  UFfAvisoPermiso in '..\..\source\Frames\UFfAvisoPermiso.pas' {ffAvisoPermiso: TFrame},
  UFunciones in '..\..\source\UFunciones.pas',
  URDatosClima in '..\..\source\Records\URDatosClima.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
