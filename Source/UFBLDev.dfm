object FBLDevName: TFBLDevName
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Broadlink device'
  ClientHeight = 181
  ClientWidth = 438
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
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 199
    Height = 15
    Caption = 'Enter a name for this Broadlink device'
  end
  object EBLDevice: TEdit
    Left = 6
    Top = 30
    Width = 420
    Height = 23
    ReadOnly = True
    TabOrder = 0
  end
  object BBLDevOK: TButton
    Left = 147
    Top = 126
    Width = 141
    Height = 41
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = BBLDevOKClick
  end
  object LEBLDevName: TLabeledEdit
    Left = 6
    Top = 76
    Width = 420
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Name'
    TabOrder = 2
    Text = ''
  end
end
