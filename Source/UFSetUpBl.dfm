object FSetUpBL: TFSetUpBL
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Setup Broadlink Device'
  ClientHeight = 654
  ClientWidth = 490
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
  object Label1: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 10
    Width = 482
    Height = 273
    Margins.Left = 5
    Margins.Top = 10
    Align = alTop
    AutoSize = False
    Caption = 
      '1. Put the device into AP Mode:'#13#10#13#10'      Long press the reset bu' +
      'tton until the blue LED is blinking quickly.'#13#10'      Long press a' +
      'gain until blue LED is blinking slowly.'#13#10#13#10'      There will now ' +
      'be a an entry in your WiFi network list named BroadLink_WiFi_Dev' +
      'ice or '#13#10'      something similar. Connect to that.'#13#10' '#13#10'2. Enter ' +
      'your WiFi network name and password. Select a security'#13#10'   proto' +
      'col.'#13#10#13#10'3. Click SetUp.'#13#10#13#10'4. Reconnect to your WiFi network.'#13#10#13 +
      #10'5. Click Discover.'
    WordWrap = True
    ExplicitWidth = 458
  end
  object LESSid: TLabeledEdit
    Left = 3
    Top = 332
    Width = 480
    Height = 23
    EditLabel.Width = 166
    EditLabel.Height = 15
    EditLabel.Caption = 'Enter your network ssid (Name)'
    TabOrder = 0
    Text = ''
  end
  object AENetwPW: TAdvEdit
    Left = 3
    Top = 385
    Width = 480
    Height = 23
    EditType = etPassword
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    LabelCaption = 'Enter your network password'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Separator = ';'
    CanUndo = False
    Color = clWindow
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
    Visible = True
    Version = '2.9.4.2'
  end
  object BSetUp: TButton
    Left = 60
    Top = 619
    Width = 125
    Height = 55
    Caption = 'SetUp'
    TabOrder = 4
    OnClick = BSetUpClick
  end
  object BSetUpBLCancel: TButton
    Left = 189
    Top = 619
    Width = 125
    Height = 55
    Caption = 'Close'
    TabOrder = 5
    OnClick = BSetUpBLCloseClick
  end
  object MOutPut: TMemo
    Left = 3
    Top = 467
    Width = 480
    Height = 129
    ReadOnly = True
    TabOrder = 3
  end
  object ACBSec: TAdvComboBox
    Left = 5
    Top = 438
    Width = 480
    Height = 23
    Color = clWindow
    Version = '1.4.1.0'
    Visible = True
    ButtonWidth = 17
    DropWidth = 0
    Enabled = True
    ItemIndex = 3
    Items.Strings = (
      'None'
      'WEP'
      'WPA1'
      'WPA2'
      'WPA1/2')
    LabelCaption = 'Security protocol'
    LabelPosition = lpTopLeft
    LabelTransparent = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    TabOrder = 2
    Text = 'WPA2'
  end
  object BDiscover: TButton
    Left = 318
    Top = 619
    Width = 125
    Height = 55
    Caption = 'Discover'
    TabOrder = 6
    OnClick = BDiscoverClick
  end
end
