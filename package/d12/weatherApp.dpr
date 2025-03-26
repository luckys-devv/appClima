program weatherApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  ULogin in '..\..\source\ULogin.pas' {FLogin},
  UMain in '..\..\source\UMain.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
