object FAddMacroButton: TFAddMacroButton
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Add Macro Button'
  ClientHeight = 355
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 350
    Height = 245
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 231
    object LBAMBDevices: TListBox
      Left = 0
      Top = 0
      Width = 350
      Height = 245
      Align = alClient
      Columns = 2
      ItemHeight = 15
      TabOrder = 0
      OnClick = LBAMBDevicesClick
      ExplicitHeight = 231
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 675
    object Label1: TLabel
      Left = 0
      Top = 10
      Width = 40
      Height = 15
      Caption = 'Devices'
    end
    object Label2: TLabel
      Left = 350
      Top = 12
      Width = 41
      Height = 15
      Caption = 'Buttons'
    end
  end
  object Panel4: TPanel
    Left = 350
    Top = 33
    Width = 331
    Height = 245
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 325
    ExplicitHeight = 231
    object LBAMBButtons: TListBox
      Left = 0
      Top = 0
      Width = 331
      Height = 245
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
      ExplicitWidth = 325
      ExplicitHeight = 231
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 278
    Width = 681
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 264
    ExplicitWidth = 675
    object BAddMacroButton: TButton
      Left = 235
      Top = 18
      Width = 109
      Height = 41
      Caption = 'Add Button'
      TabOrder = 0
      OnClick = BAddMacroButtonClick
    end
    object BAddMacroButtonClose: TButton
      Left = 350
      Top = 18
      Width = 109
      Height = 41
      Caption = 'Close'
      TabOrder = 1
      OnClick = BAddMacroButtonCloseClick
    end
  end
end
