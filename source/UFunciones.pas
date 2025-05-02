unit UFunciones;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Sensors,
  System.Sensors.Components, FMX.Layouts, FMX.Edit,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  // Unidades clave para permisos en Android
  System.Permissions,
  androidapi.Helpers,
  androidapi.JNI.GraphicsContentViewText,
  androidapi.JNI.JavaTypes,
  androidapi.JNIBridge,
  androidapi.JNI.Os,
  androidapi.JNI.Location,
  FMX.Helpers.Android,
  androidapi.JNI.Net,
  FMX.Controls.Presentation, FMX.Objects, FMX.TabControl;

function getPermissions: Boolean;

implementation


function getPermissions: Boolean;
var
  vAceptoPermiso: Boolean;
begin
  result := false;

  PermissionsService.RequestPermissions
    (['android.permission.ACCESS_FINE_LOCATION',
    'android.permission.ACCESS_COARSE_LOCATION'],
    procedure(const APermissions: TClassicStringDynArray;
      const AGrantResults: TClassicPermissionStatusDynArray)
    begin
      if (Length(AGrantResults) > 0) and
        (AGrantResults[0] = TPermissionStatus.Granted) then
        vAceptoPermiso := true
      else
        vAceptoPermiso := false;

    end);

  if vAceptoPermiso then
    result := true;

end;
end.
