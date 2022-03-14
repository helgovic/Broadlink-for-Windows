unit UFLocations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid;

type
  TFLocations = class(TForm)
    Panel1: TPanel;
    BAddLocation: TButton;
    BLocationsClose: TButton;
    SGLocations: TAdvStringGrid;
    BDeleteLocation: TButton;
    BSetDef: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BAddLocationClick(Sender: TObject);
    procedure BDeleteLocationClick(Sender: TObject);
    procedure BSetDefClick(Sender: TObject);
    procedure BLocationsCloseClick(Sender: TObject);
  private
    procedure LoadLocations;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocations: TFLocations;

implementation

uses
   UDMBroadlink, UFNewLocation, UFTimers;

{$R *.dfm}

procedure TFLocations.BAddLocationClick(Sender: TObject);
begin

   if FNewLocation.ShowModal = mrOK
   then
      LoadLocations;

end;

procedure TFLocations.BDeleteLocationClick(Sender: TObject);
begin

   DMBroadlink.QGetLocRestr.Close;
   DMBroadlink.QGetLocRestr.ParamByName('Location').AsString := SGLocations.Cells[0, SGLocations.Row];
   DMBroadlink.QGetLocRestr.Open;

   if not DMBroadlink.QGetLocRestr.IsEmpty
   then
      begin
         ShowMessage('Cannot delete. Location ' + SGLocations.Cells[0, SGLocations.Row] + ' is used in ' + DMBroadlink.QGetLocRestr.RecordCount.ToString + ' Timers.');
         Exit;
      end;

   if MessageDlg('Delete Location?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      TThread.CreateAnonymousThread(
      procedure
      begin

         PauseTimers := True;

         while not TimersFinished do
            Sleep(100);

         DMBroadlink.TLocations.FindKey([SGLocations.Cells[0, SGLocations.Row]]);
         DMBroadlink.TLocations.Delete;

         LoadLocations;

         PauseTimers := False;
         FTimers.TCheckTimers.Enabled := True;

      end).Start;

end;

procedure TFLocations.BLocationsCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFLocations.BSetDefClick(Sender: TObject);
begin

   DMBroadlink.TLocations.FindKey([SGLocations.Cells[0, SGLocations.Row]]);
   DMBroadlink.TLocations.Edit;
   DMBroadlink.TLocations.FieldByName('Default').AsBoolean := True;
   DMBroadlink.TLocations.Post;

   DMBroadlink.QResetDefaultLocation.ParamByName('Name').AsString := SGLocations.Cells[0, SGLocations.Row];
   DMBroadlink.QResetDefaultLocation.ExecSQL;

   LoadLocations;

end;

procedure TFLocations.FormCreate(Sender: TObject);
begin
   SGLocations.ColWidths[1] := 100;
   SGLocations.ColWidths[2] := 100;
   SGLocations.ColWidths[3] := 75;
end;

procedure TFLocations.LoadLocations;
begin

   DMBroadlink.QGetLocations.Close;
   DMBroadlink.QGetLocations.Open;

   SGLocations.RowCount := 2;
   SGLocations.ClearRows(1, 1);

   while not DMBroadlink.QGetLocations.Eof do
      begin

         if SGLocations.Cells[0, SGLocations.RowCount - 1] <> ''
         then
            SGLocations.RowCount := SGLocations.RowCount + 1;

         SGLocations.Cells[0, SGLocations.RowCount - 1] := DMBroadlink.QGetLocations.FieldByName('Name').AsString;
         SGLocations.Cells[1, SGLocations.RowCount - 1] := DMBroadlink.QGetLocations.FieldByName('Lattitude').AsString;
         SGLocations.Cells[2, SGLocations.RowCount - 1] := DMBroadlink.QGetLocations.FieldByName('Longitude').AsString;

         if DMBroadlink.QGetLocations.FieldByName('Default').AsBoolean
         then
            SGLocations.Cells[3, SGLocations.RowCount - 1] := 'Default'
         else
            SGLocations.Cells[3, SGLocations.RowCount - 1] := '';

         DMBroadlink.QGetLocations.Next;

      end;

   SGLocations.Row := 1;

end;

procedure TFLocations.FormShow(Sender: TObject);
begin
   LoadLocations;
end;

end.
