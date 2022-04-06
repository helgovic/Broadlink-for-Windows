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
  AdvMenus, AdvMenuStylers, Uni, MemDS, DBAccess, MySQLUniProvider, System.UITypes,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, System.DateUtils,
  Vcl.ComCtrls;

type
  TFBroadlink = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    AFEDB: TAdvFileNameEdit;
    Label2: TLabel;
    CBDevice: TComboBox;
    Label3: TLabel;
    BAddDevice: TButton;
    BAddButton: TButton;
    SGButtons: TAdvStringGrid;
    SGDevice: TAdvStringGrid;
    BDelDevice: TButton;
    BDelButton: TButton;
    BSendComm: TButton;
    BMacros: TButton;
    INewDB: TImage;
    AdvMainMenu1: TAdvMainMenu;
    Settings: TMenuItem;
    RunOnWinStartMI: TMenuItem;
    AdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    SetUpBLMI: TMenuItem;
    ShowInstructionsMI: TMenuItem;
    ShareDevices: TMenuItem;
    BEditDevice: TButton;
    BEditButton: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    BTimers: TButton;
    MILocations: TMenuItem;
    MIDevScan: TMenuItem;
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
    procedure ShowInstructionsMIClick(Sender: TObject);
    procedure ShareDevicesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BEditDeviceClick(Sender: TObject);
    procedure BEditButtonClick(Sender: TObject);
    procedure BTimersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MILocationsClick(Sender: TObject);
    procedure MIDevScanClick(Sender: TObject);
  private
    procedure ExecOut(const Text: string);
    procedure LoadButtons;
    procedure LoadDevices;
    procedure OpenDB;
    procedure ScanForDevices;
    procedure LoadBLRemotes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBroadlink: TFBroadlink;
   FileLines: TStringList;
   CurrOperation: string;
   AppDir: String;

function GetSunUpDown(Up: Boolean; Date: TDateTime; Latt, Long: String): TDateTime;

implementation

{$R *.dfm}

uses JclSysUtils, JclStrings, UFAddDevice, UFAddButton, UFBLDev, UFMacros, UFSetUpBl, Registry, UFInstructions,
     UDMBroadlink, UFShareInfo, UFAddLightButton, UFTimers, UFLocations, GpTimezone;

var
   StartScan: Boolean = True;

function GetSunUpDown(Up: Boolean; Date: TDateTime; Latt, Long: String): TDateTime;

var
   jValue:TJSONValue;

begin

   FBroadlink.RESTRequest1.Params.ParameterByName('lat').Value := latt;
   FBroadlink.RESTRequest1.Params.ParameterByName('lng').Value := Long;
   FBroadlink.RESTRequest1.Params.ParameterByName('date').Value := FormatDateTime('yyyy-mm-dd', Date);
   FBroadlink.RESTRequest1.Execute;

   jValue:= FBroadlink.RESTResponse1.JSONValue;

   if Up
   then
      Result := ISO8601ToDate(jValue.GetValue<string>('results.sunrise'))
   else
      Result := ISO8601ToDate(jValue.GetValue<string>('results.sunset'));

   Result := UTCToLocalTime(Result);

end;

procedure TFBroadlink.OpenDB;
begin

   if FileExists(AFEDB.Text)
   then
      begin

         DMBroadlink.FDCBL.Connected := False;
         DMBroadlink.FDCBL.Params.Database := AFEDB.Text;
         DMBroadlink.FDCBL.Connected := True;

         DMBroadlink.TDevice.Active := True;
         DMBroadlink.TButtons.Active := True;
         DMBroadlink.TBLDevice.Active := True;
         DMBroadlink.TMacros.Active := True;
         DMBroadlink.TMMMacroButton.Active := True;
         DMBroadlink.TManufacturers.Active := True;
         DMBroadlink.TBLButtons.Active := True;
         DMBroadlink.TTimers.Active := True;
         DMBroadlink.TLocations.Active := True;

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

   if SGDevice.Cells[3, SGDevice.Row] = 'WiFi Bulb'
   then
      begin
         FAddLightButton.State := 'Add';
         FAddLightButton.ShowModal;
      end
   else
      if (SGDevice.Cells[3, SGDevice.Row] = 'IR') or
         (SGDevice.Cells[3, SGDevice.Row] = 'RF')
      then
         begin
            FAddButton.State := 'Add';
            FAddButton.ShowModal;
         end;

   LoadButtons;

end;

