unit UFNewMacro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Stan.Param, Data.DB;

type
  TFNewMacro = class(TForm)
    LEMacroName: TLabeledEdit;
    BNewMacroOK: TButton;
    BNewMacroCancel: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BNewMacroOKClick(Sender: TObject);
    procedure BNewMacroCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNewMacro: TFNewMacro;

implementation

uses
   UFBroadlink, UDMBroadlink;

{$R *.dfm}

var
   CloseAllowed: Boolean = True;

procedure TFNewMacro.BNewMacroCancelClick(Sender: TObject);
begin
   CloseAllowed := True;
end;

procedure TFNewMacro.BNewMacroOKClick(Sender: TObject);
begin

   CloseAllowed := True;

   if Trim(LEMacroName.Text) = ''
   then
      begin
         ShowMessage('Please enter button name');
         LEMacroName.SetFocus;
         CloseAllowed := False;
         Exit;
      end;

   DMBroadlink.QGetMacroByName.Close;
   DMBroadlink.QGetMacroByName.ParamByName('Name').AsString := Trim(LEMacroName.Text);
   DMBroadlink.QGetMacroByName.Open;

   if not DMBroadlink.QGetMacroByName.IsEmpty
   then
      begin
         ShowMessage('Macro ' + Trim(LEMacroName.Text) + ' already exists');
         LEMacroName.SetFocus;
         CloseAllowed := False;
      end;

end;

procedure TFNewMacro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   CanClose := CloseAllowed;

end;

procedure TFNewMacro.FormShow(Sender: TObject);
begin
   LEMacroName.Text := '';
   LEMacroName.SetFocus;
end;

end.


