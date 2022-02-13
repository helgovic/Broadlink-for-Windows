unit UFBLDev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFBLDevName = class(TForm)
    Label1: TLabel;
    EBLDevice: TEdit;
    BBLDevOK: TButton;
    LEBLDevName: TLabeledEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBLDevOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBLDevName: TFBLDevName;

implementation

{$R *.dfm}

var
   CloseAllowed: Boolean = True;

procedure TFBLDevName.BBLDevOKClick(Sender: TObject);
begin

   if Trim(LEBLDevName.Text) = ''
   then
      CloseAllowed := False
   else
      CloseAllowed := True;

end;

procedure TFBLDevName.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   CanClose := CloseAllowed;

end;

end.
