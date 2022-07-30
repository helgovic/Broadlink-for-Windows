unit UFAddTimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGroupBox,
  AdvOfficeButtons, Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, AdvEdit,
  Vcl.ExtCtrls, DateUtils, System.JSON, JvExStdCtrls, JvGroupBox, FireDAC.Stan.Param,
  Vcl.Imaging.pngimage;

type

  TDeviceObj = class
    DevType: string;
  end;

  TFAddTimer = class(TForm)
    GBWhen: TGroupBox;
    Panel1: TPanel;
    BSaveTimer: TButton;
    ACBBLRem: TAdvComboBox;
    BAddTimerCancel: TButton;
    ACBDevices: TAdvComboBox;
    ACBButton: TAdvComboBox;
    AGBButton: TJvGroupBox;
    ACGMacro: TJvGroupBox;
    ACBMacro: TAdvComboBox;
    GBOnce: TJvGroupBox;
    ADTPOnce: TAdvDateTimePicker;
    GBRepeat: TJvGroupBox;
    GBSunrise: TJvGroupBox;
    AERepeat: TAdvEdit;
    ACBRepeatType: TAdvComboBox;
    ADTPStartTime: TAdvDateTimePicker;
    AEDeltaTime: TAdvEdit;
    ACBDeltaTimeType: TAdvComboBox;
    ACBDeltaTimeBA: TAdvComboBox;
    ACBSunriseSet: TAdvComboBox;
    ACBLocation: TAdvComboBox;
    INewLocation: TImage;
    procedure FormShow(Sender: TObject);
    procedure ACBDevicesChange(Sender: TObject);
    procedure AGBButtonCheckBoxClick(Sender: TObject);
    procedure BSaveTimerClick(Sender: TObject);
    procedure ACGMacroCheckBoxClick(Sender: TObject);
    procedure GBOnceCheckBoxClick(Sender: TObject);
    procedure GBRepeatCheckBoxClick(Sender: TObject);
    procedure GBSunriseCheckBoxClick(Sender: TObject);
    procedure INewLocationClick(Sender: TObject);
  private
    procedure LoadButtons;
    procedure LoadLocations;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddTimer: TFAddTimer;

implementation

uses
   UDMBroadlink, UFBroadlink, JCLStrings, UFLocations, UFNewLocation, UFTimers;

{$R *.dfm}

procedure TFAddTimer.LoadLocations;
begin

   DMBroadlink.QGetLocations.Close;
   DMBroadlink.QGetLocations.Open;

   ACBLocation.Items.Clear;

   while not DMBroadlink.QGetLocations.Eof do
      begin

         if DMBroadlink.QGetLocations.FieldByName('Default').AsBoolean
         then
            ACBLocation.Items.Add(DMBroadlink.QGetLocations.FieldByName('Name').AsString + ' (Default)')
         else
            ACBLocation.Items.Add(DMBroadlink.QGetLocations.FieldByName('Name').AsString);

         DMBroadlink.QGetLocations.Next;

      end;

end;

procedure TFAddTimer.LoadButtons;
begin

   ACBButton.Items.Clear;

   if (TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType = 'IR') or
      (TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType = 'RF')
   then
      begin

         DMBroadlink.QGetButtons.Close;
         DMBroadlink.QGetButtons.ParamByName('DevName').AsString := ACBDevices.Items[ACBDevices.ItemIndex];
         DMBroadlink.QGetButtons.Open;

         while not DMBroadlink.QGetButtons.Eof do
            begin

               ACBButton.Items.Add(DMBroadlink.QGetButtons.FieldByName('Name').AsString);

               DMBroadlink.QGetButtons.Next;

            end;

      end
   else
      if TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType = 'WiFi Bulb'
      then
         begin

            DMBroadlink.QGetBLButtons.Close;
            DMBroadlink.QGetBLButtons.ParamByName('DevName').AsString := ACBDevices.Items[ACBDevices.ItemIndex];
            DMBroadlink.QGetBLButtons.Open;

            while not DMBroadlink.QGetBLButtons.Eof do
               begin

                  ACBButton.Items.Add(DMBroadlink.QGetBLButtons.FieldByName('Name').AsString);

                  DMBroadlink.QGetBLButtons.Next;

               end;

         end;

   if ACBButton.Items.Count > 0
   then
      ACBButton.ItemIndex := 0;

end;

procedure TFAddTimer.ACBDevicesChange(Sender: TObject);
begin
   LoadButtons;
end;

procedure TFAddTimer.ACGMacroCheckBoxClick(Sender: TObject);
begin

   if ACGMacro.Checked
   then
      AGBButton.Checked := False
   else
      AGBButton.Checked := False;

end;

procedure TFAddTimer.AGBButtonCheckBoxClick(Sender: TObject);
begin

   if AGBButton.Checked
   then
      ACGMacro.Checked := False
   else
      ACGMacro.Checked := True;

end;

