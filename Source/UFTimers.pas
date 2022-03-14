unit UFTimers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DateUtils, System.Generics.Collections, Threading,
  FireDAC.Stan.Param, Data.DB;

type
  TFTimers = class(TForm)
    Panel1: TPanel;
    BAddTimer: TButton;
    SBTimers: TScrollBox;
    TCheckTimers: TTimer;
    BTimersClose: TButton;
    procedure BAddTimerClick(Sender: TObject);
    procedure TCheckTimersTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTimersCloseClick(Sender: TObject);
  private
    procedure ExecOut(const Text: string);
    { Private declarations }
  public
    { Public declarations }
    procedure LoadTimers;
  end;

var
   FTimers: TFTimers;
   PauseTimers: Boolean = False;
   TimersFinished: Boolean = True;

implementation

uses
   UFrTimer, UFAddTimer, UDMBroadlink, UFBroadlink, JclSysUtils;

{$R *.dfm}

var
   TimerFrames: TList<TFrTimer>;

procedure TFTimers.BAddTimerClick(Sender: TObject);
begin

   if FAddTimer.ShowModal = mrOK
   then
      LoadTimers;

end;

procedure TFTimers.BTimersCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFTimers.ExecOut(const Text: string);

//var
//   OutLines: TStringList;
//   i: Integer;
//   TmpStr: String;
//   NewDev: Boolean;

begin



end;

procedure TFTimers.FormCreate(Sender: TObject);
begin

  TimerFrames := TList<TFrTimer>.Create;

end;

procedure TFTimers.LoadTimers;

var
   i: Integer;
   TTimFrame: TFrTimer;

begin

   for i := TimerFrames.Count - 1 downto 0 do
      TimerFrames[i].DisposeOf;

   TimerFrames.Clear;

   DMBroadlink.QGetTimers.Close;
   DMBroadlink.QGetTimers.Open;

   i := 0;

   while not DMBroadlink.QGetTimers.Eof do
      begin

         Inc(i);

         TTimFrame := TFrTimer.Create(Self);
         TTimFrame.Name := 'FrTimer' + i.ToString;
         TTimFrame.Parent := SBTimers;
         TTimFrame.Align := alTop;

         TTimFrame.ETimerID.Text := IntToStr(DMBroadlink.QGetTimers.FieldByName('ID').AsInteger);

         TTimFrame.AGBWhat.Caption := FormatDateTime('dddddd hh:nn:ss', DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime);

         if DMBroadlink.QGetTimers.FieldByName('MacroID').AsInteger > 0
         then
            begin

               DMBroadlink.TMacros.FindKey([DMBroadlink.QGetTimers.FieldByName('MacroID').AsInteger]);

               TTimFrame.LWhat.Caption := 'Run Macro "' + DMBroadlink.TMacros.FieldByName('Name').AsString + '" using Broadlink remote "' + DMBroadlink.QGetTimers.FieldByName('BlRemoteName').AsString + '".';

            end
         else
            begin

               if (DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString = 'IR') or
                  (DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString = 'RF')
               then
                  TTimFrame.LWhat.Caption := 'Execute Button "' + DMBroadlink.QGetTimers.FieldByName('ButtName').AsString + '" on device "' + DMBroadlink.QGetTimers.FieldByName('DeviceName').AsString + '" using Broadlink remote "' + DMBroadlink.QGetTimers.FieldByName('BLRemoteName').AsString + '".'
               else
                  TTimFrame.LWhat.Caption := 'Execute Button "' + DMBroadlink.QGetTimers.FieldByName('ButtName').AsString + '" on WiFi device "' + DMBroadlink.QGetTimers.FieldByName('DeviceName').AsString + '".';

            end;

         TTimFrame.LWhat.Caption := TTimFrame.LWhat.Caption + sLineBreak;

         if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Once'
         then
            TTimFrame.LWhat.Caption :=  TTimFrame.LWhat.Caption + 'Run once';

         if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Repeat'
         then
            TTimFrame.LWhat.Caption :=  TTimFrame.LWhat.Caption + 'Run every ' + DMBroadlink.QGetTimers.FieldByName('RepeatInterval').AsString +
               ' ' + DMBroadlink.QGetTimers.FieldByName('IntervalType').AsString + ' Starting ' +
               FormatDateTime('dddddd hh:nn:ss', DMBroadlink.QGetTimers.FieldByName('StartTime').AsDateTime);

         if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Sunrise'
         then
            TTimFrame.LWhat.Caption :=  TTimFrame.LWhat.Caption + 'Run every day at ' + DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsString + ' ' + DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString + ' ' + DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString + ' sunrise in ' + DMBroadlink.QGetTimers.FieldByName('Location').AsString + '.';

         if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Sunset'
         then
            TTimFrame.LWhat.Caption :=  TTimFrame.LWhat.Caption + 'Run every day at ' + DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsString + ' ' + DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString + ' ' + DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString + ' sunset in ' + DMBroadlink.QGetTimers.FieldByName('Location').AsString + '.';

         TimerFrames.Add(TTimFrame);

         DMBroadlink.QGetTimers.Next;

      end;

