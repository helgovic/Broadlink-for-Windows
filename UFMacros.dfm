object FMacros: TFMacros
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Macros'
  ClientHeight = 458
  ClientWidth = 1069
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1053
    object Label1: TLabel
      Left = 0
      Top = 10
      Width = 34
      Height = 15
      Caption = 'Macro'
    end
    object Label2: TLabel
      Left = 227
      Top = 9
      Width = 266
      Height = 15
      Caption = 'Buttons. To change sequence drag and drop rows. '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 385
    Width = 1069
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 371
    ExplicitWidth = 1053
    object BNewMacro: TButton
      Left = 593
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Add Macro'
      TabOrder = 4
      OnClick = BNewMacroClick
    end
    object BAddMacroButton: TButton
      Left = 687
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Add Button'
      TabOrder = 5
      OnClick = BAddMacroButtonClick
    end
    object AEWait: TAdvEdit
      Left = 944
      Top = 25
      Width = 115
      Height = 23
      EditAlign = eaRight
      EditType = etNumeric
      EmptyTextStyle = []
      FlatLineColor = 11250603
      FocusColor = clWindow
      FocusFontColor = 3881787
      LabelCaption = 'Wait (Milliseconds)'
      LabelPosition = lpTopLeft
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Segoe UI'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      TabOrder = 7
      Text = '0'
      Visible = True
      OnChange = AEWaitChange
      Version = '2.9.4.2'
    end
    object BSaveMacro: TButton
      Left = 781
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Save Macro'
      TabOrder = 6
      OnClick = BSaveMacroClick
    end
    object BClose: TButton
      Left = 217
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Close'
      TabOrder = 0
      OnClick = BCloseClick
    end
    object BDeleteMacro: TButton
      Left = 405
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Delete Macro'
      TabOrder = 2
      OnClick = BDeleteMacroClick
    end
    object BDeleteButton: TButton
      Left = 499
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Delete Button'
      TabOrder = 3
      OnClick = BDeleteButtonClick
    end
    object BTestMacro: TButton
      Left = 311
      Top = 16
      Width = 90
      Height = 41
      Caption = 'Test Macro'
      TabOrder = 1
      OnClick = BTestMacroClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 30
    Width = 227
    Height = 355
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 341
    object LBMacros: TListBox
      Left = 0
      Top = 0
      Width = 227
      Height = 355
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      ItemHeight = 15
      TabOrder = 0
      OnClick = LBMacrosClick
      ExplicitHeight = 341
    end
  end
  object Panel4: TPanel
    Left = 227
    Top = 30
    Width = 842
    Height = 355
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 826
    ExplicitHeight = 341
    object SGMacroButtons: TAdvStringGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 836
      Height = 349
      Cursor = crDefault
      Hint = 'Drag and drop rows to alter sequence'
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
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goVertLine, goHorzLine, goRowMoving, goEditing, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
      OnClick = SGMacroButtonsClick
      OnDragOver = SGMacroButtonsDragOver
      ActiveRowShow = True
      GridLineColor = 15987699
      GridFixedLineColor = 15987699
      HoverRowCells = [hcNormal, hcSelected]
      OnOleDrop = SGMacroButtonsOleDrop
      OnOleDragOver = SGMacroButtonsOleDragOver
      DragDropSettings.OleDropTarget = True
      DragDropSettings.OleDropSource = True
      DragDropSettings.OleEntireRows = True
      DragDropSettings.OleInsertRows = True
      DragDropSettings.OleRemoveRows = True
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnHeaders.Strings = (
        ''
        'Device Name'
        'Device Type'
        'Button Name'
        'Wait Milliseconds')
      ColumnSize.Stretch = True
      ColumnSize.StretchColumn = 1
      ColumnSize.SynchNormalCellsOnly = True
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
      DragScrollOptions.Active = True
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
      FixedColWidth = 20
      FixedRowHeight = 24
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clBlack
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Navigation.AllowInsertRow = True
      Navigation.AllowFmtClipboard = True
      Navigation.AllowClipboardAlways = True
      Navigation.CursorMoveRows = True
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
      Version = '6.2.1.1'
      WordWrap = False
      ExplicitWidth = 820
      ExplicitHeight = 335
      ColWidths = (
        20
        667
        20
        64
        64)
      RowHeights = (
        24
        24)
    end
  end
end
