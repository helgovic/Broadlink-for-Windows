unit UFAddMacroButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvEdit, FireDAC.Stan.Param;

type

  TDevObj = class
     DevType: String;
  end;

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
   UFBroadlink, UFMacros, UDMBroadlink;

{$R *.dfm}

procedure TFAddMacroButton.BAddMacroButtonClick(Sender: TObject);
begin

   if FMacros.SGMacroButtons.Cells[1, FMacros.SGMacroButtons.RowCount - 1] <> ''
   then
      FMacros.SGMacroButtons.RowCount := FMacros.SGMacroButtons.RowCount + 1;

   FMacros.SGMacroButtons.Cells[1, FMacros.SGMacroButtons.RowCount - 1] := LBAMBDevices.Items[LBAMBDevices.ItemIndex];
   FMacros.SGMacroButtons.Cells[2, FMacros.SGMacroButtons.RowCount - 1] := TDevObj(LBAMBDevices.Items.Objects[LBAMBDevices.ItemIndex]).DevType;
   FMacros.SGMacroButtons.Cells[3, FMacros.SGMacroButtons.RowCount - 1] := LBAMBButtons.Items[LBAMBButtons.ItemIndex];
   FMacros.SGMacroButtons.Cells[4, FMacros.SGMacroButtons.RowCount - 1] := '0';

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

   if (TDevObj(LBAMBDevices.Items.Objects[LBAMBDevices.ItemIndex]).DevType = 'IR') or
      (TDevObj(LBAMBDevices.Items.Objects[LBAMBDevices.ItemIndex]).DevType = 'RF')
   then
      begin

         DMBroadlink.QGetButtons.Close;
         DMBroadlink.QGetButtons.ParamByName('DevName').AsString := LBAMBDevices.Items[LBAMBDevices.ItemIndex];
         DMBroadlink.QGetButtons.Open;

         while not DMBroadlink.QGetButtons.Eof do
            begin

               LBAMBButtons.Items.Add(DMBroadlink.QGetButtons.FieldByName('Name').AsString);

               DMBroadlink.QGetButtons.Next;

            end;

      end
   else
      if TDevObj(LBAMBDevices.Items.Objects[LBAMBDevices.ItemIndex]).DevType = 'WiFi Bulb'
      then
         begin

            DMBroadlink.QGetBLButtons.Close;
            DMBroadlink.QGetBLButtons.ParamByName('DevName').AsString := LBAMBDevices.Items[LBAMBDevices.ItemIndex];
            DMBroadlink.QGetBLButtons.Open;

            while not DMBroadlink.QGetBLButtons.Eof do
               begin

                  LBAMBButtons.Items.Add(DMBroadlink.QGetBLButtons.FieldByName('Name').AsString);

                  DMBroadlink.QGetBLButtons.Next;

               end;

         end;

   if LBAMBButtons.Items.Count > 0
   then
      LBAMBButtons.ItemIndex := 0;

end;

procedure TFAddMacroButton.LoadDevices;

var
   DType: TDevObj;

begin

   LBAMBDevices.Clear;

   DMBroadlink.QGetDevices.Close;
   DMBroadlink.QGetDevices.Open;

   while not DMBroadlink.QGetDevices.Eof do
      begin

         DType := TDevObj.Create;
         DType.DevType := DMBroadlink.QGetDevices.FieldByName('Type').AsString;

         LBAMBDevices.AddItem(DMBroadlink.QGetDevices.FieldByName('DeviceName').AsString, DType);

         DMBroadlink.QGetDevices.Next;

      end;

   if LBAMBDevices.Count > 0
   then
      begin
         LBAMBDevices.ItemIndex := 0;
         LoadButtons;
      end;

end;


end.
