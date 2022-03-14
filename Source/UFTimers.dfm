object FTimers: TFTimers
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Timers'
  ClientHeight = 439
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 354
    Width = 622
    Height = 85
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 340
    ExplicitWidth = 616
    object BAddTimer: TButton
      Left = 200
      Top = 22
      Width = 109
      Height = 41
      Caption = 'Add Timer'
      TabOrder = 0
      OnClick = BAddTimerClick
    end
    object BTimersClose: TButton
      Left = 313
      Top = 22
      Width = 109
      Height = 41
      Caption = 'Close'
      TabOrder = 1
      OnClick = BTimersCloseClick
    end
  end
  object SBTimers: TScrollBox
    Left = 0
    Top = 0
    Width = 622
    Height = 354
    Align = alClient
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 616
    ExplicitHeight = 340
  end
  object TCheckTimers: TTimer
    OnTimer = TCheckTimersTimer
    Left = 244
    Top = 214
  end
end
