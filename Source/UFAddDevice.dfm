object FAddDevice: TFAddDevice
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Add device'
  ClientHeight = 203
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 15
  object LEDevName: TLabeledEdit
    Left = 0
    Top = 28
    Width = 621
    Height = 23
    EditLabel.Width = 68
    EditLabel.Height = 15
    EditLabel.Caption = 'Device name'
    TabOrder = 0
    Text = ''
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 70
    Width = 279
    Height = 47
    Caption = 'Type'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'IR'
      'RF')
    TabOrder = 1
  end
  object BDeviceOK: TButton
    Left = 165
    Top = 136
    Width = 147
    Height = 49
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = BDeviceOKClick
  end
  object BAddDeviceCancel: TButton
    Left = 315
    Top = 136
    Width = 147
    Height = 49
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = BAddDeviceCancelClick
  end
end
