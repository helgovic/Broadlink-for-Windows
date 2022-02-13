unit UFAddDevice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFAddDevice = class(TForm)
    LEDevName: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    BDeviceOK: TButton;
    BAddDeviceCancel: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BDeviceOKClick(Sender: TObject);
    procedure BAddDeviceCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddDevice: TFAddDevice;

implementation

uses
   UFBroadlink;

{$R *.dfm}

var
   CloseAllowed: Boolean = True;

procedure TFAddDevice.BAddDeviceCancelClick(Sender: TObject);
begin
   CloseAllowed := True;
end;

procedure TFAddDevice.BDeviceOKClick(Sender: TObject);
begin

   CloseAllowed := True;

   if LEDevName.Text = ''
   then
      begin
         ShowMessage('Please enter device name');
         LEDevName.SetFocus;
         CloseAllowed := False;
         Exit;
      end;

   FBroadlink.TDevice.IndexName := 'DevNameIdx';

   if FBroadlink.TDevice.FindKey([Trim(LEDevName.Text)])
   then
      begin
         ShowMessage('Device ' + Trim(LEDevName.Text) + ' allready exists');
         LEDevName.SetFocus;
         CloseAllowed := False;
      end;

end;

procedure TFAddDevice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   CanClose := CloseAllowed;

end;

end.
