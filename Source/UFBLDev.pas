unit UFBLDev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Param;

type
  TFBLDevName = class(TForm)
    LEBLDevName: TLabeledEdit;
    LEBLMacAdr: TLabeledEdit;
    LEBLType: TLabeledEdit;
    LEBLModel: TLabeledEdit;
    LEBLHexType: TLabeledEdit;
    LEBLIPAdr: TLabeledEdit;
    LEBLManufacturer: TLabeledEdit;
    Panel1: TPanel;
    BBLDevOK: TButton;
    BSkipDev: TButton;
    procedure BBLDevOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BSkipDevClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     State: string;
  end;

var
  FBLDevName: TFBLDevName;

implementation

uses
   UDMBroadlink, UFBroadlink;

{$R *.dfm}

procedure TFBLDevName.BBLDevOKClick(Sender: TObject);
begin

   if Trim(LEBLDevName.Text) = ''
   then
      begin
         ShowMessage('Please enter a name for this device');
         LEBLDevName.SetFocus;
         Exit;
      end;

   ModalResult := mrOk;

end;

procedure TFBLDevName.BSkipDevClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFBLDevName.FormShow(Sender: TObject);
begin

   if State = 'Edit'
   then
      begin

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
         DMBroadlink.QGetBLDevByName.Open;

         LEBLManufacturer.Text := DMBroadlink.QGetBLDevByName.FieldByName('Manufacturer').AsString;
         LEBLModel.Text :=  DMBroadlink.QGetBLDevByName.FieldByName('Model').AsString;
         LEBLHexType.Text :=  DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString;
         LEBLIPAdr.Text :=  DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString;
         LEBLMacAdr.Text :=  DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString;
         LEBLType.Text := DMBroadlink.QGetBLDevByName.FieldByName('Type').AsString;
         LEBLDevName.Text := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];

      end
   else
      LEBLDevName.Text := '';

   LEBLDevName.SetFocus;

end;

end.