procedure TFAddTimer.BSaveTimerClick(Sender: TObject);
begin

   TThread.CreateAnonymousThread(
   procedure

   var
      TmpTime: TDateTime;

   begin

      PauseTimers := True;

      while not TimersFinished do
         Sleep(100);

      DMBroadlink.TTimers.Insert;

      DMBroadlink.QGetTimerID.Close;
      DMBroadlink.QGetTimerID.Open;

      if DMBroadlink.QGetTimerID.FieldByName('NewID').IsNull
      then
         DMBroadlink.TTimers.FieldByName('ID').AsInteger := 1
      else
         DMBroadlink.TTimers.FieldByName('ID').AsInteger := DMBroadlink.QGetTimerID.FieldByName('NewID').AsInteger;

      if GBOnce.Checked
      then
         begin
            DMBroadlink.TTimers.FieldByName('StartTime').AsDateTime := ADTPOnce.DateTime;
            DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := ADTPOnce.DateTime;
            DMBroadlink.TTimers.FieldByName('RepeatType').AsString := 'Once';
         end
      else
         if GBRepeat.Checked
         then
            begin

               if StrToInt(AERepeat.Text) <= 0
               then
                  begin

                     ShowMessage('Repeat interval cannot be less than 1');
                     AERepeat.SetFocus;
                     Exit;

                  end;

               DMBroadlink.TTimers.FieldByName('StartTime').AsDateTime := ADTPStartTime.DateTime;
               DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := ADTPStartTime.DateTime;
               DMBroadlink.TTimers.FieldByName('RepeatType').AsString := 'Repeat';
               DMBroadlink.TTimers.FieldByName('IntervalType').AsString := ACBRepeatType.Text;
               DMBroadlink.TTimers.FieldByName('RepeatInterval').AsInteger := StrToInt64(AERepeat.Text);

            end
         else
            if GBSunrise.Checked
            then
               begin

                  if StrToInt(AEDeltaTime.Text) < 0
                  then
                     begin

                        ShowMessage('Time cannot be less than 0');
                        AEDeltaTime.SetFocus;
                        Exit;

                     end;

                  if ACBLocation.Text = ''
                  then
                     begin

                        ShowMessage('You need to define a location. Click the + sign next to "Location"');
                        Exit;

                     end;

                  DMBroadlink.TTimers.FieldByName('StartTime').AsDateTime := Now;
                  DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger := StrToInt(AEDeltaTime.Text);
                  DMBroadlink.TTimers.FieldByName('DeltaTimeType').AsString := ACBDeltaTimeType.Text;
                  DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString := ACBDeltaTimeBA.Text;
                  DMBroadlink.TTimers.FieldByName('Location').AsString := StringReplace(ACBLocation.Text, ' (Default)', '', []);

                  DMBroadlink.TLocations.FindKey([DMBroadlink.TTimers.FieldByName('Location').AsString]);

                  if ACBSunriseSet.Text = 'Sunrise'
                  then
                     begin

                        TmpTime := GetSunUpDown(True, Now, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                        if DMBroadlink.TTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                        then
                           if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                           then
                              TmpTime :=  IncHour(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                           else
                              TmpTime :=  IncHour(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                        else
                           if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                           then
                              TmpTime :=  IncMinute(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                           else
                              TmpTime :=  IncMinute(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger);

                        if TmpTime > now
                        then
                           DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime
                        else
                           begin

                              TmpTime := GetSunUpDown(True, ToMorrow, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                              if DMBroadlink.TTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                              then
                                 if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncHour(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncHour(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                              else
                                 if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncMinute(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncMinute(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger);

                              DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime;

                           end;

                        DMBroadlink.TTimers.FieldByName('RepeatType').AsString := 'Sunrise';

                     end
                  else
                     begin

                        TmpTime := GetSunUpDown(False, Now, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                        if DMBroadlink.TTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                        then
                           if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                           then
                              TmpTime :=  IncHour(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                           else
                              TmpTime :=  IncHour(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                        else
                           if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                           then
                              TmpTime :=  IncMinute(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                           else
                              TmpTime :=  IncMinute(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger);

                        if TmpTime > now
                        then
                           DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime
                        else
                           begin

                              TmpTime := GetSunUpDown(False, ToMorrow, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                              if DMBroadlink.TTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                              then
                                 if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncHour(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncHour(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                              else
                                 if DMBroadlink.TTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncMinute(TmpTime, -DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncMinute(TmpTime, DMBroadlink.TTimers.FieldByName('DeltaTime').AsInteger);

                              DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime;

                           end;

                        DMBroadlink.TTimers.FieldByName('RepeatType').AsString := 'Sunset';

                     end;

               end;

      DMBroadlink.TTimers.FieldByName('BLRemoteName').AsString := StrBefore(' : ', ACBBLRem.Text);

      if AGBButton.Checked
      then
         begin

            DMBroadlink.TTimers.FieldByName('MacroID').AsInteger := 0;
            DMBroadlink.TTimers.FieldByName('DeviceType').AsString := TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType;

            if (TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType = 'IR') or
               (TDeviceObj(ACBDevices.Items.Objects[ACBDevices.ItemIndex]).DevType = 'RF')
            then
               begin

                  DMBroadlink.QGetCode.Close;
                  DMBroadlink.QGetCode.ParamByName('DevName').AsString := ACBDevices.Text;
                  DMBroadlink.QGetCode.ParamByName('ButtName').AsString := ACBButton.Text;
                  DMBroadlink.QGetCode.Open;

                  DMBroadlink.TTimers.FieldByName('DeviceID').AsInteger := DMBroadlink.QGetCode.FieldByName('DeviceID').AsInteger;
                  DMBroadlink.TTimers.FieldByName('ButtonID').AsInteger := DMBroadlink.QGetCode.FieldByName('ID').AsInteger;

               end
            else
               begin

                  DMBroadlink.QGetBLButton.Close;
                  DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := ACBDevices.Text;
                  DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := ACBButton.Text;
                  DMBroadlink.QGetBLButton.Open;

                  DMBroadlink.TTimers.FieldByName('ButtonID').AsInteger := DMBroadlink.QGetBLButton.FieldByName('ID').AsInteger;

               end;

         end
      else
         begin

            DMBroadlink.QGetMacroByName.Close;
            DMBroadlink.QGetMacroByName.ParamByName('Name').AsString := ACBMacro.Text;
            DMBroadlink.QGetMacroByName.Open;

            DMBroadlink.TTimers.FieldByName('DeviceID').AsInteger := 0;
            DMBroadlink.TTimers.FieldByName('ButtonID').AsInteger := 0;
            DMBroadlink.TTimers.FieldByName('MacroID').AsInteger := DMBroadlink.QGetMacroByName.FieldByName('ID').AsInteger;

         end;

      DMBroadlink.TTimers.Post;

      PauseTimers := False;
      FTimers.TCheckTimers.Enabled := True;

      ModalResult := mrOK;

   end).Start;

end;

procedure TFAddTimer.FormShow(Sender: TObject);

var
   DType: TDeviceObj;
   i: integer;
   TmpStr: String;

begin

   ADTPOnce.DateTime := Now;
   ADTPStartTime.DateTime := Now;
   AERepeat.Text := '1';
   GBOnce.Checked := True;

   ACBDevices.Items.Clear;

   DMBroadlink.QGetDevices.Close;
   DMBroadlink.QGetDevices.Open;

   while not DMBroadlink.QGetDevices.Eof do
      begin

         DType := TDeviceObj.Create;
         DType.DevType := DMBroadlink.QGetDevices.FieldByName('Type').AsString;

         ACBDevices.AddItem(DMBroadlink.QGetDevices.FieldByName('DeviceName').AsString, DType);

         DMBroadlink.QGetDevices.Next;

      end;

   if ACBDevices.Items.Count > 0
   then
      begin

         ACBDevices.ItemIndex := 0;

         LoadButtons;

      end;

   DMBroadlink.TMacros.First;

   while not DMBroadlink.TMacros.Eof do
      begin

         ACBMacro.Items.Add(DMBroadlink.TMacros.FieldByName('Name').AsString);
         DMBroadlink.TMacros.Next;

      end;

   ACBBLRem.Items.Clear;

   for i := 0 to FBroadlink.CBDevice.Items.Count - 1 do
      ACBBLRem.Items.Add(FBroadlink.CBDevice.Items[i]);

   if ACBBLRem.Items.Count > 0
   then
      ACBBLRem.ItemIndex:= FBroadlink.CBDevice.ItemIndex;

   DMBroadlink.QGetLocations.Close;
   DMBroadlink.QGetLocations.Open;

   ACBLocation.Items.Clear;

   while not DMBroadlink.QGetLocations.Eof do
      begin

         if DMBroadlink.QGetLocations.FieldByName('Default').AsBoolean
         then
            begin
               ACBLocation.Items.Add(DMBroadlink.QGetLocations.FieldByName('Name').AsString + ' (Default)');
               TmpStr := DMBroadlink.QGetLocations.FieldByName('Name').AsString + ' (Default)';
            end
         else
            ACBLocation.Items.Add(DMBroadlink.QGetLocations.FieldByName('Name').AsString);

         DMBroadlink.QGetLocations.Next;

      end;

  ACBLocation.ItemIndex := ACBLocation.Items.IndexOf(TmpStr);

end;

procedure TFAddTimer.GBOnceCheckBoxClick(Sender: TObject);
begin

  if GBOnce.Checked
  then
     begin
        GBRepeat.Checked := False;
        GBSunrise.Checked := False;
     end;

end;

procedure TFAddTimer.GBRepeatCheckBoxClick(Sender: TObject);
begin

  if GBRepeat.Checked
  then
     begin
        GBOnce.Checked := False;
        GBSunrise.Checked := False;
     end;

end;

procedure TFAddTimer.GBSunriseCheckBoxClick(Sender: TObject);
begin

  if GBSunrise.Checked
  then
     begin
        GBOnce.Checked := False;
        GBRepeat.Checked := False;
     end;

end;

procedure TFAddTimer.INewLocationClick(Sender: TObject);
begin

   if FNewLocation.ShowModal = mrOK
   then
      begin

         LoadLocations;

         ACBLocation.ItemIndex := ACBLocation.Items.IndexOf(FNewLocation.AELocName.Text);

      end;

end;

end.
