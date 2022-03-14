object FShareInfo: TFShareInfo
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Share Devices'
  ClientHeight = 411
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object HTMLabel1: THTMLabel
    AlignWithMargins = True
    Left = 10
    Top = 59
    Width = 597
    Height = 276
    Margins.Left = 10
    Margins.Top = 10
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    HTMLText.Strings = (
      
        '<FONT face="Times New Roman" ><FONT size="14"><SHAD>Before shari' +
        'ng your devices, please make sure that:</SHAD></FONT><FONT size=' +
        '"11"><BR><BR><IND x="20"><SHAD>The devices are actually existing' +
        ' devices, not virtual ones.</SHAD><BR><BR><IND x="20"><SHAD>Manu' +
        'facturer and model names are accurate.</SHAD><BR><BR><IND x="20"' +
        '><SHAD>You have taught all buttons from original remote.</SHAD><' +
        'BR><BR><IND x="20"><SHAD>You have testet all buttons.</SHAD><BR>' +
        '<BR><SHAD>If you want to utilize the shared database from anothe' +
        'r platform/app, you can send a mail to helgovic@hotmail.dk to ge' +
        't database specifics</SHAD></FONT></FONT>')
    ParentFont = False
    Transparent = True
    Version = '1.8.4.0'
    ExplicitLeft = 156
    ExplicitTop = 114
    ExplicitWidth = 141
    ExplicitHeight = 103
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 604
    Height = 36
    Margins.Top = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'Share Devices'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 180
  end
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 610
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 324
    ExplicitWidth = 604
    object BShareDevOK: TButton
      Left = 235
      Top = 16
      Width = 75
      Height = 41
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object CBShareDevNoShow: TCheckBox
      Left = 6
      Top = 24
      Width = 229
      Height = 21
      Caption = 'Do not show this again'
      TabOrder = 2
      OnClick = CBShareDevNoShowClick
    end
    object BShareDevCancel: TButton
      Left = 314
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
