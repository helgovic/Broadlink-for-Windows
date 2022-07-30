program SendBLCommand;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows, Winapi.Messages, System.Classes;

var
   CDS : CopyDataStruct;
   S: String;
   FileLines: TStringList;

  procedure CopyData;
  begin

     CDS.dwData := 0;
     CDS.cbData := Length(s) * SizeOf(S[1]);
     CDS.lpData := PChar(S);

     SendMessage(FindWindow('TFBroadlink', 'Broadlink for Windows'), WM_COPYDATA, 0,  Integer(@CDS));

  end;

begin

   if FindWindow('TFBroadlink', 'Broadlink for Windows') = 0
   then
      begin

         WriteLn('');
         WriteLn('Cannot find gui app. WinBroadlink has to be startet');

         Exit;

      end;

   if (ParamCount = 0) or
      (ParamStr(1) = '--help') or
      ((ParamStr(1) <> '--sendcmd') and
      (ParamStr(1) <> '--sendwificmd') and
       (ParamStr(1) <> '--sendmacro'))
   then
      begin
         WriteLn('');
         WriteLn('Parameters:');
         WriteLn('');
         WriteLn('    --sendcmd "Broadlink remote name" "Device name" "Buttonname"');
         WriteLn('    --sendwificmd "WiFi device name" "Command"');
         WriteLn('    --sendmacro "Broadlink remote name" "Macro name"');
         Exit;
      end;

   FileLines := TStringList.Create;

   if ParamStr(1) = '--sendcmd'
   then
      begin

         FileLines.Add(ParamStr(2));
         FileLines.Add(ParamStr(3));
         FileLines.Add(ParamStr(4));
         FileLines.SaveToFile(ExtractFileDir(ParamStr(0)) + '\SendCommand.txt');
         FileLines.DisposeOf;

         S := 'SendCommand';

         CopyData;

         Exit;

      end;

   if ParamStr(1) = '--sendwificmd'
   then
      begin

         FileLines.Add(ParamStr(2));
         FileLines.Add(ParamStr(3));
         FileLines.SaveToFile(ExtractFileDir(ParamStr(0)) + '\SendCommand.txt');
         FileLines.DisposeOf;

         S := 'SendBLCommand';

         CopyData;

         Exit;

      end;

   if ParamStr(1) = '--sendmacro'
   then
      begin

         FileLines.Add(ParamStr(2));
         FileLines.Add(ParamStr(3));
         FileLines.SaveToFile(ExtractFileDir(ParamStr(0)) + '\SendCommand.txt');
         FileLines.DisposeOf;

         S := 'SendMacro';

         CopyData;

         Exit;

      end;

end.
