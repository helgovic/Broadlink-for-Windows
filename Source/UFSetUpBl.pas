unit UFSetUpBl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.Mask,
  Vcl.ExtCtrls, AdvCombo, Vcl.Imaging.pngimage;

type
  TFSetUpBL = class(TForm)
    Label1: TLabel;
    LESSid: TLabeledEdit;
    AENetwPW: TAdvEdit;
    BSetUp: TButton;
    BSetUpBLCancel: TButton;
    MOutPut: TMemo;
    ACBSec: TAdvComboBox;
    BDiscover: TButton;
    IViewPassword: TImage;
    procedure BSetUpClick(Sender: TObject);
    procedure BSetUpBLCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDiscoverClick(Sender: TObject);
    procedure IViewPasswordClick(Sender: TObject);
  private
    procedure ExecOut(const Text: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSetUpBL: TFSetUpBL;

implementation

uses
   UFBroadlink, JCLSysUtils, JCLStrings, UFBLDev, UDMBroadlink;

{$R *.dfm}

var
   CurrOperation: String;

procedure TFSetUpBL.ExecOut(const Text: string);
//
//var
//   OutLines: TStringList;
//   i: integer;
//
begin

//   if CurrOperation = 'Discovery'
//   then
//      begin
//
//         MOutPut.Text :=  MOutPut.Text + Text;
//         SendMessage(MOutPut.Handle, WM_VSCROLL, SB_BOTTOM, 0);
//
//         OutLines := TStringList.Create;
//         OutLines.Text := Text;
//
//         for i := 0 to OutLines.Count - 1 do
//            begin
//
//               if Pos('Device : ', OutLines[i]) > 0
//               then
//                  begin
//
//                     if not DMBroadlink.TBLDevice.FindKey([StrAfter('Device : ', OutLines[i])])
//                     then
//                        begin
//
//                           if not Assigned(FBLDevName)
//                           then
//                              FBLDevName := TFBLDevName.Create(nil);
//
//                           FBLDevName.EBLDevice.Text := StrAfter('Device : ', OutLines[i]);
//                           FBLDevName.ShowModal;
//
//                           DMBroadlink.TBLDevice.Insert;
//                           DMBroadlink.TBLDevice.FieldByName('DevStr').AsString := StrAfter('Device : ', OutLines[i]);
//                           DMBroadlink.TBLDevice.FieldByName('Name').AsString := FBLDevName.LEBLDevName.Text;
//                           DMBroadlink.TBLDevice.Post;
//
//                        end;
//
//                     FBroadlink.CBDevice.Items.Add(DMBroadlink.TBLDevice.FieldByName('Name').AsString + ' : ' + StrAfter('Device : ', OutLines[i]));
//
//                  end;
//
//            end;
//
//         if FBroadlink.CBDevice.Items.Count > 0
//         then
//            FBroadlink.CBDevice.ItemIndex := 0;
//
//         OutLines.DisposeOf;
//
//         Exit;
//
//      end;
//
//   if CurrOperation = 'JoinWiFi'
//   then
//      begin
//         MOutPut.Text :=  MOutPut.Text + Text;
//         SendMessage(MOutPut.Handle, WM_VSCROLL, SB_BOTTOM, 0);
//      end;

end;

procedure TFSetUpBL.FormShow(Sender: TObject);
begin

   MOutPut.Text := '';
   LESSid.Text := '';
   AENetwPW.Text := '';

end;

procedure TFSetUpBL.IViewPasswordClick(Sender: TObject);
begin

   if AENetwPW.EditType = etPassword
   then
      AENetwPW.EditType := etString
   else
      AENetwPW.EditType := etPassword;

end;

procedure TFSetUpBL.BDiscoverClick(Sender: TObject);
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

procedure TFSetUpBL.BSetUpBLCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFSetUpBL.BSetUpClick(Sender: TObject);

var
   FileLines: TStringList;

begin

   if Trim(LESSid.Text) = ''
   then
      begin
         ShowMessage('Please enter network name');
         LESSid.SetFocus;
         Exit;
      end;

   if Trim(AENetwPW.Text) = ''
   then
      begin
         ShowMessage('Please enter network password');
         AENetwPW.SetFocus;
         Exit;
      end;

   CurrOperation := 'JoinWiFi';

   FileLines := TStringList.Create;
   FileLines.Add(ExtractFileDrive(AppDir));
   FileLines.Add('cd "' + AppDir + '"');

   FileLines.Add('python broadlink_cli2 --joinwifi "' + LESSid.Text + '" "' + AENetwPW.Text + '" "' + IntToStr(ACBSec.ItemIndex) + '"');

   FileLines.SaveToFile(AppDir + '\Commands.bat');

   Execute(AppDir + '\Commands.bat', ExecOut);

   FileLines.DisposeOf;

end;

end.

