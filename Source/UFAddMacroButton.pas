unit UFAddMacroButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvEdit;

type
  TFAddMacroButton = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    LBAMBDevices: TListBox;
    LBAMBButtons: TListBox;
    Panel2: TPanel;
    BAddMacroButton: TButton;
    BAddMacroButtonClose: TButton;
    procedure BAddMacroButtonCloseClick(Sender: TObject);
    procedure BAddMacroButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LBAMBDevicesClick(Sender: TObject);
  private
    procedure LoadDevices;
    procedure LoadButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddMacroButton: TFAddMacroButton;

implementation

uses
   UFBroadlink, UFMacros;

{$R *.dfm}

procedure TFAddMacroButton.BAddMacroButtonClick(Sender: TObject);
begin

   if FMacros.SGMacroButtons.Cells[0, FMacros.SGMacroButtons.RowCount - 1] <> ''
   then
      FMacros.SGMacroButtons.RowCount := FMacros.SGMacroButtons.RowCount + 1;

   FMacros.SGMacroButtons.Cells[0, FMacros.SGMacroButtons.RowCount - 1] := LBAMBDevices.Items[LBAMBDevices.ItemIndex];
   FMacros.SGMacroButtons.Cells[1, FMacros.SGMacroButtons.RowCount - 1] := LBAMBButtons.Items[LBAMBButtons.ItemIndex];
   FMacros.SGMacroButtons.Cells[2, FMacros.SGMacroButtons.RowCount - 1] := '0';

end;

procedure TFAddMacroButton.BAddMacroButtonCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFAddMacroButton.FormShow(Sender: TObject);
begin
   LoadDevices;
end;

procedure TFAddMacroButton.LBAMBDevicesClick(Sender: TObject);
begin
   LoadButtons;
end;

procedure TFAddMacroButton.LoadButtons;
begin

   LBAMBButtons.Clear;

   FBroadlink.QGetButtons.Close;
   FBroadlink.QGetButtons.ParamByName('DevName').AsString := LBAMBDevices.Items[LBAMBDevices.ItemIndex];
   FBroadlink.QGetButtons.Open;

   while not FBroadlink.QGetButtons.Eof do
      begin

         LBAMBButtons.Items.Add(FBroadlink.QGetButtons.FieldByName('Name').AsString);

         FBroadlink.QGetButtons.Next;

      end;

   LBAMBButtons.ItemIndex := 0;

end;

procedure TFAddMacroButton.LoadDevices;
begin

   FBroadlink.TDevice.First;

   LBAMBDevices.Clear;

   while not FBroadlink.TDevice.Eof do
      begin

         LBAMBDevices.Items.Add (FBroadlink.TDevice.FieldByName('Name').AsString);

         FBroadlink.TDevice.Next;

      end;

   if LBAMBDevices.Count > 0
   then
      begin
         LBAMBDevices.ItemIndex := 0;
         LoadButtons;
      end;

end;


end.
