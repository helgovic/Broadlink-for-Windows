unit UFAddLightButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AdvGroupBox,
  AdvEdit, JvDialogs, Vcl.GraphUtil, Vcl.WinXCtrls, AdvCombo,
  Vcl.Imaging.pngimage;

type
  TFAddLightButton = class(TForm)
    Panel1: TPanel;
    BLBTest: TButton;
    BLBSave: TButton;
    ColorDialog: TColorDialog;
    GBColor: TAdvGroupBox;
    AELBRed: TAdvEdit;
    AELBGreen: TAdvEdit;
    AELBBlue: TAdvEdit;
    BLBSelectColor: TButton;
    AELBHue: TAdvEdit;
    AELBLBrightness: TAdvEdit;
    AELBSaturation: TAdvEdit;
    AELBColorTemp: TAdvEdit;
    AELBTransDur: TAdvEdit;
    AELBMaxWorkTime: TAdvEdit;
    BLBGetLightState: TButton;
    ACBColorMode: TAdvComboBox;
    ACBSchene: TAdvComboBox;
    INewScene: TImage;
    AELBName: TAdvEdit;
    procedure BLBSelectColorClick(Sender: TObject);
    procedure BLBCloseClick(Sender: TObject);
    procedure BLBGetLightStateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BLBSaveClick(Sender: TObject);
    procedure BLBTestClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecOut(const Text: string);
    procedure LoadButton(StateStr: String);
    function CreateStateString: String;
  public
    { Public declarations }
     State: string;
  end;

var
  FAddLightButton: TFAddLightButton;

implementation

uses
   UFBroadlink, JclSysUtils, JclStrings, UDMBroadlink, RGBHSV;

{$R *.dfm}

procedure TFAddLightButton.BLBCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFAddLightButton.ExecOut(const Text: string);

var
   OutLines: TStringList;
   i: Integer;

begin

   OutLines := TStringList.Create;
   OutLines.Text := Text;

   for i := 0 to OutLines.Count - 1 do
      begin

         if Pos('State : ', OutLines[i]) > 0
         then
            LoadButton(StrAfter('State : ', OutLines[i]));

      end;

   OutLines.DisposeOf;

end;

procedure TFAddLightButton.LoadButton(StateStr: String);

var
   StatParts, Schenes: TStringList;
   CurrIdx: integer;

begin

   StatParts := TStringList.Create;
   StrToStrings(StateStr, ', ', StatParts);

   AELBRed.Text := StrAfter('=', StatParts[1]);
   AELBBlue.Text := StrAfter('=', StatParts[2]);
   AELBGreen.Text := StrAfter('=', StatParts[3]);
   AELBLBrightness.Text := StrAfter('=', StatParts[4]);
   AELBColorTemp.Text := StrAfter('=', StatParts[5]);
   AELBHue.Text := StrAfter('=', StatParts[6]);
   AELBSaturation.Text := StrAfter('=', StatParts[7]);
   AELBTransDur.Text := StrAfter('=', StatParts[8]);
   AELBMaxWorkTime.Text := StrAfter('=', StatParts[9]);
   ACBColorMode.ItemIndex := StrToInt(StrAfter('=', StatParts[10]));

   ACBSchene.Clear;

   if StatParts.Count > 11
   then
      begin

         CurrIdx := 11;

         if Pos('schene', StatParts[CurrIdx]) > 0
         then
            begin
               ACBSchene.Items.Add(StrAfter('=', StatParts[CurrIdx]));
               Inc(CurrIdx);
            end;

         if StatParts.Count < CurrIdx + 1
         then
            Exit;

         if Pos('schenes', StatParts[CurrIdx]) > 0
         then
            begin

               Schenes := TStringList.Create;

               // LoadSchenes

               Inc(CurrIdx);

               if StatParts.Count < CurrIdx + 1
               then
                  Exit;

               if Pos('scheneidx', StatParts[CurrIdx]) > 0
               then
                  ACBSchene.ItemIndex := ACBSchene.Items.IndexOf(Schenes[StrToInt(StrAfter('=', StatParts[CurrIdx]))]);

               Schenes.DisposeOf;

            end;

      end;

   StatParts.DisposeOf;

end;

function TFAddLightButton.CreateStateString(): String;

var
   StatParts: TStringList;

