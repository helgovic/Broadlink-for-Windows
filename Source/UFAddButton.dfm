object FAddButton: TFAddButton
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Add Button'
  ClientHeight = 484
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
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
    Left = 180
    Top = 442
    Width = 125
    Height = 49
    Caption = 'Continue'
    Enabled = False
    TabOrder = 2
    OnClick = BContinueClick
  end
  object MCode: TMemo
    Left = 1
    Top = 270
    Width = 615
    Height = 150
    ReadOnly = True
    TabOrder = 3
  end
  object BAddButtonOK: TButton
    Left = 309
    Top = 440
    Width = 125
    Height = 49
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = BAddButtonOKClick
  end
  object BAddDeviceCancel: TButton
    Left = 438
    Top = 440
    Width = 125
    Height = 49
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = BAddDeviceCancelClick
  end
  object BStart: TButton
    Left = 53
    Top = 440
    Width = 125
    Height = 49
    Caption = 'Start learning'
    TabOrder = 6
    OnClick = BStartClick
  end
end
