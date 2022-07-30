object FTimers: TFTimers
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Timers'
  ClientHeight = 411
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 615
    Height = 85
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 312
    ExplicitWidth = 604
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
    Width = 615
    Height = 326
    Align = alClient
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 604
    ExplicitHeight = 312
  end
  object TCheckTimers: TTimer
    OnTimer = TCheckTimersTimer
    Left = 244
    Top = 214
  end
end
