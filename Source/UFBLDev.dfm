object FBLDevName: TFBLDevName
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Broadlink device'
  ClientHeight = 447
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LEBLDevName: TLabeledEdit
    Left = 6
    Top = 356
    Width = 420
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Name'
    TabOrder = 6
    Text = ''
  end
  object LEBLMacAdr: TLabeledEdit
    Left = 6
    Top = 197
    Width = 420
    Height = 23
    EditLabel.Width = 68
    EditLabel.Height = 15
    EditLabel.Caption = 'Mac Address'
    ReadOnly = True
    TabOrder = 3
    Text = ''
  end
  object LEBLType: TLabeledEdit
    Left = 6
    Top = 144
    Width = 420
    Height = 23
    EditLabel.Width = 24
    EditLabel.Height = 15
    EditLabel.Caption = 'Type'
    ReadOnly = True
    TabOrder = 2
    Text = ''
  end
  object LEBLModel: TLabeledEdit
    Left = 6
    Top = 91
    Width = 420
    Height = 23
    EditLabel.Width = 34
    EditLabel.Height = 15
    EditLabel.Caption = 'Model'
    ReadOnly = True
    TabOrder = 1
    Text = ''
  end
  object LEBLHexType: TLabeledEdit
    Left = 6
    Top = 303
    Width = 420
    Height = 23
    EditLabel.Width = 48
    EditLabel.Height = 15
    EditLabel.Caption = 'Hex Type'
    ReadOnly = True
    TabOrder = 5
    Text = ''
  end
  object LEBLIPAdr: TLabeledEdit
    Left = 6
    Top = 250
    Width = 420
    Height = 23
    EditLabel.Width = 55
    EditLabel.Height = 15
    EditLabel.Caption = 'IP Address'
    ReadOnly = True
    TabOrder = 4
    Text = ''
  end
  object LEBLManufacturer: TLabeledEdit
    Left = 6
    Top = 38
    Width = 420
    Height = 23
    EditLabel.Width = 72
    EditLabel.Height = 15
    EditLabel.Caption = 'Manufacturer'
    ReadOnly = True
    TabOrder = 0
    Text = ''
  end
  object Panel1: TPanel
    Left = 0
    Top = 387
    Width = 436
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    ExplicitTop = 373
    ExplicitWidth = 430
    object BBLDevOK: TButton
      Left = 75
      Top = 10
      Width = 141
      Height = 41
      Caption = 'OK'
      TabOrder = 0
      OnClick = BBLDevOKClick
    end
    object BSkipDev: TButton
      Left = 220
      Top = 10
      Width = 141
      Height = 41
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = BSkipDevClick
    end
  end
end
