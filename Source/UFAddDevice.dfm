object FAddDevice: TFAddDevice
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Add device'
  ClientHeight = 331
  ClientWidth = 607
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object LEDevName: TLabeledEdit
    Left = 4
    Top = 156
    Width = 615
    Height = 23
    EditLabel.Width = 68
    EditLabel.Height = 15
    EditLabel.Caption = 'Device name'
    TabOrder = 2
    Text = ''
  end
  object RadioGroup1: TRadioGroup
    Left = 5
    Top = 192
    Width = 279
    Height = 47
    Caption = 'Type'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'IR'
      'RF')
    TabOrder = 3
  end
  object ACBManufacturer: TAdvComboBox
    Left = 4
    Top = 34
    Width = 615
    Height = 23
    Color = clWindow
    Version = '1.4.1.0'
    Visible = True
    ButtonWidth = 17
    DropWidth = 0
    Enabled = True
    ItemIndex = -1
    LabelCaption = 'Manufacturer'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TabOrder = 0
    OnChange = ACBManufacturerChange
  end
  object ACBModelName: TAdvComboBox
    Left = 5
    Top = 93
    Width = 615
    Height = 23
    Color = clWindow
    Version = '1.4.1.0'
    Visible = True
    ButtonWidth = 17
    DropWidth = 0
    Enabled = True
    ItemIndex = -1
    LabelCaption = 'Model Name'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TabOrder = 1
    OnChange = ACBModelNameChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 607
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 2
    ExplicitTop = 256
    object BDeviceOK: TButton
      Left = 164
      Top = 14
      Width = 147
      Height = 49
      Caption = 'OK'
      TabOrder = 0
      OnClick = BDeviceOKClick
    end
    object BAddDeviceCancel: TButton
      Left = 315
      Top = 14
      Width = 147
      Height = 49
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ACBShare: TAdvOfficeCheckBox
    Left = 4
    Top = 256
    Width = 123
    Height = 27
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Alignment = taLeftJustify
    Caption = 'Share this device'
    ReturnIsTab = False
    State = cbChecked
    Version = '1.3.5.0'
  end
end