begin

   StatParts := TStringList.Create;

   StatParts.Add('pwr=1');
   StatParts.Add('red=' + AELBRed.Text);
   StatParts.Add('blue=' + AELBBlue.Text);
   StatParts.Add('green=' + AELBGreen.Text);
   StatParts.Add('brightness=' + AELBLBrightness.Text);
   StatParts.Add('colortemp=' + AELBColorTemp.Text);
   StatParts.Add('hue=' + AELBHue.Text);
   StatParts.Add('saturation=' + AELBSaturation.Text);
   StatParts.Add('transitionduration=' + AELBTransDur.Text);
   StatParts.Add('maxworktime=' + AELBMaxWorkTime.Text);
   StatParts.Add('colormode=' + IntToStr(ACBColorMode.ItemIndex));

   StatParts.Add('shenes='{ + ACBSchene.Items Combine to string});
   StatParts.Add('scene=' + ACBSchene.Text);
   StatParts.Add('scheneidx=' + IntToStr(ACBSchene.ItemIndex));

   Result := StringsToStr(StatParts, ', ');

   StatParts.DisposeOf;

end;

procedure TFAddLightButton.FormShow(Sender: TObject);
begin

   if State = 'Edit'
   then
      LoadButton(DMBroadlink.QGetBLButton.FieldByName('Command').AsString);
//   else
//      LoadButton('standardstring');

   AELBName.SetFocus;

end;

procedure TFAddLightButton.BLBGetLightStateClick(Sender: TObject);
begin

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --getlightstate');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

procedure TFAddLightButton.BLBSaveClick(Sender: TObject);
begin

   if Trim(AELBName.Text) = ''
   then
      begin
         ShowMessage('Please enter button name');
         AELBName.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBGreen.Text)) > 255
   then
      begin
         ShowMessage('RGB Value cannot exceed 255');
         AELBGreen.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBBlue.Text)) > 255
   then
      begin
         ShowMessage('RGB Value cannot exceed 255');
         AELBBlue.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBHue.Text)) > 255
   then
      begin
         ShowMessage('Hue Value cannot exceed 255');
         AELBHue.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBLBrightness.Text)) > 255
   then
      begin
         ShowMessage('Brightness Value cannot exceed 255');
         AELBLBrightness.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBSaturation.Text)) > 255
   then
      begin
         ShowMessage('Saturation Value cannot exceed 255');
         AELBSaturation.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBRed.Text)) > 255
   then
      begin
         ShowMessage('RGB Value cannot exceed 255');
         AELBRed.SetFocus;
         Exit;
      end;

   if State = 'Edit'
   then
      begin

         DMBroadlink.TBLButtons.FindKey([DMBroadlink.QGetBLButton.FieldByName('ID').AsInteger]);
         DMBroadlink.TBLButtons.Edit;

      end
   else
      begin

         DMBroadlink.TBLButtons.Insert;

         DMBroadlink.QGetBLButtonID.Close;
         DMBroadlink.QGetBLButtonID.Open;

         if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
         then
             DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
         else
             DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

         DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString;
         DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := False;

      end;

   DMBroadlink.TBLButtons.FieldByName('Name').AsString := Trim(AELBName.Text);
   DMBroadlink.TBLButtons.FieldByName('Command').AsString := CreateStateString;
   DMBroadlink.TBLButtons.Post;

   Self.Close;

end;

procedure TFAddLightButton.BLBSelectColorClick(Sender: TObject);

var
   RGBInt: Longint;
   R, G, B, H, S, V: Single;

begin

   ColorDialog.Color := RGB(AELBRed.Text.ToInteger, AELBGreen.Text.ToInteger, AELBBlue.Text.ToInteger);

   if ColorDialog.Execute
   then
      begin

         RGBInt := ColorToRGB(ColorDialog.Color);
         AELBRed.Text := IntToStr(GetRValue(RGBInt));
         AELBGreen.Text := IntToStr(GetGValue(RGBInt));
         AELBBlue.Text := IntToStr(GetBValue(RGBInt));

         R := GetRValue(RGBInt);
         G := GetGValue(RGBInt);
         B := GetBValue(RGBInt);

         RGBToHSV(R, G, B, H, S, V);

         AELBHue.Text := IntToStr(Round(H));
         AELBSaturation.Text := IntToStr(Round(S));
         AELBLBrightness.Text := IntToStr(Round(V));

      end;

end;

procedure TFAddLightButton.BLBTestClick(Sender: TObject);
begin

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --setlightstate "' + CreateStateString + '"');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

end.
