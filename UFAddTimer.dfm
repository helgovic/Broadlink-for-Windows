object FAddTimer: TFAddTimer
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Add Timer'
  ClientHeight = 608
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object GBWhen: TGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 557
    Height = 249
    Margins.Left = 10
    Margins.Top = 10
    Align = alTop
    Caption = 'When'
    TabOrder = 0
    ExplicitWidth = 549
    object GBOnce: TJvGroupBox
      AlignWithMargins = True
      Left = 12
      Top = 27
      Width = 540
      Height = 60
      Margins.Left = 10
      Margins.Top = 10
      Align = alTop
      Caption = 'Once on'
      TabOrder = 0
      Checkable = True
      PropagateEnable = True
      OnCheckBoxClick = GBOnceCheckBoxClick
      ExplicitWidth = 532
      object ADTPOnce: TAdvDateTimePicker
        Left = 10
        Top = 27
        Width = 220
        Height = 21
        Date = 44631.000000000000000000
        Format = ''
        Time = 0.507986111108039000
        DateFormat = dfLong
        DoubleBuffered = True
        Kind = dkDateTime
        ParentDoubleBuffered = False
        TabOrder = 1
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 44631.507986111110000000
        Version = '1.2.0.1'
        LabelPosition = lpTopLeft
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
      end
    end
    object GBRepeat: TJvGroupBox
      AlignWithMargins = True
      Left = 12
      Top = 100
      Width = 540
      Height = 60
      Margins.Left = 10
      Margins.Top = 10
      Align = alTop
      Caption = 'Every'
      TabOrder = 1
      Checkable = True
      Checked = False
      PropagateEnable = True
      OnCheckBoxClick = GBRepeatCheckBoxClick
      ExplicitWidth = 532
      object AERepeat: TAdvEdit
        Left = 10
        Top = 27
        Width = 55
        Height = 23
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        Lookup.Separator = ';'
        AutoSize = False
        Color = clWindow
        Enabled = False
        TabOrder = 1
        Text = '1'
        Visible = True
        Version = '2.9.4.2'
      end
      object ACBRepeatType: TAdvComboBox
        Left = 69
        Top = 27
        Width = 67
        Height = 23
        Color = clWindow
        Version = '1.4.1.0'
        Visible = True
        Style = csDropDownList
        DropWidth = 0
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Days'
          'Hours'
          'Minutes'
          'Seconds')
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        TabOrder = 2
        Text = 'Days'
      end
      object ADTPStartTime: TAdvDateTimePicker
        Left = 186
        Top = 28
        Width = 220
        Height = 21
        Date = 44631.000000000000000000
        Format = ''
        Time = 0.507986111108039000
        DateFormat = dfLong
        DoubleBuffered = True
        Enabled = False
        Kind = dkDateTime
        ParentDoubleBuffered = False
        TabOrder = 3
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 44631.507986111110000000
        Version = '1.2.0.1'
        LabelCaption = 'Starting '
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
      end
    end
    object GBSunrise: TJvGroupBox
      AlignWithMargins = True
      Left = 12
      Top = 173
      Width = 540
      Height = 60
      Margins.Left = 10
      Margins.Top = 10
      Align = alTop
      Caption = 'Every day at '
      TabOrder = 2
      Checkable = True
      Checked = False
      PropagateEnable = True
      OnCheckBoxClick = GBSunriseCheckBoxClick
      ExplicitWidth = 532
      object INewLocation: TImage
        Left = 506
        Top = 29
        Width = 21
        Height = 21
        Hint = 'Create new location'
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
        OnClick = INewLocationClick
      end
      object AEDeltaTime: TAdvEdit
        Left = 10
        Top = 27
        Width = 55
        Height = 23
        EditAlign = eaRight
        EditType = etNumeric
        EmptyTextStyle = []
        SoftBorder = True
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        Lookup.Separator = ';'
        AutoSize = False
        Color = clWindow
        Enabled = False
        TabOrder = 1
        Text = '0'
        Visible = True
        Version = '2.9.4.2'
      end
      object ACBDeltaTimeType: TAdvComboBox
        Left = 69
        Top = 27
        Width = 67
        Height = 23
        Color = clWindow
        Version = '1.4.1.0'
        Visible = True
        Style = csDropDownList
        DropWidth = 0
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Hours'
          'Minutes')
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        TabOrder = 2
        Text = 'Hours'
      end
      object ACBDeltaTimeBA: TAdvComboBox
        Left = 140
        Top = 27
        Width = 67
        Height = 23
        Color = clWindow
        Version = '1.4.1.0'
        Visible = True
        Style = csDropDownList
        DropWidth = 0
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Before'
          'After')
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        TabOrder = 3
        Text = 'Before'
      end
      object ACBSunriseSet: TAdvComboBox
        Left = 211
        Top = 27
        Width = 67
        Height = 23
        Color = clWindow
        Version = '1.4.1.0'
        Visible = True
        Style = csDropDownList
        DropWidth = 0
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Sunrise'
          'Sunset')
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        TabOrder = 4
        Text = 'Sunrise'
      end
      object ACBLocation: TAdvComboBox
        Left = 282
        Top = 27
        Width = 220
        Height = 23
        Color = clWindow
        Version = '1.4.1.0'
        Visible = True
        Style = csDropDownList
        DropWidth = 0
        Enabled = False
        ItemIndex = -1
        LabelCaption = 'Location'
        LabelPosition = lpTopLeft
        LabelTransparent = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = 'Segoe UI'
        LabelFont.Style = []
        TabOrder = 5
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 570
    Height = 125
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 469
    ExplicitWidth = 562
    object BSaveTimer: TButton
      Left = 157
      Top = 55
      Width = 131
      Height = 53
      Caption = 'Save'
      TabOrder = 1
      OnClick = BSaveTimerClick
    end
    object BAddTimerCancel: TButton
      Left = 292
      Top = 55
      Width = 131
      Height = 53
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object ACBBLRem: TAdvComboBox
      Left = 7
      Top = 20
      Width = 555
      Height = 23
      Color = clWindow
      Version = '1.4.1.0'
      Visible = True
      DropWidth = 0
      Enabled = True
      ItemIndex = -1
      LabelCaption = 'Broadlink Remote'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      TabOrder = 0
      OnChange = ACBDevicesChange
    end
  end
  object AGBButton: TJvGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 272
    Width = 557
    Height = 99
    Margins.Left = 10
    Margins.Top = 10
    Align = alTop
    Caption = 'Send Button'
    TabOrder = 1
    Checkable = True
    PropagateEnable = True
    OnCheckBoxClick = AGBButtonCheckBoxClick
    ExplicitWidth = 549
    object ACBButton: TAdvComboBox
      Left = 277
      Top = 48
      Width = 261
      Height = 23
      Color = clWindow
      Version = '1.4.1.0'
      Visible = True
      Style = csDropDownList
      DropWidth = 0
      Enabled = True
      ItemIndex = -1
      LabelCaption = 'Button'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      TabOrder = 2
    end
    object ACBDevices: TAdvComboBox
      Left = 10
      Top = 48
      Width = 261
      Height = 23
      Color = clWindow
      Version = '1.4.1.0'
      Visible = True
      Style = csDropDownList
      DropWidth = 0
      Enabled = True
      ItemIndex = -1
      LabelCaption = 'Device'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      TabOrder = 1
      OnChange = ACBDevicesChange
    end
  end
  object ACGMacro: TJvGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 384
    Width = 557
    Height = 99
    Margins.Left = 10
    Margins.Top = 10
    Align = alTop
    Caption = 'Send Macro'
    TabOrder = 2
    Checkable = True
    Checked = False
    PropagateEnable = True
    OnCheckBoxClick = ACGMacroCheckBoxClick
    ExplicitWidth = 549
    object ACBMacro: TAdvComboBox
      AlignWithMargins = True
      Left = 10
      Top = 55
      Width = 261
      Height = 23
      Color = clWindow
      Version = '1.4.1.0'
      Visible = True
      Style = csDropDownList
      DropWidth = 0
      Enabled = False
      ItemIndex = -1
      LabelCaption = 'Macro'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      TabOrder = 1
    end
  end
end
