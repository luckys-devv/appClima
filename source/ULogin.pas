unit ULogin;

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
  FMX.Controls.Presentation, FMX.Objects;

type
  TFLogin = class(TForm)
    Layout3: TLayout;
    Label1: TLabel;
    edtUser: TEdit;
    Rectangle1: TRectangle;
    btnAceptar: TSpeedButton;
    Image1: TImage;
    procedure edtUserValidate(Sender: TObject; var Text: string);
    procedure edtPassValidate(Sender: TObject; var Text: string);
    procedure FormShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    procedure getPermissions;
    function isConexionToInternet: Boolean;
    function isGPSEnabled: Boolean;
  public
    { Public declarations }
    vAceptoPermiso: Boolean;
  end;

var
  FLogin: TFLogin;

implementation

{$R *.fmx}

uses UMain;

procedure TFLogin.btnAceptarClick(Sender: TObject);
begin
    if vAceptoPermiso then
  begin

    if not isGPSEnabled then
      ShowMessage('El GPS está desactivado. Por favor, actívalo.')
    else
      ShowMessage('muy bien');

  end
  else
  begin
    ShowMessage('Debe aceptar los permisos de Ubicacion');
    Exit;
  end;

end;

procedure TFLogin.edtPassValidate(Sender: TObject; var Text: string);
begin
  btnAceptar.SetFocus;
end;

procedure TFLogin.edtUserValidate(Sender: TObject; var Text: string);
begin
  // edtPass.SetFocus;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  if isConexionToInternet then
    ShowMessage('Hay conexion a Internet')
  else
    ShowMessage('No hay conexion');

end;

procedure TFLogin.getPermissions;
begin
     PermissionsService.RequestPermissions
    (['android.permission.ACCESS_FINE_LOCATION',
    'android.permission.ACCESS_COARSE_LOCATION'],
    procedure(const APermissions: TClassicStringDynArray;
      const AGrantResults: TClassicPermissionStatusDynArray)
    begin
      if (Length(AGrantResults) > 0) and
        (AGrantResults[0] = TPermissionStatus.Granted) then
      begin
        ShowMessage('Permiso concedido. Ahora puedes obtener la ubicación.');
        vAceptoPermiso := true;
      end
      else
      begin
        ShowMessage('Permiso denegado. ');
        vAceptoPermiso := false;
      end;

    end);
end;

function TFLogin.isConexionToInternet: Boolean;
var
  ConnectivityManager: JConnectivityManager;
  ActiveNetworkInfo: JNetworkInfo;
begin
  ConnectivityManager := TJConnectivityManager.Wrap
    (TAndroidHelper.Context.getSystemService
    (TJContext.JavaClass.CONNECTIVITY_SERVICE));

  if ConnectivityManager <> nil then
  begin
    // Obtenemos información de la red activa
    ActiveNetworkInfo := ConnectivityManager.getActiveNetworkInfo;
    // Verificamos si no es nula y si está conectada
    Result := (ActiveNetworkInfo <> nil) and
      (ActiveNetworkInfo.isConnectedOrConnecting);
  end
  else
    Result := false;

end;

function TFLogin.isGPSEnabled: Boolean;
var
  LocationManager: JLocationManager;
begin

  // Obtiene el servicio de ubicación desde el contexto de Android
  LocationManager := TJLocationManager.Wrap
    (TAndroidHelper.Context.getSystemService
    (TJContext.JavaClass.LOCATION_SERVICE));
  // Verifica si el proveedor GPS está habilitado
  Result := LocationManager.isProviderEnabled
    (TJLocationManager.JavaClass.GPS_PROVIDER);

end;

end.
