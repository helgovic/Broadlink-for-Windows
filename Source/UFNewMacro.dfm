object FNewMacro: TFNewMacro
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New Macro'
  ClientHeight = 128
  ClientWidth = 513
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
  object LEMacroName: TLabeledEdit
    Left = 5
    Top = 32
    Width = 500
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Name'
    TabOrder = 0
    Text = ''
  end
  object BNewMacroOK: TButton
    Left = 145
    Top = 78
    Width = 109
    Height = 41
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = BNewMacroOKClick
  end
  object BNewMacroCancel: TButton
    Left = 260
    Top = 79
    Width = 109
    Height = 41
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = BNewMacroCancelClick
  end
end