procedure TFBroadlink.BAddDeviceClick(Sender: TObject);
begin

   FAddDevice.State := 'Add';

   if FAddDevice.ShowModal = mrOK
   then
      begin

         DMBroadlink.QGetManufacturerByName.Close;
         DMBroadlink.QGetManufacturerByName.ParamByName('Name').AsString := Trim(FAddDevice.ACBManufacturer.Text);
         DMBroadlink.QGetManufacturerByName.Open;

         if DMBroadlink.QGetManufacturerByName.IsEmpty
         then
            begin

               DMBroadlink.TManufacturers.Insert;

               DMBroadlink.QGetManufacturerID.Close;
               DMBroadlink.QGetManufacturerID.Open;

               if DMBroadlink.QGetManufacturerID.FieldByName('NewID').IsNull
               then
                  DMBroadlink.TManufacturers.FieldByName('ID').AsInteger := 1
               else
                  DMBroadlink.TManufacturers.FieldByName('ID').AsInteger := DMBroadlink.QGetManufacturerID.FieldByName('NewID').AsInteger;

               DMBroadlink.TManufacturers.FieldByName('Name').AsString := AnsiUpperCase(Trim(FAddDevice.ACBManufacturer.Text));

               DMBroadlink.TManufacturers.Post;

            end;

         DMBroadlink.QCommonGetDevice.Close;
         DMBroadlink.QCommonGetDevice.ParamByName('ManufacturerName').AsString := AnsiUpperCase(Trim(FAddDevice.ACBManufacturer.Text));
         DMBroadlink.QCommonGetDevice.ParamByName('ModelName').AsString := AnsiUpperCase(Trim(FAddDevice.ACBModelName.Text));
         DMBroadlink.QCommonGetDevice.Open;

         DMBroadlink.TDevice.Insert;

         DMBroadlink.QGetDeviceID.Close;
         DMBroadlink.QGetDeviceID.Open;

         if DMBroadlink.QGetDeviceID.FieldByName('NewID').IsNull
         then
            DMBroadlink.TDevice.FieldByName('ID').AsInteger := 1
         else
            DMBroadlink.TDevice.FieldByName('ID').AsInteger := DMBroadlink.QGetDeviceID.FieldByName('NewID').AsInteger;

         DMBroadlink.TDevice.FieldByName('ManufacturerID').AsInteger := DMBroadlink.TManufacturers.FieldByName('ID').AsInteger;
         DMBroadlink.TDevice.FieldByName('ModelName').AsString := AnsiUpperCase(Trim(FAddDevice.ACBModelName.Text));
         DMBroadlink.TDevice.FieldByName('Name').AsString := Trim(FAddDevice.LEDevName.Text);

         if not DMBroadlink.QCommonGetDevice.IsEmpty
         then
            DMBroadlink.TDevice.FieldByName('IR').AsBoolean := DMBroadlink.QCommonGetDevice.FieldByName('IR').AsBoolean
         else
            DMBroadlink.TDevice.FieldByName('IR').AsBoolean := FAddDevice.RadioGroup1.ItemIndex = 0;

         DMBroadlink.TDevice.FieldByName('Share').AsBoolean := FAddDevice.ACBShare.Checked;

         DMBroadlink.TDevice.Post;

         DMBroadlink.QCommonGetDeviceButtons.Close;
         DMBroadlink.QCommonGetDeviceButtons.ParamByName('ManufacturerName').AsString :=Trim(FAddDevice.ACBManufacturer.Text);
         DMBroadlink.QCommonGetDeviceButtons.ParamByName('ModelName').AsString := Trim(FAddDevice.ACBModelName.Text);
         DMBroadlink.QCommonGetDeviceButtons.Open;

         if not DMBroadlink.QCommonGetDeviceButtons.IsEmpty
         then
            while not DMBroadlink.QCommonGetDeviceButtons.Eof do
               begin

                  DMBroadlink.TButtons.Insert;

                  DMBroadlink.QGetButtonID.Close;
                  DMBroadlink.QGetButtonID.Open;

                  if DMBroadlink.QGetButtonID.FieldByName('NewID').IsNull
                  then
                      DMBroadlink.TButtons.FieldByName('ID').AsInteger := 1
                  else
                      DMBroadlink.TButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetButtonID.FieldByName('NewID').AsInteger;

                  DMBroadlink.TButtons.FieldByName('name').AsString := DMBroadlink.QCommonGetDeviceButtons.FieldByName('Name').AsString;
                  DMBroadlink.TButtons.FieldByName('DeviceID').AsInteger := DMBroadlink.TDevice.FieldByName('ID').AsInteger;
                  DMBroadlink.TButtons.FieldByName('Code').AsString := DMBroadlink.QCommonGetDeviceButtons.FieldByName('Code').AsString;

                  DMBroadlink.TButtons.Post;

                  DMBroadlink.QCommonGetDeviceButtons.Next;

               end;

         LoadDevices;

      end;

end;

