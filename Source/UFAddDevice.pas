unit UFAddDevice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  AdvCombo, AdvOfficeButtons, FireDAC.Stan.Param, Data.DB;

type
  TFAddDevice = class(TForm)
    LEDevName: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    ACBManufacturer: TAdvComboBox;
    ACBModelName: TAdvComboBox;
    Panel1: TPanel;
    BDeviceOK: TButton;
    BAddDeviceCancel: TButton;
    ACBShare: TAdvOfficeCheckBox;
    procedure BDeviceOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACBManufacturerChange(Sender: TObject);
    procedure ACBModelNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     State: string;
  end;

var
  FAddDevice: TFAddDevice;

implementation

uses
   UFBroadlink, UDMBroadlink;

{$R *.dfm}

procedure TFAddDevice.ACBManufacturerChange(Sender: TObject);
begin

   ACBModelName.Text := '';
   ACBModelName.Clear;

   DMBroadlink.QGetCommonManuModels.Close;
   DMBroadlink.QGetCommonManuModels.ParamByName('ManufacturerName').AsString := ACBManufacturer.Text;
   DMBroadlink.QGetCommonManuModels.Open;

   while not DMBroadlink.QGetCommonManuModels.EOF do
     begin
        ACBModelName.Items.Add(DMBroadlink.QGetCommonManuModels.FieldByName('ModelName').AsString);
        DMBroadlink.QGetCommonManuModels.Next;
     end;

   if ACBModelName.Items.Count > 0
   then
      ACBModelName.ItemIndex := 0;

end;

procedure TFAddDevice.ACBModelNameChange(Sender: TObject);
begin

   DMBroadlink.QCommonGetDevice.Close;
   DMBroadlink.QCommonGetDevice.ParamByName('ManufacturerName').AsString := ACBManufacturer.Text;
   DMBroadlink.QCommonGetDevice.ParamByName('ModelName').AsString := ACBModelName.Text;
   DMBroadlink.QCommonGetDevice.Open;

   if not DMBroadlink.QCommonGetDevice.IsEmpty
   then
      begin

         if DMBroadlink.QCommonGetDevice.FieldByName('IR').AsBoolean
         then
            RadioGroup1.ItemIndex := 0
         else
            RadioGroup1.ItemIndex := 1;

         ACBShare.Checked := False;

      end
   else
      ACBShare.Checked := True;

end;

procedure TFAddDevice.BDeviceOKClick(Sender: TObject);
begin

   if Trim(ACBManufacturer.Text) = ''
   then
      begin
         ShowMessage('Please select or enter new manufacturer');
         ACBManufacturer.SetFocus;
         Exit;
      end;

   if Trim(ACBModelName.Text) = ''
   then
      begin
         ShowMessage('Please select or enter new model name');
         ACBModelName.SetFocus;
         Exit;
      end;

   if Trim(LEDevName.Text) = ''
   then
      begin
         ShowMessage('Please enter device name');
         LEDevName.SetFocus;
         Exit;
      end;

   if State = 'Add'
   then
      begin

         DMBroadlink.TDevice.IndexName := 'DevNameIdx';

         if DMBroadlink.TDevice.FindKey([Trim(LEDevName.Text)])
         then
            begin
               ShowMessage('Device ' + Trim(LEDevName.Text) + ' already exists');
               LEDevName.SetFocus;
               Exit;
            end;

         DMBroadlink.QGetDevFromManuModel.Close;
         DMBroadlink.QGetDevFromManuModel.ParamByName('ManufacturerName').AsString := Trim(ACBManufacturer.Text);
         DMBroadlink.QGetDevFromManuModel.ParamByName('ModelName').AsString := Trim(ACBModelName.Text);
         DMBroadlink.QGetDevFromManuModel.Open;

         if not DMBroadlink.QGetDevFromManuModel.IsEmpty
         then
            begin
               ShowMessage('A device with Manufacturer name ' + Trim(ACBManufacturer.Text) + ' and Model Name ' + Trim(ACBModelName.Text) + ' already exists');
               ACBModelName.SetFocus;
               Exit;
            end;

      end;

   ModalResult := mrOk;

end;

procedure TFAddDevice.FormShow(Sender: TObject);
begin

   if State = 'Edit'
   then
      begin

         DMBroadlink.TDevice.IndexName := 'DevNameIdx';

         DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

         DMBroadlink.TManufacturers.FindKey([DMBroadlink.TDevice.FieldByName('ManufacturerID').AsInteger]);

         ACBManufacturer.Enabled := False;
         ACBModelName.Enabled := False;

         ACBManufacturer.Text := DMBroadlink.TManufacturers.FieldByName('Name').AsString;
         ACBModelName.Text := DMBroadlink.TDevice.FieldByName('ModelName').AsString;

         LEDevName.Text := DMBroadlink.TDevice.FieldByName('Name').AsString;

         ACBShare.Checked := DMBroadlink.TDevice.FieldByName('Share').AsBoolean;

      end
   else
      begin

         ACBManufacturer.Enabled := True;
         ACBModelName.Enabled := True;

         ACBManufacturer.Text := '';
         LEDevName.Text := '';
         ACBShare.Checked := True;

         ACBManufacturer.Clear;

         DMBroadlink.QCommonGetManufacturers.Close;
         DMBroadlink.QCommonGetManufacturers.Open;

         while not DMBroadlink.QCommonGetManufacturers.EOF do
           begin
              ACBManufacturer.Items.Add(DMBroadlink.QCommonGetManufacturers.FieldByName('Name').AsString);
              DMBroadlink.QCommonGetManufacturers.Next;
           end;

         if ACBManufacturer.Items.Count > 0
         then
            ACBManufacturer.ItemIndex := 0;

         ACBManufacturerChange(ACBManufacturer);

      end;

end;

end.



