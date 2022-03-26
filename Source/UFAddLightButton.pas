unit UFAddLightButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AdvGroupBox,
  AdvEdit, JvDialogs, Vcl.GraphUtil, Vcl.WinXCtrls, AdvCombo, FireDac.Stan.Param,
  Vcl.Imaging.pngimage;

type
  THSV = record  // hue saturation value (HSV)
           Hue , Sat , Val : Double;
         end;

  THSL = record
    Hue: Integer;
    Saturation: Integer;  //fade a color to gray
    Lightness: Integer;   //make a color darker

  end;  TFAddLightButton = class(TForm)
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
    BAddLightButtonClose: TButton;
    procedure BLBSelectColorClick(Sender: TObject);
    procedure BLBCloseClick(Sender: TObject);
    procedure BLBGetLightStateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BLBSaveClick(Sender: TObject);
    procedure BLBTestClick(Sender: TObject);
    procedure BAddLightButtonCloseClick(Sender: TObject);
    procedure AELBRedExit(Sender: TObject);
    procedure AELBHueExit(Sender: TObject);
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
   UFBroadlink, JclSysUtils, JclStrings, UDMBroadlink, Math;

{$R *.dfm}

function HSLToColorWindow(HSL: THSL): TColor;
var
  m1, m2: Real;
  function HueToColorValue(Hue: Real): Byte;
  var
    v: Real;
  begin
    if Hue < 0 then
      Hue := Hue + 1
    else
      if Hue > 1 then Hue := Hue - 1;
    if 6 * Hue < 1 then
      v := m1 + (m2 - m1) * Hue * 6
    else
      if 2 * Hue < 1 then
        v := m2
      else
        if 3 * Hue < 2 then
          v := m1 + (m2 - m1) * (2/3 - Hue) * 6
        else
          v := m1;
    Result := Round(255 * v);
  end;
var
  h, s, l: Real;
  r, g, b: Byte;
begin
  h := HSL.Hue / 240;
  s := HSL.Saturation / 240;
  l := HSL.Lightness / 240;
  if s = 0 then
  begin
    r := Round(255 * l);
    g := r;
    b := r;
  end
  else
  begin
    if l <= 0.5 then
      m2 := l * (1 + s)
    else
      m2 := l + s - l * s;
    m1 := 2 * l - m2;
    r := HueToColorValue(h + 1/3);
    g := HueToColorValue(h);
    b := HueToColorValue(h - 1/3);
  end;
  Result := RGB(r, g, b);
end;

function RGB2HSV (R,G,B : Byte) : THSV;
var
  Min_, Max_, Delta : Double;
  H , S , V : Double ;
begin
  H := 0.0 ;
  Min_ := Min (Min( R,G ), B);
  Max_ := Max (Max( R,G ), B);
  Delta := ( Max_ - Min_ );
  V := Max_ ;
  If ( Max_ <> 0.0 ) then
    S := 255.0 * Delta / Max_
  else
    S := 0.0 ;
  If (S <> 0.0) then
    begin
      If R = Max_ then
        H := (G - B) / Delta
      else
        If G = Max_ then
          H := 2.0 + (B - R) / Delta
        else
          If B = Max_ then
            H := 4.0 + (R - G) / Delta
    End
  else
    H := -1.0 ;
  H := H * 60 ;
  If H < 0.0 then H := H + 360.0;
  with Result Do
    begin
      Hue := H ;             // Hue -> 0..360
      Sat := S * 100 / 255; // Saturation -> 0..100 %
      Val := V * 100 / 255; // Value - > 0..100 %
    end;
end;

procedure TFAddLightButton.AELBHueExit(Sender: TObject);

var
   RGBInt: LongInt;
   HSL: THSL;
   TmpColor: TColor;

begin

   if StrToInt(Trim(AELBHue.Text)) > 360
   then
      begin
         ShowMessage('Hue Value cannot exceed 360');
         AELBHue.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBLBrightness.Text)) > 100
   then
      begin
         ShowMessage('Brightness Value cannot exceed 100');
         AELBLBrightness.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBSaturation.Text)) > 100
   then
      begin
         ShowMessage('Saturation Value cannot exceed 100');
         AELBSaturation.SetFocus;
         Exit;
      end;

   HSL.Hue := StrToInt(AELBHue.Text);
   HSL.Saturation := StrToInt(AELBSaturation.Text);
   HSL.Lightness := StrToInt(AELBLBrightness.Text);
   TmpColor := HSLToColorWindow(HSL);

   RGBInt := ColorToRGB(TmpColor);
   AELBRed.Text := IntToStr(GetRValue(RGBInt));
   AELBGreen.Text := IntToStr(GetGValue(RGBInt));
   AELBBlue.Text := IntToStr(GetBValue(RGBInt));

end;

procedure TFAddLightButton.AELBRedExit(Sender: TObject);

var
   HSVR : THSV;

begin

   if StrToInt(Trim(AELBRed.Text)) > 255
   then
      begin
         ShowMessage('RGB Value cannot exceed 255');
         AELBRed.SetFocus;
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

   HSVR := RGB2HSV(StrToInt(AELBRed.Text), StrToInt(AELBGreen.Text), StrToInt(AELBBlue.Text));

   AELBHue.Text := IntToStr(Round(HSVR.Hue));
   AELBSaturation.Text := IntToStr(Round(HSVR.Sat));
   AELBLBrightness.Text := IntToStr(Round(HSVR.Val));

end;

procedure TFAddLightButton.BAddLightButtonCloseClick(Sender: TObject);
begin
   Self.Close;
