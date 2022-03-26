object FAddLightButton: TFAddLightButton
  Left = 10
  Top = 15
  ParentCustomHint = False
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Add Light Button'
  ClientHeight = 364
  ClientWidth = 737
  Color = clBtnFace
  CustomTitleBar.Height = 2
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 2
  GlassFrame.Bottom = 5
  GlassFrame.SheetOfGlass = True
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object INewScene: TImage
    Left = 469
    Top = 181
    Width = 21
    Height = 21
    Hint = 'Create New Scene'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      00100803000000282D0F5300000300504C5445010000264E73174E830F4B880B
      47840D49850B49840C4884124E8B16477810487F0058B1006DD90071E30C80E6
      077CE6016FE0006AD3014C96124980005BB70073E4007DFF0491FF008AFF0079
      FF0071E5034E9913497F015AB10172E5176CB6367694337AA1336E910C67BB01
      4E9E0C447C005ABC0074F336616DA9BF85C5E6BA9DB2761564A30051A34A6681
      3C6D9B2F74B83D6169B2DCB2DEFFECA5C99C115996004C9F052E5A02284F042A
      50012344032648082B4E2F465B434C393B44323B4939A7D0A9DBFEE19EC29714
      3B59054A9207549C0A6CC40A84ED006EDC0069D1015BB50B3F7367846986AA8B
      89AC8C8CB18EBEEDC1D2FFD5B5E4B98DAE8790AF8890A26D37718D0692FF007E
      FB0077EE0063C7073E769CC59CD5FFD8DBFFDED7FFDACDFFD0CAFFCDCFFFD1D6
      FFDDD9FFE7D0FCC83C7E9E058BFD017AF20073E50060C2083E7484A786BEECC1
      C3F2C5C1F1C4C9FBCCCCFFCFC6F9CAC4F1BFC9F5C3C2E0A23D79930690FF017C
      F70075EA0062C5093F754E624F5065514D624E4F644FACD5AEDAFFDEA2C9A03C
      5C5E3563793863731E659C067BE7006BD50064C90054A90C3B6A405240A4CBA6
      DCFDE3A1C2950C497F0061D60071ED007BF40C84ED0074EA006DDB005CB9093E
      73445744AAD2ABE2FFE9A6C999145182016BD70178EB0582FB0E8FFF007DFA00
      76EA0062C64456445A715A596F595C745C5F775F4759474E624EA5CEA6BBE5BD
      BAE5BDABD6AC546B544C604CB5E2B7D4FFD7BEEEC15369544C5F4CB3DFB5D1FF
      D4D0FFD3BBEABD536953495C495166513240323A4A3B3A493A39473937453751
      6751B2DEB4B9E8BC5D755D364436394939344133556A55AEDAB1B7E2BAB4E2B7
      B2DFB5C4F5C7C6F8C9B4E1B6B7E2B9B1DDB35D745D516551C5F6C7D0FFD4D3FF
      D6CAFCCC4F634FC2F3C5CEFFD1C7F9CA586E59506550CCFCCFC9FCCCC8FACBCA
      FCCDCBFDCECBFCCEC3F3C659705A415241566C57566C56546954607860698369
      566B57566B56455644455845BAE8BDBAE9BD536853B5E1B7BCEBBF495B49AED9
      B0C9F6CCC8F6CBB4E1B75A715B536754000000090588B30000000174524E5300
      40E6D866000000B94944415478DA63640081658C20100A62328205D68005FC11
      029B18578731327A2104B68355B82004F6FE06F2999DC002FBC1928C5F187918
      197F72FCE0643CCDC8F84C9A9171224301E3430605A0D435C6BB2A0FE53B0519
      DE47FE9767643CCB781B28C0C0D022C8C090CDC070578591F1C1551D46A0CE3E
      86E29F7F1880E630BE64640092CF9F32F268FCFBC70A6482ADFD748C91D1F2B4
      13AA3BAC18B991042C1F572EFD8724F003E4B60F22088165E18CEFFE5F720631
      01BCCC330F30E2B4D10000000049454E44AE426082}
    ShowHint = True
    Stretch = True
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 283
    Width = 737
    Height = 81
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    ExplicitTop = 269
    ExplicitWidth = 731
    object BLBTest: TButton
      Left = 370
      Top = 16
      Width = 110
      Height = 50
      Caption = 'Test'
      TabOrder = 2
      OnClick = BLBTestClick
    end
    object BLBSave: TButton
      Left = 484
      Top = 16
      Width = 110
      Height = 50
      Caption = 'Save'
      TabOrder = 3
      OnClick = BLBSaveClick
    end
    object BLBGetLightState: TButton
      Left = 256
      Top = 16
      Width = 110
      Height = 50
      Caption = 'Get Current State'
      TabOrder = 1
      OnClick = BLBGetLightStateClick
    end
    object BAddLightButtonClose: TButton
      Left = 142
      Top = 16
      Width = 110
      Height = 50
      Caption = 'Close'
      TabOrder = 0
      OnClick = BAddLightButtonCloseClick
    end
  end
  object GBColor: TAdvGroupBox
    Left = 500
    Top = 18
    Width = 237
    Height = 260
    BorderColor = clBlue
    RoundEdges = True
    Caption = 'Color'
    ParentCtl3D = True
    TabOrder = 0
    object AELBRed: TAdvEdit
      Left = 12
      Top = 49
      Width = 100
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LengthLimit = 3
      LabelCaption = 'Red'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 0
      Text = '255'
      Visible = True
      OnExit = AELBRedExit
      Version = '2.9.4.2'
    end
    object AELBGreen: TAdvEdit
      Left = 10
      Top = 104
      Width = 100
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Green'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 2
      Text = '255'
      Visible = True
      OnExit = AELBRedExit
      Version = '2.9.4.2'
    end
    object AELBBlue: TAdvEdit
      Left = 10
      Top = 157
      Width = 100
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Blue'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 4
      Text = '255'
      Visible = True
      OnExit = AELBRedExit
      Version = '2.9.4.2'
    end
    object BLBSelectColor: TButton
      Left = 12
      Top = 203
      Width = 215
      Height = 50
      Caption = 'Select Color'
      TabOrder = 6
      OnClick = BLBSelectColorClick
    end
    object AELBLBrightness: TAdvEdit
      Left = 118
      Top = 157
      Width = 100
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Brightness'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 5
      Text = '100'
      Visible = True
      OnExit = AELBHueExit
      Version = '2.9.4.2'
    end
    object AELBSaturation: TAdvEdit
      Left = 118
      Top = 104
      Width = 100
      Height = 23
      EditAlign = eaRight
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Saturation'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 3
      Text = '100'
      Visible = True
      OnExit = AELBHueExit
      Version = '2.9.4.2'
    end
    object AELBHue: TAdvEdit
      Left = 118
      Top = 49
      Width = 100
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Hue'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      MaxLength = 3
      TabOrder = 1
      Text = '360'
      Visible = True
      OnExit = AELBHueExit
      Version = '2.9.4.2'
    end
  end
  object AELBColorTemp: TAdvEdit
    Left = 8
    Top = 107
    Width = 237
    Height = 23
    ParentCustomHint = False
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'ColorTemp'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 3
    Text = '6500'
    Visible = True
    Version = '2.9.4.2'
  end
  object AELBTransDur: TAdvEdit
    Left = 8
    Top = 179
    Width = 237
    Height = 23
    ParentCustomHint = False
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Transition Duration'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 5
    Text = '0'
    Visible = True
    Version = '2.9.4.2'
  end
  object AELBMaxWorkTime: TAdvEdit
    Left = 253
    Top = 39
    Width = 237
    Height = 23
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Max Work Time'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 2
    Text = '0'
    Visible = True
    Version = '2.9.4.2'
  end
  object ACBColorMode: TAdvComboBox
    Left = 253
    Top = 107
    Width = 237
    Height = 23
    Color = clWindow
    Version = '1.4.1.0'
    Visible = True
    ButtonWidth = 17
    Style = csDropDownList
    DropWidth = 0
    Enabled = True
    ItemIndex = 0
    Items.Strings = (
      'RGB'
      'WHITE'
      'SCENE')
    LabelCaption = 'Color Mode'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TabOrder = 4
    Text = 'RGB'
  end
  object ACBSchene: TAdvComboBox
    Left = 253
    Top = 179
    Width = 214
    Height = 23
    Color = clWindow
    Version = '1.4.1.0'
    Visible = True
    ButtonWidth = 17
    DropWidth = 0
    Enabled = True
    ItemIndex = -1
    LabelCaption = 'Scene'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TabOrder = 6
  end
  object AELBName: TAdvEdit
    Left = 8
    Top = 39
    Width = 237
    Height = 23
    ParentCustomHint = False
    EditType = etAlphaNumeric
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Name'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 1
    Text = ''
    Visible = True
    Version = '2.9.4.2'
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 12
    Top = 300
  end
end
