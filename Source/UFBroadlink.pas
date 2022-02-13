unit UFBroadlink;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Comp.DataSet, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn, AdvFileNameEdit, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  AdvUtil, AdvObj, BaseGrid, AdvGrid, Vcl.Imaging.pngimage, IniFiles, Vcl.Menus,
  AdvMenus, AdvMenuStylers;

type
  TFBroadlink = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    AFEDB: TAdvFileNameEdit;
    Label2: TLabel;
    FDCBL: TFDConnection;
    TDevice: TFDTable;
    QGetCode: TFDQuery;
    TButtons: TFDTable;
    CBDevice: TComboBox;
    Label3: TLabel;
    BAddDevice: TButton;
    QGetDeviceID: TFDQuery;
    QGetButtons: TFDQuery;
    BAddButton: TButton;
    QGetButtonID: TFDQuery;
    SGButtons: TAdvStringGrid;
    SGDevice: TAdvStringGrid;
    BDelDevice: TButton;
    BDelButton: TButton;
    BSendComm: TButton;
    TBLDevice: TFDTable;
    QGetBLDevByName: TFDQuery;
    TMacros: TFDTable;
    TMMMacroButton: TFDTable;
    BMacros: TButton;
    QGetMacroID: TFDQuery;
    QGetMacroButtons: TFDQuery;
    QGetMacroByName: TFDQuery;
    QDelMacroButtons: TFDQuery;
    QDelMacroButton: TFDQuery;
    INewDB: TImage;
    QCreateDB: TFDQuery;
    QGetDeviceByName: TFDQuery;
    QDellButton: TFDQuery;
    AdvMainMenu1: TAdvMainMenu;
    Settings: TMenuItem;
    RunOnWinStartMI: TMenuItem;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    SetUpBLMI: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BAddDeviceClick(Sender: TObject);
    procedure BAddButtonClick(Sender: TObject);
    procedure SGDeviceClick(Sender: TObject);
    procedure BSendCommClick(Sender: TObject);
    procedure OnCDMessage(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure BDelButtonClick(Sender: TObject);
    procedure BDelDeviceClick(Sender: TObject);
    procedure BMacrosClick(Sender: TObject);
    procedure INewDBClick(Sender: TObject);
    procedure RunOnWinStartMIClick(Sender: TObject);
    procedure SetUpBLMIClick(Sender: TObject);
    procedure AFEDBChange(Sender: TObject);
  private
    procedure ExecOut(const Text: string);
    procedure LoadButtons;
    procedure LoadDevices;
    procedure OpenDB;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBroadlink: TFBroadlink;
   FileLines: TStringList;
   CurrOperation: string;
   AppDir: String;

implementation

{$R *.dfm}

uses JclSysUtils, JclStrings, UFAddDevice, UFAddButton, UFBLDev, UFMacros, UFSetUpBl, Registry;

procedure TFBroadlink.OpenDB;
begin

   if FileExists(AFEDB.Text)
   then
      begin

         FDCBL.Connected := False;
         FDCBL.Params.Database := AFEDB.Text;
         FDCBL.Connected := True;

         TDevice.Active := True;
         TButtons.Active := True;
         TBLDevice.Active := True;
         TMacros.Active := True;
         TMMMacroButton.Active := True;

         LoadDevices;
         SGDevice.Row := 1;
         LoadButtons;

         With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
            WriteString('Settings', 'DBFile', AFEDB.Text);

      end;

end;

procedure TFBroadlink.AFEDBChange(Sender: TObject);
begin
   OpenDB;
end;

procedure TFBroadlink.BAddButtonClick(Sender: TObject);
begin

   if FAddButton.ShowModal = mrOK
   then
      begin

         TButtons.Insert;

         QGetButtonID.Close;
         QGetButtonID.Open;

         if QGetButtonID.FieldByName('NewID').IsNull
         then
            TButtons.FieldByName('ID').AsInteger := 1
         else
            TButtons.FieldByName('ID').AsInteger := QGetButtonID.FieldByName('NewID').AsInteger;

         TButtons.FieldByName('name').AsString := FAddButton.LEButtonName.Text;

         TDevice.IndexName := 'DevNameIdx';
         TDevice.FindKey([SGDevice.Cells[0, SGDevice.Row]]);
         TButtons.FieldByName('DeviceID').AsInteger := TDevice.FieldByName('ID').AsInteger;

         TButtons.FieldByName('Code').AsString := FAddButton.MCode.Text;

         TButtons.Post;

         LoadButtons;

      end;

end;

procedure TFBroadlink.BAddDeviceClick(Sender: TObject);
begin

   if FAddDevice.ShowModal = mrOK
   then
      begin

         TDevice.Insert;
         QGetDeviceID.Close;
         QGetDeviceID.Open;

         if QGetDeviceID.FieldByName('NewID').IsNull
         then
            TDevice.FieldByName('ID').AsInteger := 1
         else
            TDevice.FieldByName('ID').AsInteger := QGetDeviceID.FieldByName('NewID').AsInteger;

         TDevice.FieldByName('name').AsString := FAddDevice.LEDevName.Text;
         TDevice.FieldByName('IR').AsBoolean :=  FAddDevice.RadioGroup1.ItemIndex = 0;

         TDevice.Post;

         LoadDevices;

      end;

end;

procedure TFBroadlink.BDelButtonClick(Sender: TObject);
begin

   if MessageDlg('Delete ' + SGButtons.Cells[0, SGButtons.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      begin

         QDellButton.ParamByName('DevName').AsString := SGDevice.Cells[0, SGDevice.Row];
         QDellButton.ParamByName('ButtName').AsString := SGButtons.Cells[0, SGButtons.Row];
         QDellButton.ExecSQL;

         LoadButtons;

      end;

end;

procedure TFBroadlink.BDelDeviceClick(Sender: TObject);
begin

   if MessageDlg('Delete ' + SGDevice.Cells[0, FBroadlink.SGDevice.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      begin

         TDevice.IndexName := 'DevNameIdx';

         if TDevice.FindKey([SGDevice.Cells[0, SGDevice.Row]])
         then
            begin
               TDevice.Delete;
               LoadDevices;
            end;

//         TDevice.IndexName := 'PrimaryIdx';
      end;
end;

procedure TFBroadlink.BMacrosClick(Sender: TObject);
begin
   FMacros.ShowModal;
end;

procedure TFBroadlink.BSendCommClick(Sender: TObject);
begin

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   FBroadlink.TDevice.IndexName := 'DevNameIdx';
   FBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

   FileLines.Add('python broadlink_cli2 --device "' + StrAfter(' : ', FBroadlink.CBDevice.Text) + '" --send "' + SGButtons.Cells[1, SGButtons.Row] + '"');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

procedure TFBroadlink.ExecOut(const Text: string);

var
   OutLines: TStringList;
   i: Integer;

begin

   if CurrOperation = 'Discovery'
   then
      begin

         OutLines := TStringList.Create;
         OutLines.Text := Text;

         for i := 0 to OutLines.Count - 1 do
            begin

               if Pos('Device : ', OutLines[i]) > 0
               then
                  begin

                     if not TBLDevice.FindKey([StrAfter('Device : ', OutLines[i])])
                     then
                        begin

                           if not Assigned(FBLDevName)
                           then
                              FBLDevName := TFBLDevName.Create(nil);

                           FBLDevName.EBLDevice.Text := StrAfter('Device : ', OutLines[i]);
                           FBLDevName.ShowModal;

                           TBLDevice.Insert;
                           TBLDevice.FieldByName('DevStr').AsString := StrAfter('Device : ', OutLines[i]);
                           TBLDevice.FieldByName('Name').AsString := FBLDevName.LEBLDevName.Text;
                           TBLDevice.Post;

                        end;

                     CBDevice.Items.Add(TBLDevice.FieldByName('Name').AsString + ' : ' + StrAfter('Device : ', OutLines[i]));

                  end;

            end;

         if CBDevice.Items.Count > 0
         then
            CBDevice.ItemIndex := 0;

         OutLines.DisposeOf;

      end;

end;

procedure TFBroadlink.FormCreate(Sender: TObject);

var
   Reg: TRegistry;
   TheKey: string;

begin

   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   reg.Access:= KEY_READ;

   TheKey := 'Software\Microsoft\Windows\CurrentVersion\Run';

   if Reg.OpenKey(TheKey, False)
   then
      if Reg.ReadString('WinBroadlink') <> ''
      then
         RunOnWinstartMI.Checked := True;

   Reg.CloseKey;
   Reg.Free;

   AppDir := ExtractFileDir(Application.ExeName);

   With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
      AFEDB.Text := ReadString('Settings', 'DBFile', AppDir + '\Broadlink.db');

   if FileExists(AFEDB.Text)
   then
      OpenDB
   else
      begin

         AFEDB.Text := AppDir + '\Broadlink.db';

         if FileExists(AFEDB.Text)
         then
            OpenDB
         else
            INewDBClick(INewDB);

      end;

   SGDevice.ColWidths[1] := 50;

   SGButtons.ColWidths[0] := 200;

   CBDevice.Items.Clear;

   CurrOperation := 'Discovery';

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');
   FileLines.Add('python broadlink_discovery2 --timeout 5 --dst-ip 192.168.0.255');
   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

   if CBDevice.Items.Count = 0
   then
      ShowMessage('No Broadlink devicea found. Are you connected to the same WiFi network as your device(s)? If you have not setup your device, you need to do it, using the mobile app.'
                  + 'After setting up the device you have to unlock the device in the mobile app. Tap on your device. Then tap the menu in right upper corner and choose "Property"');

end;

procedure TFBroadlink.INewDBClick(Sender: TObject);
begin

   if FileExists(AFEDB.Text)
   then
      begin
         ShowMessage('Database file allready exists');
         AFEDB.SetFocus;
         Exit;
      end;

   if FDCBL.Connected
   then
      FDCBL.Connected := False;

   FDCBL.Params.Database := AFEDB.Text;
   FDCBL.Connected := True;
   QCreateDB.ExecSQL;
   FDCBL.Connected := False;

   OpenDB;

end;

procedure TFBroadlink.SetUpBLMIClick(Sender: TObject);
begin
   FSetUpBL.ShowModal;
end;

procedure TFBroadlink.SGDeviceClick(Sender: TObject);
begin

   LoadButtons;

end;

procedure RunOnWinStart(ApTitle, ApPathFile: string; RunOnce: Boolean);
var
   Reg: TRegistry;
   TheKey: string;

begin

   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   reg.Access:= KEY_WRITE;

   TheKey := 'Software\Microsoft\Windows\CurrentVersion\Run';

   if RunOnce
   then
      TheKey := TheKey + 'Once';

   Reg.OpenKey(TheKey, True);
   Reg.WriteString(ApTitle, ApPathFile);
   Reg.CloseKey;
   Reg.Free;

end;

procedure RemoveFromRunKey(ApTitle: string);

var
   Reg: TRegistry;
   TheKey: string;

begin

   Reg := TRegistry.Create;

   Reg.RootKey := HKEY_LOCAL_MACHINE;
   reg.Access:= KEY_WRITE;
   TheKey := 'Software\Microsoft\Windows\CurrentVersion\Run';

   if not Reg.OpenKey(TheKey, False)
   then
      ShowMessage('Key not found')
   else
      begin

         if Reg.DeleteValue(ApTitle)
         then
            ShowMessage('Removed: ' + ApTitle)
         else
            ShowMessage('Not found: ' + ApTitle);

      end;

   Reg.CloseKey;
   Reg.Free;

end;

procedure TFBroadlink.LoadButtons;
begin

   SGButtons.RowCount := 2;
   SGButtons.ClearRows(1, 1);

   QGetButtons.Close;
   QGetButtons.ParamByName('DevName').AsString := SGDevice.Cells[0, SGDevice.Row];
   QGetButtons.Open;

   while not QGetButtons.Eof do
      begin

         if SGButtons.Cells[0, SGButtons.RowCount - 1] <> ''
         then
            SGButtons.RowCount := SGButtons.RowCount + 1;

         SGButtons.Cells[0, SGButtons.RowCount - 1] := QGetButtons.FieldByName('Name').AsString;
         SGButtons.Cells[1, SGButtons.RowCount - 1] := QGetButtons.FieldByName('Code').AsString;

         QGetButtons.Next;

      end;

end;

procedure TFBroadlink.LoadDevices;
begin

   TDevice.IndexName := 'DevNameIdx';

   TDevice.First;

   SGDevice.RowCount := 2;
   SGDevice.ClearRows(1, 1);

   SGButtons.RowCount := 2;
   SGButtons.ClearRows(1, 1);

   while not TDevice.Eof do
      begin

         if SGDevice.Cells[0, SGDevice.RowCount - 1] <> ''
         then
            SGDevice.RowCount := SGDevice.RowCount + 1;

         SGDevice.Cells[0, SGDevice.RowCount - 1] := TDevice.FieldByName('Name').AsString;

         if TDevice.FieldByName('IR').AsBoolean
         then
            SGDevice.Cells[1, SGDevice.RowCount - 1] := 'IR'
         else
            SGDevice.Cells[1, SGDevice.RowCount - 1] := 'RF';

         TDevice.Next;

      end;

   if SGDevice.Cells[0, 1] <> ''
   then
      begin
         SGDevice.Row := 1;
         LoadButtons;
      end;

end;

procedure TFBroadlink.OnCDMessage(var Msg: TWMCopyData);

var
   InPut: string;

begin

   InPut := PChar(Msg.CopyDataStruct.lpData);

   if Input = 'SendCommand'
   then
      begin

         FileLines := TStringList.Create;
         FileLines.LoadFromFile(AppDir + '\SendCommand.txt');

         QGetBLDevByName.Close;
         QGetBLDevByName.ParamByName('Name').AsString := FileLines[0];
         QGetBLDevByName.Open;

         if QGetBLDevByName.IsEmpty
         then
            begin
               ShowMessage('Broadlink device ' + FileLines[0] + ' not found');
               Exit;
            end;

         QGetCode.Close;
         QGetCode.ParamByName('DevName').AsString := FileLines[1];
         QGetCode.ParamByName('ButtName').AsString := FileLines[2];
         QGetCode.Open;

         if QGetCode.IsEmpty
         then
            begin
               ShowMessage('Command ' + FileLines[1] + '/' + FileLines[2] + ' not found');
               Exit;
            end;

         FileLines.DisposeOf;

         FileLines := TStringList.Create;
         FileLines.Add(ExtractFileDrive(AppDir));
         FileLines.Add('cd "' + AppDir + '"');

         FileLines.Add('python broadlink_cli2 --device "' + QGetBLDevByName.FieldByName('DevStr').AsString + '" --send "' + QGetCode.FieldByName('Code').AsString + '"');

         FileLines.SaveToFile(AppDir + '\Commands.bat');

         Execute(AppDir + '\Commands.bat', ExecOut);

         FileLines.DisposeOf;

      end;

   if Input = 'SendMacro'
   then
      begin

         FileLines := TStringList.Create;
         FileLines.LoadFromFile(AppDir + '\SendCommand.txt');

         QGetBLDevByName.Close;
         QGetBLDevByName.ParamByName('Name').AsString := FileLines[0];
         QGetBLDevByName.Open;

         if QGetBLDevByName.IsEmpty
         then
            begin
               ShowMessage('Broadlink device ' + FileLines[0] + ' not found');
               Exit;
            end;

         QGetMacroButtons.Close;
         QGetMacroButtons.ParamByName('MacroName').AsString := FileLines[1];
         QGetMacroButtons.Open;

         FileLines.DisposeOf;

         while not QGetMacroButtons.Eof do
            begin

               FileLines := TStringList.Create;
               FileLines.Add(ExtractFileDrive(AppDir));
               FileLines.Add('cd "' + AppDir + '"');

               FileLines.Add('python broadlink_cli2 --device "' + QGetBLDevByName.FieldByName('DevStr').AsString + '" --send "' + QGetMacroButtons.FieldByName('Code').AsString + '"');

               FileLines.SaveToFile(AppDir + '\Commands.bat');

               Execute(AppDir + '\Commands.bat', ExecOut);

               FileLines.DisposeOf;

               Sleep(QGetMacroButtons.FieldByName('wait').AsInteger);

               QGetMacroButtons.Next;

            end;

      end;

end;

procedure TFBroadlink.RunOnWinStartMIClick(Sender: TObject);
begin

   if RunOnWinStartMI.Checked
   then
      RunOnWinStart('WinBroadlink', Application.exeName, False)
   else
      RemoveFromRunKey('WinBroadlink');

end;

end.





