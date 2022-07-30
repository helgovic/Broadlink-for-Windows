unit UFAddButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Threading, System.IOUtils, FireDAC.Stan.Param, Data.DB;

type
  TFAddButton = class(TForm)
    LEButtonName: TLabeledEdit;
    MStatus: TMemo;
    BContinue: TButton;
    MCode: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    BAddButtonSave: TButton;
    BAddDeviceClose: TButton;
    BStart: TButton;
    BAddButtTest: TButton;
    procedure BContinueClick(Sender: TObject);
    procedure BAddButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnCDMessage(var Message: TMessage); message WM_COPYDATA;
    procedure BStartClick(Sender: TObject);
    procedure BAddDeviceCloseClick(Sender: TObject);
    procedure BAddButtTestClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecOut(const Text: string);
  public
    { Public declarations }
     State: string;
  end;

var
  FAddButton: TFAddButton;

implementation

uses
   UFBroadlink, JclSysUtils, JclStrings, UDMBroadlink;

{$R *.dfm}

procedure TFAddButton.BAddButtonSaveClick(Sender: TObject);
begin

   if Trim(LEButtonName.Text) = ''
   then
      begin
         ShowMessage('Please enter button name');
         LEButtonName.SetFocus;
         Exit;
      end;

   if State = 'Edit'
   then
      begin

         DMBroadlink.QFindButtonOther.Close;
         DMBroadlink.QFindButtonOther.ParamByName('DevName').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
         DMBroadlink.QFindButtonOther.ParamByName('ButtName').AsString := Trim(LEButtonName.Text);
         DMBroadlink.QFindButtonOther.ParamByName('ButtID').AsInteger := DMBroadlink.TButtons.FieldByName('ID').AsInteger;
         DMBroadlink.QFindButtonOther.Open;

         if not DMBroadlink.QFindButtonOther.IsEmpty
         then
            begin
               ShowMessage('Button ' + Trim(LEButtonName.Text) + ' already exists');
               LEButtonName.SetFocus;
               Exit;
            end;

      end
   else
      begin

         DMBroadlink.QGetCode.Close;
         DMBroadlink.QGetCode.ParamByName('DevName').AsString := FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row];
         DMBroadlink.QGetCode.ParamByName('ButtName').AsString := Trim(LEButtonName.Text);
         DMBroadlink.QGetCode.Open;

         if not DMBroadlink.QGetCode.IsEmpty
         then
            begin
               ShowMessage('Button ' + Trim(LEButtonName.Text) + ' already exists');
               LEButtonName.SetFocus;
               Exit;
            end;

      end;

   if Trim(MCode.Text) = ''
   then
      begin
         ShowMessage('Please start learning');
         Exit;
      end;

   if State = 'Add'
   then
      begin

         DMBroadlink.TButtons.Insert;

         DMBroadlink.QGetButtonID.Close;
         DMBroadlink.QGetButtonID.Open;

         if DMBroadlink.QGetButtonID.FieldByName('NewID').IsNull
         then
             DMBroadlink.TButtons.FieldByName('ID').AsInteger := 1
         else
             DMBroadlink.TButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetButtonID.FieldByName('NewID').AsInteger;

         DMBroadlink.TButtons.FieldByName('name').AsString := FAddButton.LEButtonName.Text;

         DMBroadlink.TDevice.IndexName := 'DevNameIdx';
         DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);
         DMBroadlink.TButtons.FieldByName('DeviceID').AsInteger := DMBroadlink.TDevice.FieldByName('ID').AsInteger;

         DMBroadlink.TButtons.FieldByName('Code').AsString := FAddButton.MCode.Text;

         DMBroadlink.TButtons.Post;

         MStatus.Text := '';
         MCode.Text := '';
         LEButtonName.Text := '';

      end
   else
      begin

         DMBroadlink.TButtons.Edit;

         DMBroadlink.TButtons.FieldByName('name').AsString := FAddButton.LEButtonName.Text;

         DMBroadlink.TDevice.IndexName := 'DevNameIdx';
         DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);
         DMBroadlink.TButtons.FieldByName('DeviceID').AsInteger := DMBroadlink.TDevice.FieldByName('ID').AsInteger;

         DMBroadlink.TButtons.FieldByName('Code').AsString := FAddButton.MCode.Text;

         DMBroadlink.TButtons.Post;

      end;

   BAddButtonSave.Enabled := False;
   BAddButtTest.Enabled := False;

   ShowMessage('Button ' + LEButtonName.Text + ' saved.');

end;

procedure TFAddButton.BAddButtTestClick(Sender: TObject);
begin

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   DMBroadlink.TDevice.IndexName := 'DevNameIdx';
   DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

   DMBroadlink.QGetBLDevByName.Close;
   DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := StrBefore(' : ', FBroadlink.CBDevice.Text);
   DMBroadlink.QGetBLDevByName.Open;

   FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + MCode.Text + '"');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

procedure TFAddButton.BAddDeviceCloseClick(Sender: TObject);
begin
   Self.Close;
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

      DMBroadlink.TDevice.IndexName := 'DevNameIdx';
      DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

      DMBroadlink.QGetBLDevByName.Close;
      DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := StrBefore(' : ', FBroadlink.CBDevice.Text);
      DMBroadlink.QGetBLDevByName.Open;

      if DMBroadlink.TDevice.FieldByName('IR').AsBoolean
      then
         FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --learn')
      else
         FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --rfscanlearn');

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

procedure TFAddButton.FormShow(Sender: TObject);
begin

   MStatus.Text := '';
   MCode.Text := '';

   if State = 'Add'
   then
      LEButtonName.Text := '';

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

               TThread.Synchronize(TThread.CurrentThread,
               procedure
               begin
                  MCode.Text := StrAfter('Command : ', MsgParts[1]);
                  SendMessage(MCode.Handle, WM_VSCROLL, SB_BOTTOM, 0);
               end);

               BAddButtonSave.Enabled := True;
               BAddButtTest.Enabled := True;

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









