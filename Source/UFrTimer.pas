unit UFrTimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGroupBox,
  Vcl.ExtCtrls, System.Threading;

type
  TFrTimer = class(TFrame)
    AGBWhat: TAdvGroupBox;
    LWhat: TLabel;
    Panel2: TPanel;
    BDeleteTimer: TButton;
    ETimerID: TEdit;
    procedure BDeleteTimerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
   UDMBroadlink, UFTimers;

{$R *.dfm}

procedure TFrTimer.BDeleteTimerClick(Sender: TObject);
begin

   if MessageDlg('Delete Timer?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOK
   then
      TThread.CreateAnonymousThread(
      procedure
      begin

         if DMBroadlink.TTimers.FindKey([StrToInt(ETimerID.Text)])
         then
            begin

               PauseTimers := True;

               while not TimersFinished do
                  Sleep(100);

               DMBroadlink.TTimers.Delete;

               TThread.Synchronize(TThread.CurrentThread,
               procedure
               begin
                  FTimers.LoadTimers;
               end);

               PauseTimers := False;
               FTimers.TCheckTimers.Enabled := True;

            end;

      end).Start;

end;

end.
