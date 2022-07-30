unit UFNewLocation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.ExtCtrls, Winapi.ShellAPI,
  HTMLabel, AdvOfficeButtons, FireDAC.Stan.Param;

type
  TFNewLocation = class(TForm)
    AELocName: TAdvEdit;
    AELongitude: TAdvEdit;
    AELattitude: TAdvEdit;
    Panel1: TPanel;
    BSaveLocation: TButton;
    BCancel: TButton;
    HTMLabel1: THTMLabel;
    CBDefault: TAdvOfficeCheckBox;
    procedure BSaveLocationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HTMLabel1AnchorClick(Sender: TObject; Anchor: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNewLocation: TFNewLocation;

implementation

uses
   UDMBroadlink;

{$R *.dfm}

procedure TFNewLocation.BSaveLocationClick(Sender: TObject);
begin

   if Trim(AELocName.Text) = ''
   then
      begin
         ShowMessage('Please enter location name');
         AELocName.SetFocus;
         Exit;
      end;

   if Trim(AELattitude.Text) = ''
   then
      begin
         ShowMessage('Please enter latitude');
         AELattitude.SetFocus;
         Exit;
      end;

   if Trim(AELongitude.Text) = ''
   then
      begin
         ShowMessage('Please enter longitude');
         AELongitude.SetFocus;
         Exit;
      end;

   DMBroadlink.QGetLocation.Close;
   DMBroadlink.QGetLocation.ParamByName('Name').AsString := Trim(AELocName.Text);
   DMBroadlink.QGetLocation.Open;

   if DMBroadlink.QGetLocation.RecordCount > 0
   then
      begin
         ShowMessage('A location named "' + AELocName.Text + '" already exists.');
         AELocName.SetFocus;
         Exit;
      end;

   DMBroadlink.TLocations.Insert;
   DMBroadlink.TLocations.FieldByName('Name').AsString := Trim(AELocName.Text);
   DMBroadlink.TLocations.FieldByName('Lattitude').AsString := Trim(AELattitude.Text);
   DMBroadlink.TLocations.FieldByName('Longitude').AsString := Trim(AELongitude.Text);
   DMBroadlink.TLocations.FieldByName('Default').AsBoolean := CBDefault.Checked;
   DMBroadlink.TLocations.Post;

   if DMBroadlink.TLocations.FieldByName('Default').AsBoolean
   then
      begin

         DMBroadlink.QResetDefaultLocation.ParamByName('Name').AsString := DMBroadlink.TLocations.FieldByName('Name').AsString;
         DMBroadlink.QResetDefaultLocation.ExecSQL;

      end;

   ModalResult := mrOK;

end;

procedure TFNewLocation.FormShow(Sender: TObject);
begin

   AELocName.Text := '';
   AELattitude.Text := '';
   AELongitude.Text := '';

   if DMBroadlink.TLocations.RecordCount = 0
   then
      begin
         CBDefault.Checked := True;
         CBDefault.Enabled := False;
      end
   else
      begin
         CBDefault.Checked := False;
         CBDefault.Enabled := True;
      end;

   AELocName.SetFocus;

end;

procedure TFNewLocation.HTMLabel1AnchorClick(Sender: TObject; Anchor: string);
begin
   ShellExecute(Handle, nil, PChar(Anchor), nil, nil, SW_SHOWDEFAULT);
end;

end.
