object FInstructions: TFInstructions
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 1
  Caption = 'Instructions'
  ClientHeight = 543
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 15
    Width = 674
    Height = 36
    Margins.Top = 15
    Align = alTop
    Alignment = taCenter
    Caption = 'How to use'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 143
  end
  object HTMLabel1: THTMLabel
    AlignWithMargins = True
    Left = 10
    Top = 64
    Width = 667
    Height = 419
    Margins.Left = 10
    Margins.Top = 10
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    HTMLText.Strings = (
      
        '<FONT  size="11" face="Times New Roman" ><SHAD>The app uses </SH' +
        'AD><A href="https://github.com/mjg59/python-broadlink">python-br' +
        'oadlink</A><SHAD>, so python has to be installed. Download from ' +
        '</SHAD><A href="https://www.python.org/downloads/">here.<BR><BR>' +
        '</A><SHAD>Install Python and be sure to add python to your path ' +
        'variable. Install python-broadlink by issuing this command in a ' +
        'commandprompt "pip3 install broadlink"</SHAD><BR><BR><SHAD>Insta' +
        'll win32 "pip install pypiwin32"</SHAD><BR><BR><SHAD>How to use ' +
        'the commandline interface.</SHAD><BR><BR><IND x="20"><SHAD>OBS. ' +
        'The gui app (WinBroadlink.exe) has to be started.</SHAD><BR><BR>' +
        '<IND x="20"><SHAD>Run "Your install directory (e.g C:\Program Fi' +
        'les (x86)\WinBroadlink)"\SendBLCommand.exe"</SHAD><BR><BR><IND x' +
        '="20"><SHAD>Parameters:</SHAD><BR><BR><IND x="40"><SHAD>--help G' +
        'et parameterinfo</SHAD><BR><BR><IND x="40"><SHAD>--sendcmd "Your' +
        ' Broadlink device name (e.g. "MyBLDevice")" "Device name" "Butto' +
        'n name"</SHAD><BR><BR><IND x="40"><SHAD>--sendmacro "Your Broadl' +
        'ink device name (e.g. "MyBLDevice")" "Macro name"</SHAD><BR><BR>' +
        '<IND x="40"><SHAD>--sendwificmd "Your Broadlink device name (e.g' +
        '. "Dinnertable light")" "ButtonName"</SHAD></FONT>')
    ParentFont = False
    Transparent = True
    OnAnchorClick = HTMLabel1AnchorClick
    Version = '1.8.4.0'
    ExplicitWidth = 679
  end
  object Panel1: TPanel
    Left = 0
    Top = 470
    Width = 680
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 456
    ExplicitWidth = 674
    object BInstOK: TButton
      Left = 308
      Top = 16
      Width = 75
      Height = 41
      Caption = 'OK'
      TabOrder = 0
      OnClick = BInstOKClick
    end
    object CBNoShow: TCheckBox
      Left = 4
      Top = 22
      Width = 229
      Height = 21
      Caption = 'Do not show this again'
      TabOrder = 1
      OnClick = CBNoShowClick
    end
  end
end