end;

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
   TmpStr: string;
   i: integer;

begin

   TmpStr := StringReplace(StateStr, '{', '', []);
   TmpStr := StringReplace(TmpStr, '}', '', []);
   TmpStr := StringReplace(TmpStr, '''', '', [rfReplaceAll]);
   TmpStr := StringReplace(TmpStr, ': ', '=', [rfReplaceAll]);

   StatParts := TStringList.Create;
   StrToStrings(TmpStr, ', ', StatParts);

   for i := 0 to StatParts.Count - 1 do
      begin

         if StrBefore('=', StatParts[i]) = 'red'
         then
            AELBRed.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'blue'
         then
            AELBBlue.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'green'
         then
            AELBGreen.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'brightness'
         then
            AELBLBrightness.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'colortemp'
         then
            AELBColorTemp.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'hue'
         then
            AELBHue.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'saturation'
         then
            AELBSaturation.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'transitionduration'
         then
            AELBTransDur.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'maxworktime'
         then
            AELBMaxWorkTime.Text := StrAfter('=', StatParts[i]);

         if StrBefore('=', StatParts[i]) = 'colormode'
         then
            ACBColorMode.ItemIndex := StrToInt(StrAfter('=', StatParts[i]));

//         if StrBefore('=', StatParts[i]) = 'scene'
//         then
//            ACBColorMode.ItemIndex := StrToInt(StrAfter('=', StatParts[i]));
//
//         if StrBefore('=', StatParts[i]) = 'colormode'
//         then
//            ACBColorMode.ItemIndex := StrToInt(StrAfter('=', StatParts[i]));
//
//         if StrBefore('=', StatParts[i]) = 'colormode'
//         then
//            ACBColorMode.ItemIndex := StrToInt(StrAfter('=', StatParts[i]));

      end;

   ACBSchene.Clear;

//   if StatParts.Count > 11
//   then
//      begin
//
//         CurrIdx := 11;
//
//         if Pos('schene', StatParts[CurrIdx]) > 0
//         then
//            begin
//               ACBSchene.Items.Add(StrAfter('=', StatParts[CurrIdx]));
//               Inc(CurrIdx);
//            end;
//
//         if StatParts.Count < CurrIdx + 1
//         then
//            Exit;
//
//         if Pos('schenes', StatParts[CurrIdx]) > 0
//         then
//            begin
//
//               Schenes := TStringList.Create;
//
//               // LoadSchenes
//
//               Inc(CurrIdx);
//
//               if StatParts.Count < CurrIdx + 1
//               then
//                  Exit;
//
//               if Pos('scheneidx', StatParts[CurrIdx]) > 0
//               then
//                  ACBSchene.ItemIndex := ACBSchene.Items.IndexOf(Schenes[StrToInt(StrAfter('=', StatParts[CurrIdx]))]);
//
//               Schenes.DisposeOf;
//
//            end;
//
//      end;

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

//   StatParts.Add('shenes='{ + ACBSchene.Items Combine to string});
//   StatParts.Add('scene=' + ACBSchene.Text);
//   StatParts.Add('scheneidx=' + IntToStr(ACBSchene.ItemIndex));

   Result := StringsToStr(StatParts, ' ');

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

   DMBroadlink.QGetBLDevByName.Close;
   DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
   DMBroadlink.QGetBLDevByName.Open;

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

   if StrToInt(Trim(AELBRed.Text)) > 255
   then
      begin
         ShowMessage('RGB Value cannot exceed 255');
         AELBRed.SetFocus;
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

   if StrToInt(Trim(AELBHue.Text)) > 360
   then
      begin
         ShowMessage('Hue Value cannot exceed 360');
         AELBHue.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBLBrightness.Text)) > 100
   then
      begin
         ShowMessage('Brightness Value cannot exceed 100');
         AELBLBrightness.SetFocus;
         Exit;
      end;

   if StrToInt(Trim(AELBSaturation.Text)) > 100
   then
      begin
         ShowMessage('Saturation Value cannot exceed 100');
         AELBSaturation.SetFocus;
         Exit;
      end;

   if (StrToInt(Trim(AELBColorTemp.Text)) < 1000) or
      (StrToInt(Trim(AELBColorTemp.Text)) > 10000)
   then
      begin
         ShowMessage('Color Temperature must be between 1000 and 10000');
         AELBColorTemp.SetFocus;
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

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
         DMBroadlink.QGetBLDevByName.Open;

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
   HSVR : THSV;

begin

   ColorDialog.Color := RGB(AELBRed.Text.ToInteger, AELBGreen.Text.ToInteger, AELBBlue.Text.ToInteger);

   if ColorDialog.Execute
   then
      begin

         RGBInt := ColorToRGB(ColorDialog.Color);
         AELBRed.Text := IntToStr(GetRValue(RGBInt));
         AELBGreen.Text := IntToStr(GetGValue(RGBInt));
         AELBBlue.Text := IntToStr(GetBValue(RGBInt));

         HSVR := RGB2HSV (GetRValue(RGBInt), GetGValue(RGBInt), GetBValue(RGBInt));

         AELBHue.Text := IntToStr(Round(HSVR.Hue));
         AELBSaturation.Text := IntToStr(Round(HSVR.Sat));
         AELBLBrightness.Text := IntToStr(Round(HSVR.Val));

      end;

end;

procedure TFAddLightButton.BLBTestClick(Sender: TObject);
begin

   DMBroadlink.QGetBLDevByName.Close;
   DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
   DMBroadlink.QGetBLDevByName.Open;

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --setlightstate "' + CreateStateString + '"');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

end.
