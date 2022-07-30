object FrTimer: TFrTimer
  Left = 0
  Top = 0
  Width = 600
  Height = 90
  TabOrder = 0
  PixelsPerInch = 96
  object AGBWhat: TAdvGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 8
    Width = 587
    Height = 79
    Margins.Left = 10
    Margins.Top = 8
    BorderColor = clBlue
    Align = alClient
    Caption = 'Timer'
    TabOrder = 0
    ExplicitTop = 18
    ExplicitWidth = 580
    ExplicitHeight = 75
    object LWhat: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 21
      Width = 495
      Height = 53
      Margins.Left = 10
      Align = alClient
      AutoSize = False
      Caption = 
        'Button "Power On" on device "Dinnertablelight" using Broadlink r' +
        'emote "MyRemote"'
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 1
      ExplicitTop = 17
      ExplicitWidth = 501
      ExplicitHeight = 89
    end
    object Panel2: TPanel
      Left = 510
      Top = 18
      Width = 75
      Height = 59
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 503
      ExplicitHeight = 89
      object BDeleteTimer: TButton
        Left = 5
        Top = 12
        Width = 65
        Height = 35
        Caption = 'Delete'
        TabOrder = 0
        OnClick = BDeleteTimerClick
      end
    end
  end
  object ETimerID: TEdit
    Left = 483
    Top = 26
    Width = 97
    Height = 23
    TabOrder = 1
    Visible = False
  end
end
