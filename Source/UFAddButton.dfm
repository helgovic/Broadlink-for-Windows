object FAddButton: TFAddButton
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  ClientHeight = 473
  ClientWidth = 606
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
  object Label1: TLabel
    Left = 0
    Top = 66
    Width = 38
    Height = 15
    Caption = 'Output'
  end
  object Label2: TLabel
    Left = 1
    Top = 249
    Width = 28
    Height = 15
    Caption = 'Code'
  end
  object LEButtonName: TLabeledEdit
    Left = 0
    Top = 28
    Width = 615
    Height = 23
    EditLabel.Width = 71
    EditLabel.Height = 15
    EditLabel.Caption = 'Button Name'
    TabOrder = 0
    Text = ''
  end
  object MStatus: TMemo
    Left = 0
    Top = 88
    Width = 615
    Height = 150
    ReadOnly = True
    TabOrder = 1
  end
  object BContinue: TButton
    Left = 255
    Top = 440
    Width = 110
    Height = 49
    Caption = 'Continue'
    Enabled = False
    TabOrder = 5
    OnClick = BContinueClick
  end
  object MCode: TMemo
    Left = 0
    Top = 270
    Width = 615
    Height = 150
    ReadOnly = True
    TabOrder = 2
  end
  object BAddButtonSave: TButton
    Left = 369
    Top = 440
    Width = 110
    Height = 49
    Caption = 'Save'
    Enabled = False
    TabOrder = 6
    OnClick = BAddButtonSaveClick
  end
  object BAddDeviceClose: TButton
    Left = 483
    Top = 440
    Width = 110
    Height = 49
    Caption = 'Close'
    TabOrder = 7
    OnClick = BAddDeviceCloseClick
  end
  object BStart: TButton
    Left = 141
    Top = 440
    Width = 110
    Height = 49
    Caption = 'Start learning'
    TabOrder = 4
    OnClick = BStartClick
  end
  object BAddButtTest: TButton
    Left = 27
    Top = 440
    Width = 110
    Height = 49
    Caption = 'Test'
    Enabled = False
    TabOrder = 3
    OnClick = BAddButtTestClick
  end
end
