unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  System.Sensors.Components, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLat: TEdit;
    edtLng: TEdit;
    LocationSensor1: TLocationSensor;
    procedure FormShow(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
  private
    { Private declarations }
  public
    { Public declarations }
    vPermisosAceptados: Boolean;
  end;

var
  FMain: TFMain;

implementation

{$R *.fmx}

procedure TFMain.FormShow(Sender: TObject);
begin
  if vPermisosAceptados then
    LocationSensor1.Active := true;
end;

procedure TFMain.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  edtLat.Text := Format('Lat: %f', [NewLocation.Latitude]);
  edtLng.Text := Format('Lat: %f', [NewLocation.Longitude]);
end;

end.