procedure TFBroadlink.BDelButtonClick(Sender: TObject);
begin

   if (SGDevice.Cells[3, SGDevice.Row] <> 'IR') and
      (SGDevice.Cells[3, SGDevice.Row] <> 'RF')
   then
      begin

         DMBroadlink.QGetBLButton.Close;
         DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGDevice.Cells[0, SGDevice.Row];
         DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGButtons.Cells[0, SGButtons.Row];
         DMBroadlink.QGetBLButton.Open;

         if DMBroadlink.QGetBLButton.FieldByName('Protected').AsBoolean
         then
            begin
               ShowMessage('You cannot delete this button');
               Exit;
            end;

         if MessageDlg('Delete ' + SGButtons.Cells[0, SGButtons.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
         then
            begin

               DMBroadlink.TBLButtons.FindKey([DMBroadlink.QGetBLButton.FieldByName('ID').AsInteger]);
               DMBroadlink.TBLButtons.Delete;

               LoadButtons;

            end;

         Exit;

      end;

   if MessageDlg('Delete ' + SGButtons.Cells[0, SGButtons.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      begin

         DMBroadlink.QDellButton.ParamByName('DevName').AsString := SGDevice.Cells[0, SGDevice.Row];
         DMBroadlink.QDellButton.ParamByName('ButtName').AsString := SGButtons.Cells[0, SGButtons.Row];
         DMBroadlink.QDellButton.ExecSQL;

         LoadButtons;

      end;

end;

procedure TFBroadlink.BDelDeviceClick(Sender: TObject);
begin

   if MessageDlg('Delete ' + SGDevice.Cells[0, SGDevice.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      begin

         if (SGDevice.Cells[3, SGDevice.Row] = 'IR') or
            (SGDevice.Cells[3, SGDevice.Row] = 'RF')
         then
            begin

               DMBroadlink.TDevice.IndexName := 'DevNameIdx';

               if DMBroadlink.TDevice.FindKey([SGDevice.Cells[0, SGDevice.Row]])
               then
                  begin
                     DMBroadlink.TDevice.Delete;
                     LoadDevices;
                  end;

            end
         else
            begin

               DMBroadlink.QGetBLDevByName.Close;
               DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := SGDevice.Cells[0, SGDevice.Row];
               DMBroadlink.QGetBLDevByName.Open;

               if DMBroadlink.TBLDevice.FindKey([DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString])
               then
                  begin
                     DMBroadlink.TBLDevice.Delete;
                     LoadDevices;
                  end;

            end;

      end;

end;

procedure TFBroadlink.BEditButtonClick(Sender: TObject);
begin

   if (SGDevice.Cells[3, SGDevice.Row] <> 'IR') and
      (SGDevice.Cells[3, SGDevice.Row] <> 'RF')
   then
      begin

         DMBroadlink.QGetBLButton.Close;
         DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := SGDevice.Cells[0, SGDevice.Row];
         DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := SGButtons.Cells[0, SGButtons.Row];
         DMBroadlink.QGetBLButton.Open;

         if DMBroadlink.QGetBLButton.FieldByName('Protected').AsBoolean
         then
            begin
               ShowMessage('You cannot edit this button');
               Exit;
            end;

         if SGDevice.Cells[3, SGDevice.Row] = 'WiFi Bulb'
         then
            begin

               FAddLightButton.State := 'Edit';
               FAddLightButton.AELBName.Text := SGButtons.Cells[0, SGButtons.Row];

               FAddLightButton.ShowModal;

               Exit;

            end;

      end;

   DMBroadlink.QGetCode.Close;
   DMBroadlink.QGetCode.ParamByName('DevName').AsString := SGDevice.Cells[0, SGDevice.Row];
   DMBroadlink.QGetCode.ParamByName('ButtName').AsString := SGButtons.Cells[0, SGButtons.Row];;
   DMBroadlink.QGetCode.Open;

   DMBroadlink.TButtons.FindKey([DMBroadlink.QGetCode.FieldByName('ID').AsInteger]);

   FAddButton.State := 'Edit';
   FAddButton.LEButtonName.Text := DMBroadlink.TButtons.FieldByName('Name').AsString;

   FAddButton.ShowModal;

   LoadButtons;

end;

procedure TFBroadlink.BEditDeviceClick(Sender: TObject);
begin

   if (SGDevice.Cells[3, SGDevice.Row] = 'IR') or
      (SGDevice.Cells[3, SGDevice.Row] = 'RF')
   then
      begin

         FAddDevice.State := 'Edit';

         if FAddDevice.ShowModal = mrOK
         then
            begin

               DMBroadlink.TDevice.Edit;

               DMBroadlink.TDevice.FieldByName('Name').AsString := Trim(FAddDevice.LEDevName.Text);
               DMBroadlink.TDevice.FieldByName('IR').AsBoolean := FAddDevice.RadioGroup1.ItemIndex = 0;
               DMBroadlink.TDevice.FieldByName('Share').AsBoolean := FAddDevice.ACBShare.Checked;

               DMBroadlink.TDevice.Post;

               LoadDevices;

            end;

      end
   else
      begin
         FBLDevName.State := 'Edit';
         FBLDevName.ShowModal;
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

   if (FBroadlink.SGDevice.Cells[3, FBroadlink.SGDevice.Row] = 'RF') or
      (FBroadlink.SGDevice.Cells[3, FBroadlink.SGDevice.Row] = 'IR')
   then
      begin

         DMBroadlink.TDevice.IndexName := 'DevNameIdx';
         DMBroadlink.TDevice.FindKey([FBroadlink.SGDevice.Cells[0, FBroadlink.SGDevice.Row]]);

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := StrBefore(' : ', FBroadlink.CBDevice.Text);
         DMBroadlink.QGetBLDevByName.Open;

         FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + SGButtons.Cells[1, SGButtons.Row] + '"')

      end
   else
      begin

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := SGDevice.Cells[0, FBroadlink.SGDevice.Row];
         DMBroadlink.QGetBLDevByName.Open;

         if DMBroadlink.QGetBLDevByName.FieldByName('Type').AsString  = 'WiFi Bulb'
         then
            FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --setlightstate "' + SGButtons.Cells[1, SGButtons.Row] + '"')
         else
            if DMBroadlink.QGetBLDevByName.FieldByName('Type').AsString  = 'WiFi Switch'
            then
               FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" ' + SGButtons.Cells[1, SGButtons.Row]);

      end;

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

procedure TFBroadlink.BTimersClick(Sender: TObject);
begin
   FTimers.ShowModal;
end;

procedure TFBroadlink.Button1Click(Sender: TObject);
var
  jValue:TJSONValue;
  TmpStr: String;

begin
  RESTRequest1.Execute;
  jValue:=RESTResponse1.JSONValue;
  TmpStr:= jValue.GetValue<string>('results.sunrise');

end;

procedure TFBroadlink.ExecOut(const Text: string);

var
   OutLines: TStringList;
   i: Integer;
   TmpStr: String;
   NewDev, ReloadDev: Boolean;

begin

   if CurrOperation = 'Discovery'
   then
      begin

         OutLines := TStringList.Create;
         OutLines.Text := Text;

         ReloadDev := False;

         for i := 0 to OutLines.Count - 1 do
            begin

               if Pos('Manufacturer : ', OutLines[i]) > 0
               then
                  begin

                     if not Assigned(FBLDevName)
                     then
                        FBLDevName := TFBLDevName.Create(nil);

                     FBLDevName.LEBLManufacturer.Text := StrBefore('DeviceModel : ', StrAfter('Manufacturer : ', OutLines[i]));
                     FBLDevName.LEBLModel.Text := StrBefore('DevType : ', StrAfter('DeviceModel : ', OutLines[i]));
                     FBLDevName.LEBLHexType.Text := StrBefore('Host : ', StrAfter('DevType : ', OutLines[i]));
                     FBLDevName.LEBLIPAdr.Text := StrBefore('Mac : ', StrAfter('Host : ', OutLines[i]));
                     FBLDevName.LEBLMacAdr.Text := StrAfter('Mac : ', OutLines[i]);

                     TmpStr := AnsiUpperCase(FBLDevName.LEBLModel.Text);

                     if TmpStr.StartsWith('RM')
                     then
                        FBLDevName.LEBLType.Text := 'Universal WiFi Remote';

                     if (TmpStr.StartsWith('SP')) or
                        (TmpStr.StartsWith('MP1')) or
                        (TmpStr.StartsWith('BG1'))
                     then
                        FBLDevName.LEBLType.Text := 'WiFi Switch';

                     if TmpStr.StartsWith('LB')
                     then
                        FBLDevName.LEBLType.Text := 'WiFi Bulb';

                     NewDev := False;

                     if not DMBroadlink.TBLDevice.FindKey([FBLDevName.LEBLMacAdr.Text])
                     then
                        if not StartScan
                        then
                           begin

                              NewDev := True;
                              ReloadDev := True;

                              if FBLDevName.ShowModal = mrOK
                              then
                                 begin

                                    DMBroadlink.TBLDevice.Insert;
                                    DMBroadlink.TBLDevice.FieldByName('Mac').AsString := FBLDevName.LEBLMacAdr.Text;
                                    DMBroadlink.TBLDevice.FieldByName('Name').AsString := FBLDevName.LEBLDevName.Text;
                                    DMBroadlink.TBLDevice.FieldByName('Model').AsString := FBLDevName.LEBLModel.Text;
                                    DMBroadlink.TBLDevice.FieldByName('IP').AsString := FBLDevName.LEBLIPAdr.Text;
                                    DMBroadlink.TBLDevice.FieldByName('HexType').AsString := FBLDevName.LEBLHexType.Text;
                                    DMBroadlink.TBLDevice.FieldByName('Type').AsString := FBLDevName.LEBLType.Text;
                                    DMBroadlink.TBLDevice.FieldByName('Manufacturer').AsString := FBLDevName.LEBLManufacturer.Text;
                                    DMBroadlink.TBLDevice.Post;

                                 end;

                           end
                        else
                     else
                        begin

                           DMBroadlink.TBLDevice.Edit;
                           DMBroadlink.TBLDevice.FieldByName('Model').AsString := FBLDevName.LEBLModel.Text;
                           DMBroadlink.TBLDevice.FieldByName('IP').AsString := FBLDevName.LEBLIPAdr.Text;
                           DMBroadlink.TBLDevice.FieldByName('HexType').AsString := FBLDevName.LEBLHexType.Text;
                           DMBroadlink.TBLDevice.FieldByName('Type').AsString := FBLDevName.LEBLType.Text;
                           DMBroadlink.TBLDevice.FieldByName('Manufacturer').AsString := FBLDevName.LEBLManufacturer.Text;
                           DMBroadlink.TBLDevice.Post;

                        end;

                     if NewDev
                     then
                        begin

                           if DMBroadlink.TBLDevice.FieldByName('Type').AsString = 'WiFi Bulb'
                           then
                              begin

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Power On';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Power Off';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=0';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Red';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 colormode=0 red=255 green=0 blue=0';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Green';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 colormode=0 red=0 green=255 blue=0';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Blue';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 colormode=0 red=0 green=0 blue=255';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Brightness 1';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 brightness=10';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Brightness 2';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 brightness=30';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Brightness 3';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 brightness=60';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Brightness 4';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := 'pwr=1 brightness=100';
                                 DMBroadlink.TBLButtons.Post;

                              end;

                           if DMBroadlink.TBLDevice.FieldByName('Type').AsString = 'WiFi Switch'
                           then
                              begin

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Power On';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := '--turnon';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Power Off';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := '--turnoff';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Power Toggle';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := '--switch';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Nightlight On';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := '--turnnlon';
                                 DMBroadlink.TBLButtons.Post;

                                 DMBroadlink.TBLButtons.Insert;

                                 DMBroadlink.QGetBLButtonID.Close;
                                 DMBroadlink.QGetBLButtonID.Open;

                                 if DMBroadlink.QGetBLButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TBLButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetBLButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TBLButtons.FieldByName('DeviceMac').AsString := DMBroadlink.TBLDevice.FieldByName('Mac').AsString;
                                 DMBroadlink.TBLButtons.FieldByName('Protected').AsBoolean := True;
                                 DMBroadlink.TBLButtons.FieldByName('Name').AsString := 'Nightlight Off';
                                 DMBroadlink.TBLButtons.FieldByName('Command').AsString := '--turnnloff';
                                 DMBroadlink.TBLButtons.Post;

                              end;

                           LoadDevices;

                        end;
                  end;

            end;

         if ReloadDev
         then
            LoadDevices;

         LoadBLRemotes;

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

   DMBroadlink.UCCommonDB.Connected := True;

   DMBroadlink.TCommonManufacturers.Active := True;
   DMBroadlink.TCommonDevice.Active := True;
   DMBroadlink.TCommonButtons.Active := True;

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

   SGDevice.ColWidths[1] := 130;
   SGDevice.ColWidths[2] := 130;
   SGDevice.ColWidths[3] := 100;
   SGDevice.ColWidths[4] := 50;

   SGButtons.ColWidths[0] := 130;

   With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
      if ReadBool('Settings', 'ShowInst', True)
      then
         begin

            if not Assigned(FInstructions)
            then
               FInstructions := TFInstructions.Create(nil);

            FInstructions.ShowModal;

         end;

   if DMBroadlink.TBLDevice.RecordCount = 0
   then
      if MessageDlg('There are no BroadLink devices defined. Do you want to scan for devices?', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes
      then
         StartScan := False;

   ScanForDevices;

   if DMBroadlink.TBLDevice.RecordCount = 0
   then
      ShowMessage('No Broadlink devicea found. Are you connected to the same WiFi network as your device(s)? If you have not setup your device, you need to do it, using the mobile app.'
                  + 'After setting up the device you have to unlock the device in the mobile app. Tap on your device. Then tap the menu in right upper corner and choose "Property"');

end;

procedure TFBroadlink.FormDestroy(Sender: TObject);
begin

   DMBroadlink.UCCommonDB.Connected := False;
   DMBroadlink.FDCBL.Connected := False;

end;

procedure TFBroadlink.LoadBLRemotes;
begin

   CBDevice.Items.Clear;

   DMBroadlink.QGetBLRemotes.Close;
   DMBroadlink.QGetBLRemotes.Open;

   while not DMBroadlink.QGetBLRemotes.Eof do
      begin

         CBDevice.Items.Add(DMBroadlink.QGetBLRemotes.FieldByName('Name').AsString + ' : ' + DMBroadlink.QGetBLRemotes.FieldByName('Model').AsString + ' Universal WiFi Remote');
         DMBroadlink.QGetBLRemotes.Next;

      end;

   if CBDevice.Items.Count > 0
   then
      CBDevice.ItemIndex := 0;

end;

procedure TFBroadlink.INewDBClick(Sender: TObject);
begin

   if FileExists(AFEDB.Text)
   then
      begin
         ShowMessage('Database file already exists');
         AFEDB.SetFocus;
         Exit;
      end;

   if DMBroadlink.FDCBL.Connected
   then
      DMBroadlink.FDCBL.Connected := False;

   DMBroadlink.FDCBL.Params.Database := AFEDB.Text;
   DMBroadlink.FDCBL.Connected := True;
   DMBroadlink.QCreateDB.ExecSQL;
   DMBroadlink.FDCBL.Connected := False;

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

procedure TFBroadlink.ShareDevicesClick(Sender: TObject);

var
   CommonManID, CommonDevID: Int64;
   ShowDev, Run: Boolean;

begin

   Run := True;

   With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
      ShowDev := ReadBool('Settings', 'ShowDevShare', True);

   if ShowDev
   then
      if FShareInfo.ShowModal <> mrOK
      then
         Run := False;

   if Run
   then
      begin

         DMBroadlink.TDevice.First;

         while not DMBroadlink.TDevice.Eof do
            begin

               if not DMBroadlink.TDevice.FieldByName('Share').AsBoolean
               then
                  begin
                     DMBroadlink.TDevice.Next;
                     Continue;
                  end;

               DMBroadlink.TManufacturers.FindKey([DMBroadlink.TDevice.FieldByName('ManufacturerID').AsInteger]);

               DMBroadlink.QGetCommonManufacturerByName.Close;
               DMBroadlink.QGetCommonManufacturerByName.ParamByName('ManufacturerName').AsString := DMBroadlink.TManufacturers.FieldByName('Name').AsString;
               DMBroadlink.QGetCommonManufacturerByName.Open;

               if DMBroadlink.QGetCommonManufacturerByName.IsEmpty
               then
                  begin

                     DMBroadlink.TCommonManufacturers.Insert;

                     DMBroadlink.QCommonGetManufacturerID.Close;
                     DMBroadlink.QCommonGetManufacturerID.Open;

                     if DMBroadlink.QCommonGetManufacturerID.FieldByName('NewID').IsNull
                     then
                         DMBroadlink.TCommonManufacturers.FieldByName('ID').AsInteger := 1
                     else
                         DMBroadlink.TCommonManufacturers.FieldByName('ID').AsInteger := DMBroadlink.QCommonGetManufacturerID.FieldByName('NewID').AsInteger;

                     DMBroadlink.TCommonManufacturers.FieldByName('Name').AsString := DMBroadlink.TManufacturers.FieldByName('Name').AsString;

                     DMBroadlink.TCommonManufacturers.Post;

                     CommonManID := DMBroadlink.TCommonManufacturers.FieldByName('ID').AsInteger;

                  end
               else
                  CommonManID := DMBroadlink.QGetCommonManufacturerByName.FieldByName('ID').AsInteger;

               DMBroadlink.QCommonGetDevice.Close;
               DMBroadlink.QCommonGetDevice.ParamByName('ManufacturerName').AsString := DMBroadlink.TManufacturers.FieldByName('Name').AsString;
               DMBroadlink.QCommonGetDevice.ParamByName('ModelName').AsString := DMBroadlink.TDevice.FieldByName('ModelName').AsString;
               DMBroadlink.QCommonGetDevice.Open;

               if DMBroadlink.QCommonGetDevice.IsEmpty
               then
                  begin

                     DMBroadlink.TCommonDevice.Insert;

                     DMBroadlink.QCommonGetDeviceID.Close;
                     DMBroadlink.QCommonGetDeviceID.Open;

                     if DMBroadlink.QCommonGetDeviceID.FieldByName('NewID').IsNull
                     then
                         DMBroadlink.TCommonDevice.FieldByName('ID').AsInteger := 1
                     else
                         DMBroadlink.TCommonDevice.FieldByName('ID').AsInteger := DMBroadlink.QCommonGetDeviceID.FieldByName('NewID').AsInteger;

                     DMBroadlink.TCommonDevice.FieldByName('ModelName').AsString := DMBroadlink.TDevice.FieldByName('ModelName').AsString;
                     DMBroadlink.TCommonDevice.FieldByName('IR').AsBoolean := DMBroadlink.TDevice.FieldByName('IR').AsBoolean;
                     DMBroadlink.TCommonDevice.FieldByName('ManufacturerID').AsInteger := CommonManID;

                     DMBroadlink.TCommonDevice.Post;

                     CommonDevID := DMBroadlink.TCommonDevice.FieldByName('ID').AsInteger;

                  end
               else
                  CommonDevID := DMBroadlink.QCommonGetDevice.FieldByName('ID').AsInteger;

               DMBroadlink.QGetDeviceButtons.Close;
               DMBroadlink.QGetDeviceButtons.ParamByName('DeviceID').AsInteger := DMBroadlink.TDevice.FieldByName('ID').AsInteger;
               DMBroadlink.QGetDeviceButtons.Open;

               while not DMBroadlink.QGetDeviceButtons.Eof do
                  begin

                     DMBroadlink.QGetCommonButtonByCode.Close;
                     DMBroadlink.QGetCommonButtonByCode.ParamByName('DeviceID').AsInteger := CommonDevID;
                     DMBroadlink.QGetCommonButtonByCode.ParamByName('Code').AsString := DMBroadlink.QGetDeviceButtons.FieldByName('Code').AsString;
                     DMBroadlink.QGetCommonButtonByCode.Open;

                     if DMBroadlink.QGetCommonButtonByCode.IsEmpty
                     then
                        begin

                           DMBroadlink.QGetCommonDeviceButton.Close;
                           DMBroadlink.QGetCommonDeviceButton.ParamByName('DeviceID').AsInteger := CommonDevID;
                           DMBroadlink.QGetCommonDeviceButton.ParamByName('ButtonName').AsString := DMBroadlink.QGetDeviceButtons.FieldByName('Name').AsString;
                           DMBroadlink.QGetCommonDeviceButton.Open;

                           if DMBroadlink.QGetCommonDeviceButton.IsEmpty
                           then
                              begin

                                 DMBroadlink.TCommonButtons.Insert;

                                 DMBroadlink.QGetCommonButtonID.Close;
                                 DMBroadlink.QGetCommonButtonID.Open;

                                 if DMBroadlink.QGetCommonButtonID.FieldByName('NewID').IsNull
                                 then
                                     DMBroadlink.TCommonButtons.FieldByName('ID').AsInteger := 1
                                 else
                                     DMBroadlink.TCommonButtons.FieldByName('ID').AsInteger := DMBroadlink.QGetCommonButtonID.FieldByName('NewID').AsInteger;

                                 DMBroadlink.TCommonButtons.FieldByName('Name').AsString := DMBroadlink.QGetDeviceButtons.FieldByName('Name').AsString;
                                 DMBroadlink.TCommonButtons.FieldByName('DeviceID').AsInteger := CommonDevID;
                                 DMBroadlink.TCommonButtons.FieldByName('Code').AsString := DMBroadlink.QGetDeviceButtons.FieldByName('Code').AsString;

                                 DMBroadlink.TCommonButtons.Post;

                              end;

                        end;

                     DMBroadlink.QGetDeviceButtons.Next;

                  end;

               DMBroadlink.TDevice.Next;

            end;

         ShowMessage('Data uploaded successfully');

      end;

end;

procedure TFBroadlink.ShowInstructionsMIClick(Sender: TObject);
begin
   FInstructions.CBNoShow.Visible := False;
   FInstructions.ShowModal;
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

   if (SGDevice.Cells[3, SGDevice.Row] = 'IR') or
      (SGDevice.Cells[3, SGDevice.Row] = 'RF')
   then
      begin

         DMBroadlink.QGetButtons.Close;
         DMBroadlink.QGetButtons.ParamByName('DevName').AsString := SGDevice.Cells[0, SGDevice.Row];
         DMBroadlink.QGetButtons.Open;

         while not DMBroadlink.QGetButtons.Eof do
            begin

               if SGButtons.Cells[0, SGButtons.RowCount - 1] <> ''
               then
                  SGButtons.RowCount := SGButtons.RowCount + 1;

               SGButtons.Cells[0, SGButtons.RowCount - 1] := DMBroadlink.QGetButtons.FieldByName('Name').AsString;
               SGButtons.Cells[1, SGButtons.RowCount - 1] := DMBroadlink.QGetButtons.FieldByName('Code').AsString;

               DMBroadlink.QGetButtons.Next;

            end;

      end
   else
//      if SGDevice.Cells[3, SGDevice.Row] = 'WiFi Bulb'
//      then
         begin

            DMBroadlink.QGetBLButtons.Close;
            DMBroadlink.QGetBLButtons.ParamByName('DeviceName').AsString := SGDevice.Cells[0, SGDevice.Row];
            DMBroadlink.QGetBLButtons.Open;

            while not DMBroadlink.QGetBLButtons.Eof do
               begin

                  if SGButtons.Cells[0, SGButtons.RowCount - 1] <> ''
                  then
                     SGButtons.RowCount := SGButtons.RowCount + 1;

                  SGButtons.Cells[0, SGButtons.RowCount - 1] := DMBroadlink.QGetBLButtons.FieldByName('Name').AsString;
                  SGButtons.Cells[1, SGButtons.RowCount - 1] := DMBroadlink.QGetBLButtons.FieldByName('Command').AsString;

                  DMBroadlink.QGetBLButtons.Next;

               end;

         end;

end;

procedure TFBroadlink.LoadDevices;
begin

   SGDevice.RowCount := 2;
   SGDevice.ClearRows(1, 1);

   SGButtons.RowCount := 2;
   SGButtons.ClearRows(1, 1);

   DMBroadlink.QGetDevices.Close;
   DMBroadlink.QGetDevices.Open;

   while not DMBroadlink.QGetDevices.Eof do
      begin

         if SGDevice.Cells[0, SGDevice.RowCount - 1] <> ''
         then
            SGDevice.RowCount := SGDevice.RowCount + 1;

         SGDevice.Cells[0, SGDevice.RowCount - 1] := DMBroadlink.QGetDevices.FieldByName('DeviceName').AsString;
         SGDevice.Cells[1, SGDevice.RowCount - 1] := DMBroadlink.QGetDevices.FieldByName('ManufacturerName').AsString;
         SGDevice.Cells[2, SGDevice.RowCount - 1] := DMBroadlink.QGetDevices.FieldByName('DevModel').AsString;
         SGDevice.Cells[3, SGDevice.RowCount - 1] := DMBroadlink.QGetDevices.FieldByName('Type').AsString;

         if DMBroadlink.QGetDevices.FieldByName('Share').AsBoolean
         then
            SGDevice.Cells[4, SGDevice.RowCount - 1] := 'Yes'
         else
            SGDevice.Cells[4, SGDevice.RowCount - 1] := 'No';

         DMBroadlink.QGetDevices.Next;

      end;

   if SGDevice.Cells[0, 1] <> ''
   then
      begin
         SGDevice.Row := 1;
         LoadButtons;
      end;

end;

procedure TFBroadlink.MIDevScanClick(Sender: TObject);
begin
   ScanForDevices;
end;

procedure TFBroadlink.ScanForDevices;
begin

   CurrOperation := 'Discovery';

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');
   FileLines.Add('python broadlink_discovery2 --timeout 10 --dst-ip 192.168.0.255');
   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

procedure TFBroadlink.MILocationsClick(Sender: TObject);
begin
   FLocations.ShowModal;
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

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FileLines[0];
         DMBroadlink.QGetBLDevByName.Open;

         if DMBroadlink.QGetBLDevByName.IsEmpty
         then
            begin
               ShowMessage('Broadlink device ' + FileLines[0] + ' not found');
               Exit;
            end;

         DMBroadlink.QGetCode.Close;
         DMBroadlink.QGetCode.ParamByName('DevName').AsString := FileLines[1];
         DMBroadlink.QGetCode.ParamByName('ButtName').AsString := FileLines[2];
         DMBroadlink.QGetCode.Open;

         if DMBroadlink.QGetCode.IsEmpty
         then
            begin
               ShowMessage('Command ' + FileLines[1] + '/' + FileLines[2] + ' not found');
               Exit;
            end;

         FileLines.DisposeOf;

         FileLines := TStringList.Create;
         FileLines.Add(ExtractFileDrive(AppDir));
         FileLines.Add('cd "' + AppDir + '"');

         FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --send "' + DMBroadlink.QGetCode.FieldByName('Code').AsString + '"');

         FileLines.SaveToFile(AppDir + '\Commands.bat');

         Execute(AppDir + '\Commands.bat', ExecOut);

         FileLines.DisposeOf;

      end;

   if Input = 'SendMacro'
   then
      begin

         FileLines := TStringList.Create;
         FileLines.LoadFromFile(AppDir + '\SendCommand.txt');

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FileLines[0];
         DMBroadlink.QGetBLDevByName.Open;

         if DMBroadlink.QGetBLDevByName.IsEmpty
         then
            begin
               ShowMessage('Broadlink device ' + FileLines[0] + ' not found');
               Exit;
            end;

         DMBroadlink.QGetMacroButtons.Close;
         DMBroadlink.QGetMacroButtons.ParamByName('MacroName').AsString := FileLines[1];
         DMBroadlink.QGetMacroButtons.Open;

         FileLines.DisposeOf;

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

      end;

   if Input = 'SendBLCommand'
   then
      begin

         FileLines := TStringList.Create;
         FileLines.LoadFromFile(AppDir + '\SendCommand.txt');

         DMBroadlink.QGetBLDevByName.Close;
         DMBroadlink.QGetBLDevByName.ParamByName('Name').AsString := FileLines[0];
         DMBroadlink.QGetBLDevByName.Open;

         if DMBroadlink.QGetBLDevByName.IsEmpty
         then
            begin
               ShowMessage('Broadlink device ' + FileLines[0] + ' not found');
               Exit;
            end;

         DMBroadlink.QGetBLButton.Close;
         DMBroadlink.QGetBLButton.ParamByName('DeviceName').AsString := FileLines[0];
         DMBroadlink.QGetBLButton.ParamByName('ButtName').AsString := FileLines[1];
         DMBroadlink.QGetBLButton.Open;

         FileLines := TStringList.Create;
         FileLines.Add(ExtractFileDrive(AppDir));
         FileLines.Add('cd "' + AppDir + '"');

         if DMBroadlink.QGetBLDevByName.FieldByName('Type').AsString  = 'WiFi Bulb'
         then
            FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" --setlightstate "' + DMBroadlink.QGetBLButton.FieldByName('Command').AsString + '"')
         else
            if DMBroadlink.QGetBLDevByName.FieldByName('Type').AsString  = 'WiFi Switch'
            then
               FileLines.Add('python broadlink_cli2 --device "' + DMBroadlink.QGetBLDevByName.FieldByName('HexType').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('IP').AsString + ' ' + DMBroadlink.QGetBLDevByName.FieldByName('Mac').AsString + '" ' + DMBroadlink.QGetBLButton.FieldByName('Command').AsString);

         FileLines.SaveToFile(AppDir + '\Commands.bat');

         Execute(AppDir + '\Commands.bat', ExecOut);

         FileLines.DisposeOf;

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