end;

procedure TFTimers.FormShow(Sender: TObject);
begin

   LoadTimers;

end;

procedure TFTimers.TCheckTimersTimer(Sender: TObject);
begin

   TCheckTimers.Enabled := False;

   TThread.CreateAnonymousThread(
   procedure

   var
      TmpTime: TDateTime;

   begin

      if PauseTimers
      then
         begin
            TimersFinished := True;
            Exit;
         end;

      DMBroadlink.QGetTimers.Close;
      DMBroadlink.QGetTimers.Open;

      while not DMBroadlink.QGetTimers.Eof do
         begin

            TimersFinished := False;

            if PauseTimers
            then
               begin
                  TimersFinished := True;
                  Exit;
               end;

            if DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime <= now
            then
               begin

                  if DMBroadlink.QGetTimers.FieldByName('MacroID').AsInteger > 0
                  then
                     begin

                        DMBroadlink.TMacros.FindKey([DMBroadlink.QGetTimers.FieldByName('MacroID').AsInteger]);

                        DMBroadlink.QGetBLDevByName.Close;
                        DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := DMBroadlink.QGetTimers.FieldByName('BLRemoteName').AsString;
                        DMBroadlink.QGetBLDevByName.Open;

                        if DMBroadlink.QGetBLDevByName.IsEmpty
                        then
                           begin
                              ShowMessage('Broadlink device ' + DMBroadlink.QGetTimers.FieldByName('BLRemoteName').AsString + ' not found');
                              Exit;
                           end;

                        DMBroadlink.QGetMacroButtons.Close;
                        DMBroadlink.QGetMacroButtons.ParamByName('MacroName').AsString := DMBroadlink.TMacros.FieldByName('Name').AsString;
                        DMBroadlink.QGetMacroButtons.Open;

                        while not DMBroadlink.QGetMacroButtons.Eof do
                           begin

                              FileLines := TStringList.Create;
                              FileLines.Add(ExtractFileDrive(AppDir));
                              FileLines.Add('cd "' + AppDir + '"');

                              FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + DMBroadlink.QGetMacroButtons.FieldByName('Code').AsString + '"');

                              FileLines.SaveToFile(AppDir + '\Commands.bat');

                              Execute(AppDir + '\Commands.bat', ExecOut);

                              FileLines.DisposeOf;

                              Sleep(DMBroadlink.QGetMacroButtons.FieldByName('wait').AsInteger);

                              DMBroadlink.QGetMacroButtons.Next;

                           end;

                     end
                  else
                     begin

                        if (DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString = 'IR') or
                           (DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString = 'RF')
                        then
                           begin

                              DMBroadlink.QGetBLDevByName.Close;
                              DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := DMBroadlink.QGetTimers.FieldByName('BLRemoteName').AsString;
                              DMBroadlink.QGetBLDevByName.Open;

                              if DMBroadlink.QGetBLDevByName.IsEmpty
                              then
                                 begin
                                    ShowMessage('Broadlink device ' + DMBroadlink.QGetTimers.FieldByName('BLRemoteName').AsString + ' not found');
                                    Exit;
                                 end;

                              DMBroadlink.TButtons.FindKey([DMBroadlink.QGetTimers.FieldByName('ButtonID').AsInteger]);

                              FileLines := TStringList.Create;
                              FileLines.Add(ExtractFileDrive(AppDir));
                              FileLines.Add('cd "' + AppDir + '"');

                              FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + DMBroadlink.TButtons.FieldByName('Code').AsString + '"');

                              FileLines.SaveToFile(AppDir + '\Commands.bat');

                              Execute(AppDir + '\Commands.bat', ExecOut);

                              FileLines.DisposeOf;

                           end
                        else
                           if DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString  = 'WiFi Bulb'
                           then
                              begin

                                 DMBroadlink.TBLDevice.FindKey([DMBroadlink.QGetTimers.FieldByName('DeviceID').AsInteger]);

                                 DMBroadlink.TBLButtons.FindKey([DMBroadlink.QGetTimers.FieldByName('ButtonID').AsInteger]);

                                 FileLines := TStringList.Create;
                                 FileLines.Add(ExtractFileDrive(AppDir));
                                 FileLines.Add('cd "' + AppDir + '"');

                                 FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.TBLDevice.FieldByName('HexType').AsString + ' ' + DMBroadlink.TBLDevice.FieldByName('IP').AsString + ' ' + DMBroadlink.TBLDevice.FieldByName('Mac').AsString + '" --setlightstate "' + DMBroadlink.TBLButtons.FieldByName('Command').AsString + '"');

                                 FileLines.SaveToFile(AppDir + '\Commands.bat');

                                 Execute(AppDir + '\Commands.bat', ExecOut);

                                 FileLines.DisposeOf;

                              end
                           else
                              if DMBroadlink.QGetTimers.FieldByName('DeviceType').AsString  = 'WiFi Switch'
                              then
                                 begin

                                    DMBroadlink.TBLDevice.FindKey([DMBroadlink.QGetTimers.FieldByName('DeviceID').AsInteger]);

                                    DMBroadlink.TBLButtons.FindKey([DMBroadlink.QGetTimers.FieldByName('ButtonID').AsInteger]);

                                    FileLines := TStringList.Create;
                                    FileLines.Add(ExtractFileDrive(AppDir));
                                    FileLines.Add('cd "' + AppDir + '"');

                                    FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.TBLDevice.FieldByName('HexType').AsString + ' ' + DMBroadlink.TBLDevice.FieldByName('IP').AsString + ' ' + DMBroadlink.TBLDevice.FieldByName('Mac').AsString + '" ' + DMBroadlink.TBLButtons.FieldByName('Command').AsString);

                                    FileLines.SaveToFile(AppDir + '\Commands.bat');

                                    Execute(AppDir + '\Commands.bat', ExecOut);

                                    FileLines.DisposeOf;

                                 end;

                     end;

                  DMBroadlink.TTimers.FindKey([DMBroadlink.QGetTimers.FieldByName('ID').AsInteger]);

                  if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Once'
                  then
                     DMBroadlink.TTimers.Delete
                  else
                     begin

                        DMBroadlink.TTimers.Edit;

                        if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Repeat'
                        then
                           begin

                              if DMBroadlink.QGetTimers.FieldByName('IntervalType').AsString = 'Days'
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := IncDay(DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime, DMBroadlink.QGetTimers.FieldByName('RepeatInterval').AsInteger);

                              if DMBroadlink.QGetTimers.FieldByName('IntervalType').AsString = 'Hours'
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := IncHour(DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime, DMBroadlink.QGetTimers.FieldByName('RepeatInterval').AsInteger);

                              if DMBroadlink.QGetTimers.FieldByName('IntervalType').AsString = 'Minutes'
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := IncMinute(DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime, DMBroadlink.QGetTimers.FieldByName('RepeatInterval').AsInteger);

                              if DMBroadlink.QGetTimers.FieldByName('IntervalType').AsString = 'Seconds'
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := IncSecond(DMBroadlink.QGetTimers.FieldByName('NextRun').AsDateTime, DMBroadlink.QGetTimers.FieldByName('RepeatInterval').AsInteger);

                           end;

                        if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Sunrise'
                        then
                           begin

                              DMBroadlink.TLocations.FindKey([DMBroadlink.QGetTimers.FieldByName('Location').AsString]);

                              TmpTime := GetSunUpDown(True, Now, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                              if DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                              then
                                 if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncHour(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncHour(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                              else
                                 if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncMinute(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncMinute(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger);

                              if TmpTime > now
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime
                              else
                                 begin

                                    TmpTime := GetSunUpDown(True, ToMorrow, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                                    if DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                                    then
                                       if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                       then
                                          TmpTime :=  IncHour(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                       else
                                          TmpTime :=  IncHour(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                    else
                                       if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                       then
                                          TmpTime :=  IncMinute(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                       else
                                          TmpTime :=  IncMinute(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger);

                                    DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime;

                                 end;

                           end;

                        if DMBroadlink.QGetTimers.FieldByName('RepeatType').AsString = 'Sunset'
                        then
                           begin

                              DMBroadlink.TLocations.FindKey([DMBroadlink.QGetTimers.FieldByName('Location').AsString]);

                              TmpTime := GetSunUpDown(False, Now, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                              if DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                              then
                                 if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncHour(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncHour(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                              else
                                 if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                 then
                                    TmpTime :=  IncMinute(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                 else
                                    TmpTime :=  IncMinute(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger);

                              if TmpTime > now
                              then
                                 DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime
                              else
                                 begin

                                    TmpTime := GetSunUpDown(False, ToMorrow, DMBroadlink.TLocations.FieldByName('Lattitude').AsString, DMBroadlink.TLocations.FieldByName('Longitude').AsString);

                                    if DMBroadlink.QGetTimers.FieldByName('DeltaTimeType').AsString = 'Hours'
                                    then
                                       if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                       then
                                          TmpTime :=  IncHour(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                       else
                                          TmpTime :=  IncHour(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                    else
                                       if DMBroadlink.QGetTimers.FieldByName('DeltaTimeBA').AsString = 'Before'
                                       then
                                          TmpTime :=  IncMinute(TmpTime, -DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger)
                                       else
                                          TmpTime :=  IncMinute(TmpTime, DMBroadlink.QGetTimers.FieldByName('DeltaTime').AsInteger);

                                    DMBroadlink.TTimers.FieldByName('NextRun').AsDateTime := TmpTime;

                                 end;

                           end;

                        DMBroadlink.TTimers.Post;

                     end;

               end;

            if PauseTimers
            then
               begin
                  TimersFinished := True;
                  Exit;
               end;

            DMBroadlink.QGetTimers.Next;

         end;

      if not PauseTimers
      then
         TCheckTimers.Enabled := True;

   end
   ).Start;

end;

end.
