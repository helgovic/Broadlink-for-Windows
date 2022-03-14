object FBroadlink: TFBroadlink
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Broadlink for Windows'
  ClientHeight = 547
  ClientWidth = 1232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = AdvMainMenu1
  Position = poDesktopCenter
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 600
    Height = 389
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitHeight = 375
    object SGDevice: TAdvStringGrid
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 587
      Height = 383
      Cursor = crDefault
      Margins.Left = 10
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Ctl3D = True
      DefaultRowHeight = 24
      DefaultDrawing = True
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = SGDeviceClick
      GridLineColor = 15987699
      GridFixedLineColor = 15987699
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        'Name'
        'Manufacturer'
        'Model'
        'Type'
        'Share')
      ColumnSize.Stretch = True
      ColumnSize.StretchColumn = 0
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <
        item
          Column = 0
          CaseSensitive = False
          Operation = foSHORT
          Method = fmExpression
        end>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 374
      FixedRowHeight = 24
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clBlack
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowDesignHelper = False
      Version = '6.2.1.1'
      WordWrap = False
      ExplicitHeight = 369
      ColWidths = (
        374
        20
        64
        64
        64)
      RowHeights = (
        24
        24)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 422
    Width = 1232
    Height = 125
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 408
    ExplicitWidth = 1226
    object Label3: TLabel
      Left = 351
      Top = 10
      Width = 94
      Height = 15
      Caption = 'Broadlink Remote'
    end
    object INewDB: TImage
      Left = 322
      Top = 30
      Width = 21
      Height = 21
      Hint = 'Create Database'
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF61000002CF4944415478DA6D935F48537114C7BF77FF
        FFB8B92D9DDB98B6E6CA1E5C610A7BF1416AF4E721A2871E0A9F227105BE88BE
        F53EF5250861FA104198F4D28B604B28436A304A46182D580A2919DAB435B7DD
        ED6EBBBBFDCE850D071DB8DCFBBBDCF339DF73BEE7723816B3B3B37AAD567BA3
        ADADEDB2C9641AE038CE298AA2AA58E40B7C6E37E13E7AD86B30F269FB5931D8
        19A8E62887AB27472291333E9FEFB9DFEF1FD0683460C960C9280B25A4960671
        C2B187EE80049D16F8BA52AD56797CE9BB275E6800A2D1E8DB603078B1542AA1
        52A9807D220332073BD87E33842B7739C4D7FB50481FE1D2B914622B9503A8B8
        530DC0EAEAEAAF40204092214992FC8EEEB12783B8762B05B16AC3CA9208A5BE
        1B7EEB27B84C9CB4B65E8B35000B0B0B99FEFE7E8BCBE5824AA5825AAD8652A9
        C4EBC87574DA3EA0D751C4A66D19C5FC5F9CDEBE83DD0369EFF3CFDAFB06201C
        0E671D0E87B9A7A7075EAF17168B458608251EF1C72731E43A0278A6ACC65254
        40EA8F987C99907A8F0304A3D1A8D1EBF5B05AAD604E809E592378F76A1186F4
        1AAE5A37E03173086F78A56FDF37875F7CC46203303F3F5F66FDAB998D72F596
        9616D4DD2897CB605622B7F188D92621D77E5B0C85EEAB9A6C9C9E9E2E793C1E
        AD2008F299400450281432805CA199B8DD6EC4E371717C7CBC19C05A2899CD66
        ADDD6E97E5531B549D2E4A24403A9D96CF8944429C9C9C6C06CCCDCD95B3D9AC
        9A921908ADADADF21049417D2F789EB591CB81ED8A383A3ADA0C989999116C36
        9BC66030C867AA44C974A77DA005D3E9743238994CFEB705C1E9746AA80582D0
        45FB40F2EBC04C2623CF25168BD5262626944D00F623FD66F476AA421F911334
        480A925F2C1691CFE765055B5B5BF9919111531320140AF57574743CEDEAEA3A
        4F73606A64C914E4C2E1E1A10CD8DFDFDF61F1606A6A6AB909403136366663D2
        87D942DD647BE06300AAA26043CC170A851F0C14654A9E31CBB7EB39FF004B58
        383215BDB6970000000049454E44AE426082}
      ShowHint = True
      Stretch = True
      OnClick = INewDBClick
    end
    object AFEDB: TAdvFileNameEdit
      Left = 10
      Top = 28
      Width = 310
      Height = 23
      BorderColor = 11250603
      EmptyTextStyle = []
      Flat = False
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Database File'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      ReadOnly = False
      TabOrder = 0
      Text = ''
      Visible = True
      OnChange = AFEDBChange
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 18
      Etched = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        E9DFD4D4BCA5D1B194D3B193D8B595D8AF88D2AC84CFA17AC7A076C8A681D2B7
        9DE9DFD4FFFFFFFFFFFFE8DCD1C69F81D09878F5CFBEFFEFE1FFEFE7FFF6E9FF
        E9D1FEE1BEF6DEAAEDC294E1B57ED5A26CC38A53C6A483E5D8CBC9A78BBF805B
        E2B09AF4D6C4FFF0E6FFF1E2FFF9F2FFF3DEF6E9C9F0D6B1E7C29FDCB188D5A4
        78D1996ABD8654C9A98BC8A78BBF8360E3B7A4F4DED4FAEFEEF6EDDEE9E0CFD5
        CABDDABDB3D3B9A5DEBA9DD8B197D5AB8DD29D7BBD8559C9AA8CC8A78CBB7F5B
        CC9777CFA684D7B091DBA588DFAD7BDBA770D4965BC59652C1874BBB854ABC7E
        4DC08153B98057CAAB8FC5A385B06C40D59B7BF5CCB6FFEBE2FFF5DFFFF6E3FF
        E8D0FCDCBAF7D2AEF2CB96E3B581D8A16BC68A52AF6E3BC7A588C8A689BE7F5A
        E0AE96F4D4C7FFF4EBFFF4EBFFF8F6FEF2E5FCEDCDF0D8BAE5C2A5DEB58CD4A4
        7BD29A6FBF8553CAAA8DC8A78BBF8360E0B5A3F0D8CAF9E4DFE6D5C3E4CFB9D8
        B99FD0B393CFAD8DD4AA87D5A787D4A485D5A27FBD865ACAAC8FC8A78CB77A54
        C68E6CD2A481D9B495E3B691E7C19AE7BC94E3B582D9AB77CD9B63C68756BB7E
        44BC7B4DB67D51C9AA8EC5A286B16C41D7A082F8D4C0FFF1EAFFEEE2FFF2E1FD
        E4C6F6DBB6EED0A7E9C196E0B883D9A871CD9059B06F3BC8A88AC9A78CBE7F5A
        DEAC97F2D6C7FFF8F2FFF8F5FFFBF2FEF1E2F6E3C9F4D3B6E7C5A3DEB595D7A5
        7FCE9C6DBC8454CAAC8FC8A78BBE805EDCB09AE9CCBBECD6C6E3C9B2D9C3A8DC
        BB9DD7B393CDAC86D0A881CDA07CCD9775CE9475BD845BCAAB8EC8A78BB77E57
        CFA485DFB79AE8C0A7EDC9AEF4D2B2F6D7B4F6DAB1F4DCAEF0D7A3E9D197DCBE
        82C49D64B4784DC7A78AC9AD91D4AB8CFFE5D6FFE4D3FFE2D1FFE2D0FFE4C9FF
        E5C5FFE8C1FFEABEFFEFBCFFF3BAFFF7B9FFFDB8D3B777CBB08FE8DDD2D0B399
        ECC9AFFEDECCFFE4D4FFE6D6FFE8D1FFEACBFFEDC7FFEFC4FFF4C0FFF5BCFEF0
        B0ECD996D1B893E6D9CCFFFFFFFFFFFFEAE0D6D5BDA6D1B297D5B397D9B797DC
        BB98DDBD96DABC92D5B88DD1B591D4BEA4E9DFD5FFFFFFFFFFFF}
      DefaultExt = 'db'
      FilterIndex = 0
      DialogOptions = [ofFileMustExist]
      DialogKind = fdOpen
    end
    object CBDevice: TComboBox
      Left = 351
      Top = 28
      Width = 533
      Height = 23
      ImeName = 'Danish'
      TabOrder = 1
    end
    object BAddDevice: TButton
      Left = 109
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Add device'
      TabOrder = 2
      OnClick = BAddDeviceClick
    end
    object BAddButton: TButton
      Left = 222
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Add Button'
      TabOrder = 3
      OnClick = BAddButtonClick
    end
    object BDelDevice: TButton
      Left = 335
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Delete Device'
      TabOrder = 4
      OnClick = BDelDeviceClick
    end
    object BDelButton: TButton
      Left = 448
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Delete Button'
      TabOrder = 5
      OnClick = BDelButtonClick
    end
    object BSendComm: TButton
      Left = 787
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Send Command'
      TabOrder = 8
      OnClick = BSendCommClick
    end
    object BMacros: TButton
      Left = 900
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Macros'
      TabOrder = 9
      OnClick = BMacrosClick
    end
    object BEditDevice: TButton
      Left = 561
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Edit Device'
      TabOrder = 6
      OnClick = BEditDeviceClick
    end
    object BEditButton: TButton
      Left = 674
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Edit Button'
      TabOrder = 7
      OnClick = BEditButtonClick
    end
    object BTimers: TButton
      Left = 1013
      Top = 70
      Width = 109
      Height = 41
      Caption = 'Timers'
      TabOrder = 10
      OnClick = BTimersClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1232
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 1226
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 40
      Height = 15
      Caption = 'Devices'
    end
    object Label2: TLabel
      Left = 603
      Top = 12
      Width = 41
      Height = 15
      Caption = 'Buttons'
    end
  end
  object Panel4: TPanel
    Left = 600
    Top = 33
    Width = 632
    Height = 389
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 626
    ExplicitHeight = 375
    object SGButtons: TAdvStringGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 626
      Height = 383
      Cursor = crDefault
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      ColCount = 2
      Ctl3D = True
      DefaultRowHeight = 24
      DefaultDrawing = True
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goVertLine, goHorzLine, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      GridLineColor = 15987699
      GridFixedLineColor = 15987699
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        'Name'
        'Code')
      ColumnSize.Stretch = True
      ColumnSize.StretchColumn = 1
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <
        item
          Column = 0
          CaseSensitive = False
          Operation = foSHORT
          Method = fmExpression
        end>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 644
      FixedRowHeight = 24
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clBlack
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowDesignHelper = False
      Version = '6.2.1.1'
      WordWrap = False
      ExplicitWidth = 620
      ExplicitHeight = 369
      ColWidths = (
        644
        42)
      RowHeights = (
        24
        24)
    end
  end
  object AdvMainMenu1: TAdvMainMenu
    MenuStyler = AdvMenuOfficeStyler1
    Version = '2.5.4.0'
    Left = 75
    Top = 75
    object Settings: TMenuItem
      Caption = 'File'
      object RunOnWinStartMI: TMenuItem
        AutoCheck = True
        Caption = 'Run on Windows start'
        OnClick = RunOnWinStartMIClick
      end
      object SetUpBLMI: TMenuItem
        Caption = 'SetUp BroadLink Device'
        Visible = False
        OnClick = SetUpBLMIClick
      end
      object ShowInstructionsMI: TMenuItem
        Caption = 'Show Instructions'
        OnClick = ShowInstructionsMIClick
      end
      object ShareDevices: TMenuItem
        Caption = 'Share Devices'
        Hint = 'Upload devices to shared database'
        OnClick = ShareDevicesClick
      end
      object MILocations: TMenuItem
        Caption = 'Locations'
        OnClick = MILocationsClick
      end
    end
  end
  object AdvMenuOfficeStyler1: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2003Blue
    Background.Position = bpCenter
    Background.Color = 3881787
    Background.ColorTo = 3881787
    ButtonAppearance.DownColor = 8553090
    ButtonAppearance.DownColorTo = 8553090
    ButtonAppearance.HoverColor = 6842472
    ButtonAppearance.HoverColorTo = 6842472
    ButtonAppearance.DownBorderColor = 8553090
    ButtonAppearance.HoverBorderColor = 11908533
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -12
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = 3881787
    IconBar.ColorTo = 3881787
    IconBar.CheckColor = clWhite
    IconBar.CheckColorTo = 6053472
    IconBar.CheckBorder = 6053472
    IconBar.RadioColor = 6053472
    IconBar.RadioColorTo = 6053472
    IconBar.RadioBorder = 6053472
    IconBar.SeparatorColor = 6842472
    SelectedItem.Color = 5263440
    SelectedItem.ColorTo = 5263440
    SelectedItem.BorderColor = 5263440
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWhite
    SelectedItem.Font.Height = -12
    SelectedItem.Font.Name = 'Segoe UI'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -9
    SelectedItem.NotesFont.Name = 'Segoe UI'
    SelectedItem.NotesFont.Style = []
    SelectedItem.UseSystemFont = False
    SelectedItem.CheckColor = 8553090
    SelectedItem.CheckColorTo = 8553090
    SelectedItem.CheckBorder = 8553090
    SelectedItem.RadioColor = 8553090
    SelectedItem.RadioColorTo = 8553090
    SelectedItem.RadioBorder = 8553090
    RootItem.Color = 3881787
    RootItem.ColorTo = 3881787
    RootItem.GradientDirection = gdVertical
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clWhite
    RootItem.Font.Height = -12
    RootItem.Font.Name = 'Segoe UI'
    RootItem.Font.Style = []
    RootItem.UseSystemFont = False
    RootItem.SelectedColor = 5263440
    RootItem.SelectedColorTo = 5263440
    RootItem.SelectedBorderColor = 5263440
    RootItem.SelectedTextColor = clWhite
    RootItem.HoverColor = 6842472
    RootItem.HoverColorTo = clNone
    RootItem.HoverColorMirror = 6842472
    RootItem.HoverBorderColor = 11908533
    RootItem.HoverTextColor = clWhite
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 6842472
    Separator.ColorTo = 6842472
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -9
    NotesFont.Name = 'Segoe UI'
    NotesFont.Style = []
    UseSystemFont = False
    MenuBorderColor = 11382963
    Left = 278
    Top = 75
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.sunrise-sunset.org/json'
    Params = <>
    Left = 481
    Top = 75
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Name = 'lat'
        Value = '55.73165'
      end
      item
        Name = 'lng'
        Value = '12.36328'
      end
      item
        Name = 'date'
        Value = '2022-03-14'
      end
      item
        Name = 'formatted'
        Value = '0'
      end>
    Response = RESTResponse1
    Left = 684
    Top = 75
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 887
    Top = 75
  end
end
