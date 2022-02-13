unit UFAddButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Threading, System.IOUtils;

type
  TFAddButton = class(TForm)
    LEButtonName: TLabeledEdit;
    MStatus: TMemo;
    BContinue: TButton;
    MCode: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    BAddButtonOK: TButton;
    BAddDeviceCancel: TButton;
    BStart: TButton;
    procedure BContinueClick(Sender: TObject);
    procedure BAddButtonOKClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure OnCDMessage(var Message: TMessage); message WM_COPYDATA;
    procedure BStartClick(Sender: TObject);
    procedure BAddDeviceCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecOut(const Text: string);
  public
    { Public declarations }
  end;

var
  FAddButton: TFAddButton;

implementation

uses
   UFBroadlink, JclSysUtils, JclStrings;

{$R *.dfm}

var
   CloseAllowed: Boolean = True;

procedure TFAddButton.BAddButtonOKClick(Sender: TObject);
begin

   CloseAllowed := True;

   if Trim(LEButtonName.Text) = ''
   then
      begin
         ShowMessage('Please enter button name');
         LEButtonName.SetFocus;
         CloseAllowed := False;
         Exit;
      end;

   FBroadlink.QGetCode.Close;
   FBroadlink.QGetCode.ParamByName('DevName').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
   FBroadlink.QGetCode.ParamByName('ButtName').AsString := Trim(LEButtonName.Text);
   FBroadlink.QGetCode.Open;

   if not FBroadlink.QGetCode.IsEmpty
   then
      begin
         ShowMessage('Button ' + Trim(LEButtonName.Text) + ' allready exists');
         LEButtonName.SetFocus;
         CloseAllowed := False;
         Exit;
      end;

   if Trim(MCode.Text) = ''
   then
      begin
         ShowMessage('Please start learning');
         CloseAllowed := False;
      end;

end;

procedure TFAddButton.BAddDeviceCancelClick(Sender: TObject);
begin
   CloseAllowed := True;
end;

procedure TFAddButton.BContinueClick(Sender: TObject);
begin

   BContinue.Enabled := False;

   RenameFile(AppDir + '\waitfilewait', AppDir + '\waitfile');

end;

procedure TFAddButton.BStartClick(Sender: TObject);
begin

   MStatus.Text := '';
   MCode.Text := '';

   RenameFile(AppDir + '\waitfile', AppDir + '\waitfilewait');

   TThread.CreateAnonymousThread(
   procedure
   begin

      FileLines := TStringList.Create;
      FileLines.Add(ExtractFileDrive(AppDir));
      FileLines.Add('cd "' + AppDir + '"');

      FBroadlink.TDevice.IndexName := 'DevNameIdx';
      FBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

      if FBroadlink.TDevice.FieldByName('IR').AsBoolean
      then
         FileLines.Add('python broadlink_cli2 --device "' + StrAfter(' : ', FBroadlink.CBDevice.Text) + '" --learn')
      else
         FileLines.Add('python broadlink_cli2 --device "' + StrAfter(' : ', FBroadlink.CBDevice.Text) + '" --rfscanlearn');

      FileLines.SaveToFile(AppDir + '\Commands.bat');

      Execute(AppDir + '\Commands.bat', ExecOut);

      FileLines.DisposeOf;


   end).Start;

end;

procedure TFAddButton.ExecOut(const Text: string);

var
   OutLines: TStringList;
   i: Integer;

begin

   TThread.Synchronize(TThread.CurrentThread,
   procedure
   begin
      MStatus.Text := MStatus.Text + Text;
      SendMessage(MStatus.Handle, WM_VSCROLL, SB_BOTTOM, 0);
   end);

   OutLines := TStringList.Create;
   OutLines.Text := Text;

   for i := 0 to OutLines.Count - 1 do
      begin

         if Pos('Command : ', OutLines[i]) > 0
         then
            MCode.Text := StrAfter('Command : ', OutLines[i]);
      end;

   OutLines.DisposeOf;

end;

procedure TFAddButton.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   CanClose := CloseAllowed;

end;

procedure TFAddButton.FormShow(Sender: TObject);
begin

   MStatus.Text := '';
   MCode.Text := '';

   LEButtonName.SetFocus;

end;

procedure TFAddButton.OnCDMessage(var Message: TMessage);

var
   InPut: string;
   MsgParts: TStringList;
   CDStruct : PCopyDataStruct;
   l : Integer;

begin

   CDStruct := PCopyDataStruct(Message.lParam);

   if (CDStruct <> nil)
   then
      begin

         l := CDStruct^.cbData;
         SetLength(InPut, (l+1));
         StrLCopy(PChar(InPut), PChar(CDStruct^.lpData), l);

      end;

   MsgParts := TStringList.Create;
   MsgParts.Delimiter := ';';
   MsgParts.StrictDelimiter := True;
   MsgParts.DelimitedText := InPut;

   if MsgParts[0] = 'LearnStatus'
   then
      begin

         if Pos('Command : ', MsgParts[1]) > 0
         then
            begin
               MCode.Text := StrAfter('Command : ', MsgParts[1]);
               Exit;
            end;

         if MsgParts[1] = 'You can now let go of the button'
         then
            begin

               TThread.Synchronize(TThread.CurrentThread,
               procedure
               begin
                  MStatus.Lines.Add('');
                  MStatus.Lines.Add('To complete learning, click Continue and single press the button you want to learn');
                  SendMessage(MStatus.Handle, WM_VSCROLL, SB_BOTTOM, 0);
               end);

               BContinue.Enabled := True;

            end
         else
            TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
               MStatus.Lines.Add('');
               MStatus.Lines.Add(MsgParts[1]);
               SendMessage(MStatus.Handle, WM_VSCROLL, SB_BOTTOM, 0);
            end);

      end;

   MsgParts.DisposeOf;

end;

end.





