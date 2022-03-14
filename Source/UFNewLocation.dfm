object FNewLocation: TFNewLocation
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'New location'
  ClientHeight = 333
  ClientWidth = 335
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
  object AELocName: TAdvEdit
    Left = 16
    Top = 32
    Width = 300
    Height = 23
    EmptyTextStyle = []
    LabelCaption = 'Name'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -12
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 0
    Text = ''
    Visible = True
    Version = '2.9.4.2'
  end
  object AELongitude: TAdvEdit
    Left = 16
    Top = 138
    Width = 300
    Height = 23
    EmptyTextStyle = []
    LabelCaption = 'Longitude in degrees'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -12
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '2.9.4.2'
  end
  object AELattitude: TAdvEdit
    Left = 16
    Top = 87
    Width = 300
    Height = 23
    EmptyTextStyle = []
    LabelCaption = 'Latitude in degrees'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -12
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 1
    Text = ''
    Visible = True
    Version = '2.9.4.2'
  end
  object Panel1: TPanel
    Left = 0
    Top = 232
    Width = 335
    Height = 101
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 218
    ExplicitWidth = 329
    object HTMLabel1: THTMLabel
      Left = 16
      Top = 13
      Width = 304
      Height = 20
      HTMLText.Strings = (
        
          '<FONT color="#FFFFFF"><SHAD>You can get coordinates </SHAD><A hr' +
          'ef="https://latitudelongitude.org/">here</A></FONT>')
      Transparent = True
      OnAnchorClick = HTMLabel1AnchorClick
      Version = '1.8.4.0'
    end
    object BSaveLocation: TButton
      Left = 39
      Top = 40
      Width = 127
      Height = 49
      Caption = 'Save'
      TabOrder = 0
      OnClick = BSaveLocationClick
    end
    object BCancel: TButton
      Left = 170
      Top = 40
      Width = 127
      Height = 49
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object CBDefault: TAdvOfficeCheckBox
    Left = 16
    Top = 172
    Width = 193
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = True
    Alignment = taLeftJustify
    Caption = 'Set as default location'
    ReturnIsTab = False
    Themed = True
    Version = '1.3.5.0'
  end
end
