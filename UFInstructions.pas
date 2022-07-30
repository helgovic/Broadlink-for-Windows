unit UFInstructions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles, Winapi.ShellAPI,
  Vcl.ComCtrls, HTMLabel;

type
  TFInstructions = class(TForm)
    Panel1: TPanel;
    BInstOK: TButton;
    CBNoShow: TCheckBox;
    Label1: TLabel;
    HTMLabel1: THTMLabel;
    procedure BInstOKClick(Sender: TObject);
    procedure CBNoShowClick(Sender: TObject);
    procedure HTMLabel1AnchorClick(Sender: TObject; Anchor: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInstructions: TFInstructions;

implementation

{$R *.dfm}

procedure TFInstructions.BInstOKClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFInstructions.CBNoShowClick(Sender: TObject);
begin

   if CBNoShow.Checked
   then
      With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
         WriteBool('Settings', 'ShowInst', False)
   else
      With TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Broadlink.ini') do
         WriteBool('Settings', 'ShowInst', True);

end;

procedure TFInstructions.HTMLabel1AnchorClick(Sender: TObject; Anchor: string);
begin
   ShellExecute(Handle, nil, PChar(Anchor), nil, nil, SW_SHOWDEFAULT);
end;

end.
