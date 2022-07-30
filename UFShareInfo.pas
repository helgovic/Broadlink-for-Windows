unit UFShareInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.IniFiles, HTMLabel;

type
  TFShareInfo = class(TForm)
    Panel1: TPanel;
    BShareDevOK: TButton;
    CBShareDevNoShow: TCheckBox;
    BShareDevCancel: TButton;
    HTMLabel1: THTMLabel;
    Label1: TLabel;
    procedure CBShareDevNoShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FShareInfo: TFShareInfo;

implementation

{$R *.dfm}

procedure TFShareInfo.CBShareDevNoShowClick(Sender: TObject);
begin

   if CBShareDevNoShow.Checked
   then
      With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
         WriteBool('Settings', 'ShowDevShare', False)
   else
      With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
         WriteBool('Settings', 'ShowDevShare', True);

end;

end.
