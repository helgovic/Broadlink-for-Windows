unit UFMacros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvUtil,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvEdit;

type

  TIntObj = class
     Value: Integer;
  end;

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
   UFBroadlink, UFNewMacro, UFAddMacroButton, JclSysUtils, JCLStrings;

{$R *.dfm}

procedure TFMacros.LoadButtons;
begin

   FBroadlink.QGetMacroButtons.Close;
   FBroadlink.QGetMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
   FBroadlink.QGetMacroButtons.Open;

   SGMacroButtons.RowCount := 2;
   SGMacroButtons.ClearRows(1, 1);

   while not FBroadlink.QGetMacroButtons.Eof do
      begin

         if SGMacroButtons.Cells[0, SGMacroButtons.RowCount - 1] <> ''
         then
            SGMacroButtons.RowCount := SGMacroButtons.RowCount + 1;

         SGMacroButtons.Cells[0, SGMacroButtons.RowCount - 1] := FBroadlink.QGetMacroButtons.FieldByName('DeviceName').AsString;
         SGMacroButtons.Cells[1, SGMacroButtons.RowCount - 1] := FBroadlink.QGetMacroButtons.FieldByName('ButtonName').AsString;
         SGMacroButtons.Cells[2, SGMacroButtons.RowCount - 1] := FBroadlink.QGetMacroButtons.FieldByName('wait').AsString;

         FBroadlink.QGetMacroButtons.Next;

      end;

   if SGMacroButtons.Cells[0, 1] <> ''
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

   FBroadlink.TMacros.First;

   while not FBroadlink.TMacros.Eof do
      begin

         LBMacros.Items.Add(FBroadlink.TMacros.FieldByName('Name').AsString);
         FBroadlink.TMacros.Next;

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
      (SGMacroButtons.Cells[0, SGMacroButtons.Row] <> '')
   then
      AEWait.Text := SGMacroButtons.Cells[2, SGMacroButtons.Row];

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
      (SGMacroButtons.Cells[0, SGMacroButtons.Row] <> '')
   then
      SGMacroButtons.Cells[2, SGMacroButtons.Row] := AEWait.Text;

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

   if MessageDlg('Delete ' + SGMacroButtons.Cells[0, SGMacroButtons.Row] + '/' + SGMacroButtons.Cells[1, SGMacroButtons.Row] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      SGMacroButtons.RemoveRows(SGMacroButtons.Row, 1);

end;

procedure TFMacros.BDeleteMacroClick(Sender: TObject);
begin

   if MessageDlg('Delete ' + LBMacros.Items[LBMacros.ItemIndex] + '?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      begin

         FBroadlink.QGetMacroByName.Close;
         FBroadlink.QGetMacroByName.ParamByName('Name').AsString := FMacros.LBMacros.Items[FMacros.LBMacros.ItemIndex];
         FBroadlink.QGetMacroByName.Open;

         FBroadlink.QDelMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
         FBroadlink.QDelMacroButtons.ExecSQL;

         FBroadlink.TMacros.FindKey([FBroadlink.QGetMacroByName.FieldByName('ID').AsInteger]);
         FBroadlink.TMacros.Delete;
         LoadMacros;

      end;

end;

procedure TFMacros.BNewMacroClick(Sender: TObject);
begin

   if FNewMacro.ShowModal = mrOk
   then
      begin

         FBroadlink.TMacros.Insert;

         FBroadlink.QGetMacroID.Close;
         FBroadlink.QGetMacroID.Open;

         if FBroadlink.QGetMacroID.FieldByName('NewID').IsNull
         then
            FBroadlink.TMacros.FieldByName('ID').AsInteger := 1
         else
            FBroadlink.TMacros.FieldByName('ID').AsInteger := FBroadlink.QGetMacroID.FieldByName('NewID').AsInteger;

         FBroadlink.TMacros.FieldByName('name').AsString := FNewMacro.LEMacroName.Text;

         FBroadlink.TMacros.Post;

         LoadMacros;

      end;

end;

procedure TFMacros.BSaveMacroClick(Sender: TObject);

var
   i: Integer;

begin

   FBroadlink.QDelMacroButtons.ParamByName('MacroName').AsString := LBMacros.Items[LBMacros.ItemIndex];
   FBroadlink.QDelMacroButtons.ExecSQL;

   FBroadlink.QGetMacroByName.Close;
   FBroadlink.QGetMacroByName.ParamByName('Name').AsString := FMacros.LBMacros.Items[FMacros.LBMacros.ItemIndex];
   FBroadlink.QGetMacroByName.Open;

   for i := 1 to SGMacroButtons.RowCount - 1 do
      begin

         if SGMacroButtons.Cells[0, i] <> ''
         then
            begin

               FBroadlink.QGetCode.Close;
               FBroadlink.QGetCode.ParamByName('DevName').AsString := SGMacroButtons.Cells[0, i];
               FBroadlink.QGetCode.ParamByName('ButtName').AsString := SGMacroButtons.Cells[1, i];
               FBroadlink.QGetCode.Open;

               FBroadlink.TMMMacroButton.Insert;
               FBroadlink.TMMMacroButton.FieldByName('MacroID').AsInteger := FBroadlink.QGetMacroByName.FieldByName('ID').AsInteger;
               FBroadlink.TMMMacroButton.FieldByName('ButtonID').AsInteger := FBroadlink.QGetCode.FieldByName('ID').AsInteger;
               FBroadlink.TMMMacroButton.FieldByName('wait').AsInteger := StrToInt(SGMacroButtons.Cells[2, i]);
               FBroadlink.TMMMacroButton.FieldByName('seq').AsInteger := i;
               FBroadlink.TMMMacroButton.Post;

            end;

      end;

end;

procedure TFMacros.BTestMacroClick(Sender: TObject);

var
   i: Integer;
   FileLines: TStringList;

begin

   for i := 1 to SGMacroButtons.RowCount - 1 do
      begin

         FBroadlink.QGetCode.Close;
         FBroadlink.QGetCode.ParamByName('DevName').AsString := SGMacroButtons.Cells[0, i];
         FBroadlink.QGetCode.ParamByName('ButtName').AsString := SGMacroButtons.Cells[1, i];
         FBroadlink.QGetCode.Open;

         FileLines := TStringList.Create;
         FileLines.Add(ExtractFileDrive(AppDir));
         FileLines.Add('cd "' + AppDir + '"');

         FileLines.Add('python broadlink_cli2 --device "' + StrAfter(' : ', FBroadlink.CBDevice.Text) + '" --send "' + FBroadlink.QGetCode.FieldByName('Code').AsString + '"');

         FileLines.SaveToFile(AppDir + '\Commands.bat');

         Execute(AppDir + '\Commands.bat', ExecOut);

         FileLines.DisposeOf;

         Sleep(StrToInt(SGMacroButtons.Cells[2, i]));

      end;

end;

procedure TFMacros.ExecOut(const Text: string);
begin

end;

procedure TFMacros.FormCreate(Sender: TObject);
begin

   SGMacroButtons.ColWidths[0] := (SGMacroButtons.Width - 185) div 2;
   SGMacroButtons.ColWidths[1] := (SGMacroButtons.Width - 185) div 2;
   SGMacroButtons.ColWidths[2] := 125;

end;

procedure TFMacros.FormShow(Sender: TObject);
begin

   LoadMacros;

end;

end.




