program SendBLCommand;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows, Winapi.Messages, System.Classes;

var
   CDS : CopyDataStruct;
   TmpStr: String;
   S: String;
   FileLines: TStringList;

begin

   FileLines := TStringList.Create;

   if ParamStr(1) = 'SendCommand'
   then
      begin

         FileLines.Add(ParamStr(2));
         FileLines.Add(ParamStr(3));
         FileLines.Add(ParamStr(4));
         FileLines.SaveToFile(ExtractFileDir(ParamStr(0)) + '\SendCommand.txt');
         FileLines.DisposeOf;

         S := 'SendCommand';

      end;

   if ParamStr(1) = 'SendMacro'
   then
      begin

         FileLines.Add(ParamStr(2));
         FileLines.Add(ParamStr(3));
         FileLines.SaveToFile(ExtractFileDir(ParamStr(0)) + '\SendCommand.txt');
         FileLines.DisposeOf;

         S := 'SendMacro';

      end;

  CDS.dwData := 0;
  CDS.cbData := Length(s) * SizeOf(S[1]);
  CDS.lpData := PChar(S);

  SendMessage(FindWindow('TFBroadlink', 'Broadlink'), WM_COPYDATA, 0,  Integer(@CDS));

end.
