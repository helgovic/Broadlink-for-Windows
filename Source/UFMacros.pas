unit UFMacros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvUtil,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvEdit, FireDAC.Stan.Param, System.UITypes, Data.DB;

type

  TFMacros = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    LBMacros: TListBox;
    SGMacroButtons: TAdvStringGrid;
    BNewMacro: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BAddMacroButton: TButton;
    AEWait: TAdvEdit;
    BSaveMacro: TButton;
    BClose: TButton;
    BDeleteMacro: TButton;
    BDeleteButton: TButton;
    BTestMacro: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BNewMacroClick(Sender: TObject);
    procedure SGMacroButtonsClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure BSaveMacroClick(Sender: TObject);
    procedure BDeleteMacroClick(Sender: TObject);
    procedure BDeleteButtonClick(Sender: TObject);
    procedure BAddMacroButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AEWaitChange(Sender: TObject);
    procedure SGMacroButtonsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SGMacroButtonsOleDragOver(Sender: TObject; ARow, ACol: Integer;
      var Allow: Boolean);
    procedure SGMacroButtonsOleDrop(Sender: TObject; ARow, ACol: Integer;
      data: string; var Allow: Boolean);
    procedure BTestMacroClick(Sender: TObject);
    procedure LBMacrosClick(Sender: TObject);
  private
    procedure LoadMacros;
    procedure LoadButtons;
    procedure ExecOut(const Text: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMacros: TFMacros;

implementation

uses
   UFBroadlink, UFNewMacro, UFAddMacroButton, JclSysUtils, JCLStrings, UDMBroadlink, UFTimers;

{$R *.dfm}

procedure TFMacros.LBMacrosClick(Sender: TObject);
begin

   if LBMacros.ItemIndex >= 0
   then
      LoadButtons;

end;

procedure TFMacros.LoadButtons;
begin

   DMBroadlink.QGetMacroButtons.Close;
   DMBroadlink.QGetMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
   DMBroadlink.QGetMacroButtons.Open;

   SGMacroButtons.RowCount := 2;
   SGMacroButtons.ClearRows(1, 1);

   while not DMBroadlink.QGetMacroButtons.Eof do
      begin

         if SGMacroButtons.Cells[1, SGMacroButtons.RowCount - 1] <> ''
         then
            SGMacroButtons.RowCount := SGMacroButtons.RowCount + 1;

         SGMacroButtons.Cells[1, SGMacroButtons.RowCount - 1] := DMBroadlink.QGetMacroButtons.FieldByName('DeviceName').AsString;
         SGMacroButtons.Cells[2, SGMacroButtons.RowCount - 1] := DMBroadlink.QGetMacroButtons.FieldByName('Type').AsString;
         SGMacroButtons.Cells[3, SGMacroButtons.RowCount - 1] := DMBroadlink.QGetMacroButtons.FieldByName('ButtonName').AsString;
         SGMacroButtons.Cells[4, SGMacroButtons.RowCount - 1] := DMBroadlink.QGetMacroButtons.FieldByName('wait').AsString;

         DMBroadlink.QGetMacroButtons.Next;

      end;

   if SGMacroButtons.Cells[1, 1] <> ''
   then
      begin
         SGMacroButtons.Row := 1;
         SGMacroButtonsClick(SGMacroButtons);
      end;

end;

procedure TFMacros.LoadMacros;
begin

   LBMacros.Clear;

   SGMacroButtons.RowCount := 2;
   SGMacroButtons.ClearRows(1, 1);

   DMBroadlink.TMacros.First;

   while not DMBroadlink.TMacros.Eof do
      begin

         LBMacros.Items.Add(DMBroadlink.TMacros.FieldByName('Name').AsString);
         DMBroadlink.TMacros.Next;

      end;

   if LBMacros.Count > 0
   then
      begin
         LBMacros.ItemIndex := 0;
         LoadButtons;
      end;

end;

procedure TFMacros.SGMacroButtonsClick(Sender: TObject);
begin

   if (SGMacroButtons.Row > 0) and
      (SGMacroButtons.Cells[1, SGMacroButtons.Row] <> '')
   then
      AEWait.Text := SGMacroButtons.Cells[4, SGMacroButtons.Row];

end;

procedure TFMacros.SGMacroButtonsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TFMacros.SGMacroButtonsOleDragOver(Sender: TObject; ARow,
  ACol: Integer; var Allow: Boolean);
begin
   Allow := ARow > 0;
end;

procedure TFMacros.SGMacroButtonsOleDrop(Sender: TObject; ARow, ACol: Integer;
  data: string; var Allow: Boolean);
begin
   Allow := True;
end;

procedure TFMacros.AEWaitChange(Sender: TObject);
begin

   if (SGMacroButtons.Row > 0) and
      (SGMacroButtons.Cells[1, SGMacroButtons.Row] <> '')
   then
      SGMacroButtons.Cells[4, SGMacroButtons.Row] := AEWait.Text;

end;

procedure TFMacros.BAddMacroButtonClick(Sender: TObject);
begin
   FAddMacroButton.ShowModal;
end;

procedure TFMacros.BCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFMacros.BDeleteButtonClick(Sender: TObject);
begin

   if MessageDlg('Delete ' + SGMacroButtons.Cells[1, SGMacroButtons.Row] + '/' + SGMacroButtons.Cells[2, SGMacroButtons.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      SGMacroButtons.RemoveRows(SGMacroButtons.Row, 1);

end;

procedure TFMacros.BDeleteMacroClick(Sender: TObject);
begin

   DMBroadlink.QGetMacroRestr.Close;
   DMBroadlink.QGetMacroRestr.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
   DMBroadlink.QGetMacroRestr.Open;

   if not DMBroadlink.QGetMacroRestr.IsEmpty
   then
      begin
         ShowMessage('Cannot delete Macro ' + LBMacros.Items[LBMacros.ItemIndex] + ' is used in ' + DMBroadlink.QGetMacroRestr.RecordCount.ToString + ' Timers.');
         Exit;
      end;

   if MessageDlg('Delete ' + LBMacros.Items[LBMacros.ItemIndex] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      TThread.CreateAnonymousThread(
      procedure
      begin

         PauseTimers := True;

         while not TimersFinished do
            Sleep(100);

         DMBroadlink.QGetMacroByName.Close;
         DMBroadlink.QGetMacroByName.ParamByName('Name').AsString := FMacros.LBMacros.Items[FMacros.LBMacros.ItemIndex];
         DMBroadlink.QGetMacroByName.Open;

         DMBroadlink.QDelMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
         DMBroadlink.QDelMacroButtons.ExecSQL;

         DMBroadlink.TMacros.FindKey([DMBroadlink.QGetMacroByName.FieldByName('ID').AsInteger]);
         DMBroadlink.TMacros.Delete;
         LoadMacros;

         PauseTimers := False;
         FTimers.TCheckTimers.Enabled := True;

      end).Start;

end;

procedure TFMacros.BNewMacroClick(Sender: TObject);
begin

   if FNewMacro.ShowModal = mrOk
   then
      begin

         DMBroadlink.TMacros.Insert;

         DMBroadlink.QGetMacroID.Close;
         DMBroadlink.QGetMacroID.Open;

         if DMBroadlink.QGetMacroID.FieldByName('NewID').IsNull
         then
            DMBroadlink.TMacros.FieldByName('ID').AsInteger := 1
         else
            DMBroadlink.TMacros.FieldByName('ID').AsInteger := DMBroadlink.QGetMacroID.FieldByName('NewID').AsInteger;

         DMBroadlink.TMacros.FieldByName('name').AsString := FNewMacro.LEMacroName.Text;

         DMBroadlink.TMacros.Post;

         LoadMacros;

      end;

end;

procedure TFMacros.BSaveMacroClick(Sender: TObject);

var
   i: Integer;

begin

   DMBroadlink.QDelMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
   DMBroadlink.QDelMacroButtons.ExecSQL;

   DMBroadlink.QGetMacroByName.Close;
   DMBroadlink.QGetMacroByName.ParamByName('Name').AsString := FMacros.LBMacros.Items[FMacros.LBMacros.ItemIndex];
   DMBroadlink.QGetMacroByName.Open;

   for i := 1 to SGMacroButtons.RowCount - 1 do
      begin

         if SGMacroButtons.Cells[1, i] <> ''
         then
            begin

               if (SGMacroButtons.Cells[2, i] = 'IR') or
                  (SGMacroButtons.Cells[2, i] = 'RF')
               then
                  begin

                     DMBroadlink.QGetCode.Close;
                     DMBroadlink.QGetCode.ParamByName('DevName').AsString := SGMacroButtons.Cells[1, i];
                     DMBroadlink.QGetCode.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
                     DMBroadlink.QGetCode.Open;

                     DMBroadlink.TMMMacroButton.Insert;
                     DMBroadlink.TMMMacroButton.FieldByName('MacroID').AsInteger := DMBroadlink.QGetMacroByName.FieldByName('ID').AsInteger;
                     DMBroadlink.TMMMacroButton.FieldByName('ButtonID').AsInteger := DMBroadlink.QGetCode.FieldByName('ID').AsInteger;
                     DMBroadlink.TMMMacroButton.FieldByName('wait').AsInteger := StrToInt(SGMacroButtons.Cells[4, i]);
                     DMBroadlink.TMMMacroButton.FieldByName('seq').AsInteger := i;
                     DMBroadlink.TMMMacroButton.FieldByName('Type').AsString := SGMacroButtons.Cells[2, i];
                     DMBroadlink.TMMMacroButton.Post;

                  end
               else
//                  if SGMacroButtons.Cells[1, i] = 'WiFi Bulb'
//                  then
                     begin

                        DMBroadlink.QGetBLButton.Close;
                        DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGMacroButtons.Cells[1, i];
                        DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
                        DMBroadlink.QGetBLButton.Open;

                        DMBroadlink.TMMMacroButton.Insert;
                        DMBroadlink.TMMMacroButton.FieldByName('MacroID').AsInteger := DMBroadlink.QGetMacroByName.FieldByName('ID').AsInteger;
                        DMBroadlink.TMMMacroButton.FieldByName('ButtonID').AsInteger := DMBroadlink.QGetBLButton.FieldByName('ID').AsInteger;
                        DMBroadlink.TMMMacroButton.FieldByName('wait').AsInteger := StrToInt(SGMacroButtons.Cells[4, i]);
                        DMBroadlink.TMMMacroButton.FieldByName('seq').AsInteger := i;
                        DMBroadlink.TMMMacroButton.FieldByName('Type').AsString := SGMacroButtons.Cells[2, i];
                        DMBroadlink.TMMMacroButton.Post;

                     end;
//                  else
//                     if SGMacroButtons.Cells[2, i] = 'WiFi Switch'
//                     then
//                        begin
//
//                           DMBroadlink.QGetBLButton.Close;
//                           DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGMacroButtons.Cells[1, i];
//                           DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
//                           DMBroadlink.QGetBLButton.Open;
//
//                           DMBroadlink.TMMMacroButton.Insert;
//                           DMBroadlink.TMMMacroButton.FieldByName('MacroID').AsInteger := DMBroadlink.QGetMacroByName.FieldByName('ID').AsInteger;
//                           DMBroadlink.TMMMacroButton.FieldByName('ButtonID').AsInteger := DMBroadlink.QGetBLButton.FieldByName('ID').AsInteger;
//                           DMBroadlink.TMMMacroButton.FieldByName('wait').AsInteger := StrToInt(SGMacroButtons.Cells[4, i]);
//                           DMBroadlink.TMMMacroButton.FieldByName('seq').AsInteger := i;
//                           DMBroadlink.TMMMacroButton.FieldByName('Type').AsString := SGMacroButtons.Cells[2, i];
//                           DMBroadlink.TMMMacroButton.Post;
//
//                        end;

            end;

      end;

end;

procedure TFMacros.BTestMacroClick(Sender: TObject);

var
   i: Integer;

begin

   for i := 1 to SGMacroButtons.RowCount - 1 do
      begin

         if (SGMacroButtons.Cells[2, i] = 'IR') or
            (SGMacroButtons.Cells[2, i] = 'RF')
         then
            begin

               DMBroadlink.QGetCode.Close;
               DMBroadlink.QGetCode.ParamByName('DevName').AsString := SGMacroButtons.Cells[1, i];
               DMBroadlink.QGetCode.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
               DMBroadlink.QGetCode.Open;

               FileLines := TStringList.Create;
               FileLines.Add(ExtractFileDrive(AppDir));
               FileLines.Add('cd "' + AppDir + '"');

               DMBroadlink.QGetBLDevByName.Close;
               DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := StrBefore(' : ', FBroadlink.CBDevice.Text);
               DMBroadlink.QGetBLDevByName.Open;

               FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + DMBroadlink.QGetCode.FieldByName('Code').AsString + '"');

               FileLines.SaveToFile(AppDir + '\Commands.bat');

               Execute(AppDir + '\Commands.bat', ExecOut);

               FileLines.DisposeOf;

               Sleep(StrToInt(SGMacroButtons.Cells[4, i]));

            end
         else
            if SGMacroButtons.Cells[2, i] = 'WiFi Bulb'
            then
               begin

                  DMBroadlink.QGetBLButton.Close;
                  DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGMacroButtons.Cells[1, i];
                  DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
                  DMBroadlink.QGetBLButton.Open;

                  DMBroadlink.QGetBLDevByName.Close;
                  DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := SGMacroButtons.Cells[1, i];
                  DMBroadlink.QGetBLDevByName.Open;

                  FileLines := TStringList.Create;
                  FileLines.Add(ExtractFileDrive(AppDir));
                  FileLines.Add('cd "' + AppDir + '"');

                  FileLines := TStringList.Create;
                  FileLines.Add(ExtractFileDrive(AppDir));
                  FileLines.Add('cd "' + AppDir + '"');

                  FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --setlightstate "' +  DMBroadlink.QGetBLButton.FieldByName('Command').AsString + '"');

                  FileLines.SaveToFile(AppDir + '\Commands.bat');

                  Execute(AppDir + '\Commands.bat', ExecOut);

                  FileLines.DisposeOf;

                  Sleep(StrToInt(SGMacroButtons.Cells[4, i]));

               end
            else
               if SGMacroButtons.Cells[2, i] = 'WiFi Switch'
               then
                  begin

                     DMBroadlink.QGetBLButton.Close;
                     DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGMacroButtons.Cells[1, i];
                     DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGMacroButtons.Cells[3, i];
                     DMBroadlink.QGetBLButton.Open;

                     DMBroadlink.QGetBLDevByName.Close;
                     DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := SGMacroButtons.Cells[1, i];
                     DMBroadlink.QGetBLDevByName.Open;

                     FileLines := TStringList.Create;
                     FileLines.Add(ExtractFileDrive(AppDir));
                     FileLines.Add('cd "' + AppDir + '"');

                     FileLines := TStringList.Create;
                     FileLines.Add(ExtractFileDrive(AppDir));
                     FileLines.Add('cd "' + AppDir + '"');

                     FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" ' +  DMBroadlink.QGetBLButton.FieldByName('Command').AsString);

                     FileLines.SaveToFile(AppDir + '\Commands.bat');

                     Execute(AppDir + '\Commands.bat', ExecOut);

                     FileLines.DisposeOf;

                     Sleep(StrToInt(SGMacroButtons.Cells[4, i]));

                  end;


      end;

end;

procedure TFMacros.ExecOut(const Text: string);
begin

end;

procedure TFMacros.FormCreate(Sender: TObject);
begin

   SGMacroButtons.ColWidths[0] := 20;
   SGMacroButtons.ColWidths[1] := (SGMacroButtons.Width - 205) div 3;
   SGMacroButtons.ColWidths[2] := (SGMacroButtons.Width - 205) div 3;
   SGMacroButtons.ColWidths[3] := (SGMacroButtons.Width - 205) div 3;
   SGMacroButtons.ColWidths[4] := 125;

end;

procedure TFMacros.FormShow(Sender: TObject);
begin

   LoadMacros;

end;

end.






