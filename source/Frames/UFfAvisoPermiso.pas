unit UFfAvisoPermiso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TffAvisoPermiso = class(TFrame)
    Rectangle1: TRectangle;
    txtAviso: TText;
    Layout1: TLayout;
    Image1: TImage;
    Rectangle2: TRectangle;
    btnAceptar: TSpeedButton;
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
    FOnClose: TProc<Boolean>;
  public
    { Public declarations }
    property OnClose: TProc<Boolean> read FOnClose write FOnClose;
  end;

implementation

{$R *.fmx}

uses UFunciones;

procedure TffAvisoPermiso.btnAceptarClick(Sender: TObject);
begin
  if Assigned(FOnClose) then
    FOnClose(true); // Llamamos al callback con la respuesta
  Self.DisposeOf; // Cerramos el Frame
end;

end.
