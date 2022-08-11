object DMBroadlink: TDMBroadlink
  OnCreate = DataModuleCreate
  Height = 797
  Width = 1077
  object FDCBL: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=D:\Deplhi\Broadlink\BroadLink.db'
      'LockingMode=Exclusive'
      'Synchronous=Off')
    FetchOptions.AssignedValues = [evUnidirectional]
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 75
    Top = 75
  end
  object QGetManufacturerByName: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select ID'
      '  from Manufacturers'
      ' where UPPER(Name) = UPPER(:Name)')
    Left = 887
    Top = 365
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QCreateDB: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'PRAGMA foreign_keys = off;'
      'BEGIN TRANSACTION;'
      ''
      '-- Table: BLButtons'
      
        'CREATE TABLE BLButtons (ID BIGINT PRIMARY KEY UNIQUE NOT NULL, N' +
        'ame STRING NOT NULL, DeviceMac STRING NOT NULL REFERENCES BLDevi' +
        'ce (Mac) ON DELETE CASCADE ON UPDATE RESTRICT MATCH SIMPLE, Comm' +
        'and STRING NOT NULL, Protected BOOLEAN NOT NULL DEFAULT (False))' +
        ';'
      ''
      '-- Table: BLDevice'
      
        'CREATE TABLE BLDevice (Name STRING NOT NULL, Model STRING NOT NU' +
        'LL, Type STRING NOT NULL, IP TEXT NOT NULL, Mac STRING PRIMARY K' +
        'EY NOT NULL, HexType TEXT NOT NULL, Manufacturer STRING);'
      ''
      '-- Table: Buttons'
      
        'CREATE TABLE Buttons (ID BIGINT PRIMARY KEY NOT NULL, Name STRIN' +
        'G NOT NULL, DeviceID BIGINT NOT NULL REFERENCES Device (ID) ON D' +
        'ELETE CASCADE, Code STRING);'
      ''
      '-- Table: Device'
      
        'CREATE TABLE Device (ID BIGINT PRIMARY KEY NOT NULL, Name STRING' +
        ' NOT NULL, IR BOOLEAN NOT NULL, ManufacturerID BIGINT NOT NULL R' +
        'EFERENCES Manufacturers (ID) ON UPDATE RESTRICT, ModelName STRIN' +
        'G NOT NULL, Share BOOLEAN NOT NULL DEFAULT (True));'
      ''
      '-- Table: Locations'
      
        'CREATE TABLE Locations (Name STRING PRIMARY KEY UNIQUE NOT NULL,' +
        ' Lattitude STRING NOT NULL, Longitude STRING NOT NULL, "Default"' +
        ' BOOLEAN NOT NULL DEFAULT (False));'
      ''
      '-- Table: Macros'
      
        'CREATE TABLE Macros (Name STRING NOT NULL UNIQUE, ID BIGINT PRIM' +
        'ARY KEY UNIQUE NOT NULL);'
      ''
      '-- Table: Manufacturers'
      
        'CREATE TABLE Manufacturers (ID BIGINT PRIMARY KEY UNIQUE NOT NUL' +
        'L, Name STRING NOT NULL UNIQUE);'
      ''
      '-- Table: MMMacroButton'
      
        'CREATE TABLE MMMacroButton (MacroID BIGINT NOT NULL, ButtonID BI' +
        'GINT NOT NULL, wait BIGINT NOT NULL DEFAULT (0), seq INTEGER NOT' +
        ' NULL, Type STRING NOT NULL);'
      ''
      '-- Table: Timers'
      
        'CREATE TABLE Timers (ID BIGINT PRIMARY KEY NOT NULL, StartTime D' +
        'ATETIME NOT NULL, RepeatType STRING, RepeatInterval BIGINT, Macr' +
        'oID BIGINT, DeviceID BIGINT, ButtonID BIGINT, DeviceType STRING,' +
        ' NextRun DATETIME NOT NULL, IntervalType STRING, BLRemoteName ST' +
        'RING, DeltaTime INTEGER, DeltaTimeType STRING, DeltaTimeBA STRIN' +
        'G, Location STRING REFERENCES Locations (Name) ON DELETE RESTRIC' +
        'T);'
      ''
      '-- Index: BLButtonNameIdx'
      'CREATE INDEX BLButtonNameIdx ON BLButtons (Name);'
      ''
      '-- Index: DevNameIdx'
      'CREATE UNIQUE INDEX DevNameIdx ON Device (Name ASC);'
      ''
      '-- Index: MacroButtonIdx'
      
        'CREATE INDEX MacroButtonIdx ON MMMacroButton (MacroID, ButtonID)' +
        ';'
      ''
      '-- Index: MacroNameIdx'
      'CREATE INDEX MacroNameIdx ON Macros (Name);'
      ''
      '-- Index: Manufacturer_NameIdx'
      
        'CREATE UNIQUE INDEX Manufacturer_NameIdx ON Manufacturers (Name)' +
        ';'
      ''
      '-- Index: NameIdx'
      'CREATE UNIQUE INDEX NameIdx ON Buttons (Name, DeviceID);'
      ''
      'COMMIT TRANSACTION;'
      'PRAGMA foreign_keys = on;')
    Left = 278
    Top = 75
  end
  object QDellButton: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'delete'
      '  from Buttons'
      ' where ID = (select b2.ID'
      '               from Buttons b2,'
      '                    Device d'
      '              where UPPER(d.Name) = UPPER(:DevName) and'
      '                    b2.DeviceID = d.ID and'
      '                    UPPER(b2.Name) = UPPER(:ButtName))')
    Left = 481
    Top = 75
    ParamData = <
      item
        Name = 'DEVNAME'
        ParamType = ptInput
      end
      item
        Name = 'BUTTNAME'
        ParamType = ptInput
      end>
  end
  object QDelMacroButton: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'delete'
      '  from MMMacroButtons'
      ' where MacroID =:MacID and'
      '            BttonID = : ButtID'
      '')
    Left = 684
    Top = 75
    ParamData = <
      item
        Name = 'MACID'
        ParamType = ptInput
      end>
  end
  object QDelMacroButtons: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'delete'
      '  from MMMacroButton'
      ' where MacroID = (select ID'
      '                    from Macros'
      '                   where Name = :MacroName)'
      '')
    Left = 887
    Top = 75
    ParamData = <
      item
        Name = 'MACRONAME'
        ParamType = ptInput
      end>
  end
  object QGetBLDevByName: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Model,'
      '       Type,'
      '       IP,'
      '       Mac,'
      '       HexType,'
      '       Manufacturer'
      '  from BLDevice'
      ' where UPPER(Name) = UPPER(:Name)')
    Left = 887
    Top = 133
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QGetButtonID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Buttons')
    Left = 481
    Top = 191
  end
  object QGetButtons: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  But.ID,'
      '  But.Name,'
      '  But.Code,'
      '  But.DeviceID'
      'From'
      '  Buttons But'
      '  Inner Join'
      '  Device Dev On But.DeviceID = Dev.ID'
      'Where'
      '  Upper(Dev.Name) = Upper(:DevName)'
      'Order By'
      '  But.Name')
    Left = 684
    Top = 191
    ParamData = <
      item
        Name = 'DEVNAME'
        ParamType = ptInput
      end>
  end
  object QGetCode: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  b.Code,'
      '  b.ID,'
      '  b.DeviceID'
      'From'
      '  Buttons b,'
      '  Device d'
      'Where'
      '  b.DeviceID = d.ID And'
      '  (Upper(d.Name) = Upper(:DevName) And'
      '  Upper(b.Name) = Upper(:ButtName))')
    Left = 887
    Top = 191
    ParamData = <
      item
        Name = 'DEVNAME'
        ParamType = ptInput
      end
      item
        Name = 'BUTTNAME'
        ParamType = ptInput
      end>
  end
  object QGetMacroID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Macros')
    Left = 481
    Top = 365
  end
  object QGetMacroByName: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select ID'
      'from Macros'
      'where Name = :Name')
    Left = 278
    Top = 365
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QGetMacroButtons: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  b.ID,'
      '  b.Name As ButtonName,'
      '  b.Code,'
      '  d.Name As DeviceName,'
      '  mm.wait,'
      '  mm.seq,'
      '  mm.Type'
      'From'
      '  Buttons b,'
      '  MMMacroButton mm,'
      '  Macros m,'
      '  Device d'
      'Where'
      '  mm.MacroID = m.ID And'
      '  mm.ButtonID = b.ID And'
      '  d.ID = b.DeviceID And'
      '  (((mm.Type = '#39'IR'#39') Or'
      '    (mm.Type = '#39'RF'#39')) And'
      '  UPPER(m.Name) = UPPER(:MacroName))'
      'union'
      'Select'
      '  b.ID,'
      '  b.Name As ButtonName,'
      '  b.Command As Code,'
      '  d.Name As DeviceName,'
      '  mm.wait,'
      '  mm.seq,'
      '  mm.Type'
      'From'
      '  BLButtons b,'
      '  MMMacroButton mm,'
      '  Macros m,'
      '  BLDevice d'
      'Where'
      '  mm.MacroID = m.ID And'
      '  mm.ButtonID = b.ID And'
      '  d.Mac = b.DeviceMac And'
      '  UPPER(m.Name) = UPPER(:MacroName) And'
      '  (mm.Type <> '#39'IR'#39' And'
      '  mm.Type <> '#39'RF'#39')'
      'Order By'
      '  seq')
    Left = 75
    Top = 365
    ParamData = <
      item
        Name = 'MACRONAME'
        ParamType = ptInput
      end>
  end
  object QGetDeviceID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Device')
    Left = 684
    Top = 249
  end
  object QGetDeviceByName: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select ID'
      '  from Device'
      ' where Name = :Name')
    Left = 481
    Top = 249
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QGetDevFromManuModel: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select d.ID'
      '  from Device d,'
      '       Manufacturers m'
      ' where UPPER(d.ModelName) = UPPER(:ModelName) and'
      '       UPPER(m.Name) = UPPER(:ManufacturerName) and'
      '       d.ManufacturerID = m.ID')
    Left = 75
    Top = 249
    ParamData = <
      item
        Name = 'MODELNAME'
        ParamType = ptInput
      end
      item
        Name = 'MANUFACTURERNAME'
        ParamType = ptInput
      end>
  end
  object QGetManufacturerID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Manufacturers')
    Left = 75
    Top = 423
  end
  object TBLDevice: TFDTable
    Connection = FDCBL
    TableName = 'BLDevice'
    Left = 278
    Top = 481
  end
  object TButtons: TFDTable
    Connection = FDCBL
    TableName = 'Buttons'
    Left = 481
    Top = 481
  end
  object TDevice: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDCBL
    TableName = 'Device'
    Left = 684
    Top = 481
  end
  object TMacros: TFDTable
    Connection = FDCBL
    TableName = 'Macros'
    Left = 75
    Top = 539
  end
  object TManufacturers: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDCBL
    TableName = 'Manufacturers'
    Left = 278
    Top = 539
  end
  object TMMMacroButton: TFDTable
    Connection = FDCBL
    TableName = 'MMMacroButton'
    Left = 481
    Top = 539
  end
  object UCCommonDB: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'softmagical_dk_db_broadlink'
    SpecificOptions.Strings = (
      'MySQL.Interactive=True')
    Options.KeepDesignConnected = False
    Options.LocalFailover = True
    Username = 'softmagical_dk'
    Server = 'mysql89.unoeuro.com'
    LoginPrompt = False
    OnConnectionLost = UCCommonDBConnectionLost
    Left = 889
    Top = 539
    EncryptedPassword = 'B7FF9AFF95FF90FFCBFFCFFFC8FFC8FF'
  end
  object QCommonGetDevice: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select d.ID, d.ModelName, d.IR'
      '  from Device d,'
      '       Manufacturer m'
      ' where UPPER(m.Name) = UPPER(:ManufacturerName) and'
      '       UPPER(d.ModelName) = UPPER(:ModelName) and'
      '       m.ID = d.ManufacturerID ')
    Left = 75
    Top = 597
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ManufacturerName'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ModelName'
        Value = nil
      end>
  end
  object QCommonGetDeviceButtons: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select b.ID, b.Name, b.DeviceID, b.Code'
      '  from Buttons b,'
      '       Device d,'
      '       Manufacturer m'
      ' where UPPER(m.Name) = UPPER(:ManufacturerName) and'
      '       UPPER(d.ModelName) = UPPER(:ModelName) and'
      '       b.DeviceID = d.ID and'
      '       m.ID = d.ManufacturerID ')
    Left = 278
    Top = 597
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ManufacturerName'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ModelName'
        Value = nil
      end>
  end
  object QGetCommonManufacturerByName: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select ID'
      '  from Manufacturer'
      ' where UPPER(Name) = UPPER(:ManufacturerName)')
    Left = 684
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ManufacturerName'
        Value = nil
      end>
  end
  object QGetCommonManuModels: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select d.ModelName'
      '  from Device d,'
      '       Manufacturer m'
      ' where UPPER(m.Name) = UPPER(:ManufacturerName) and'
      '       m.ID = d.ManufacturerID ')
    Left = 887
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ManufacturerName'
        Value = nil
      end>
  end
  object TCommonButtons: TUniTable
    TableName = 'Buttons'
    Connection = UCCommonDB
    Options.SetFieldsReadOnly = False
    Left = 75
    Top = 715
  end
  object TCommonDevice: TUniTable
    TableName = 'Device'
    Connection = UCCommonDB
    Options.SetFieldsReadOnly = False
    Left = 278
    Top = 713
  end
  object TCommonManufacturers: TUniTable
    TableName = 'Manufacturer'
    Connection = UCCommonDB
    Options.SetFieldsReadOnly = False
    Left = 481
    Top = 713
  end
  object QCommonGetManufacturerID: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Manufacturer')
    Left = 684
    Top = 597
  end
  object QGetManufacturerModels: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select d.ID, d.ModelName, d.IR'
      '  from Device d,'
      '       Manufacturers m'
      ' where UPPER(m.Name) = UPPER(:ManufacturerName) and'
      '       d.ManufacturerID = m.ID')
    Left = 278
    Top = 423
    ParamData = <
      item
        Name = 'MANUFACTURERNAME'
        ParamType = ptInput
      end>
  end
  object QCommonGetDeviceID: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Device')
    Left = 481
    Top = 597
  end
  object QGetDeviceButtons: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select b.ID, b.Name, b.Code'
      '  from Buttons b, Device d'
      ' where  d.ID = :DeviceID and'
      '             b.DeviceID = d.ID'
      ' order by b.Name')
    Left = 278
    Top = 249
    ParamData = <
      item
        Name = 'DEVICEID'
        ParamType = ptInput
      end>
  end
  object QGetCommonButtonID: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Buttons')
    Left = 278
    Top = 655
  end
  object QGetCommonDeviceButton: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select b.ID, b.Name, b.DeviceID, b.Code'
      '  from Buttons b,'
      '       Device d'
      ' where d.ID = :DeviceID and'
      '       UPPER(b.Name) = UPPER(:ButtonName) and'
      '       b.DeviceID = d.ID ')
    Left = 481
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DeviceID'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ButtonName'
        Value = nil
      end>
  end
  object QGetDevices: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Dev.Name As DeviceName,'
      '  Dev.ModelName As DevModel,'
      '  Man.Name As ManufacturerName,'
      '  Case Dev.IR When True Then '#39'IR'#39' Else '#39'RF'#39' End As Type,'
      '  Dev.Share'
      'From'
      '  Device Dev'
      '  Inner Join'
      '  Manufacturers Man On Dev.ManufacturerID = Man.ID'
      'union'
      'Select'
      '  BLDevice.Name As DeviceName,'
      '  BLDevice.Model As DevModel,'
      '  BLDevice.Manufacturer As ManufacturerName,'
      '  BLDevice.Type,'
      '  False As Share'
      'From'
      '  BLDevice'
      'Where'
      '  BLDevice.Type <> '#39'Universal WiFi Remote'#39
      'Order By'
      '  1')
    Left = 75
    Top = 307
  end
  object QCommonGetManufacturers: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select Name'
      '  from Manufacturer'
      ' order by 1 ')
    Left = 887
    Top = 597
  end
  object QGetCommonButtonByCode: TUniQuery
    Connection = UCCommonDB
    SQL.Strings = (
      'select b.ID, b.Name, b.DeviceID, b.Code'
      '  from Buttons b,'
      '       Device d'
      ' where d.ID = :DeviceID and'
      '       b.Code = :Code and'
      '       b.DeviceID = d.ID ')
    Left = 75
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DeviceID'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'Code'
        Value = nil
      end>
  end
  object QFindButtonOther: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  But.Code,'
      '  But.ID'
      'From'
      '  Buttons But'
      '  Inner Join'
      '  Device Dev On But.DeviceID = Dev.ID'
      'Where'
      '  But.ID <> :ButtID And'
      '  Upper(Dev.Name) = Upper(:DevName) And'
      '  Upper(But.Name) = Upper(:ButtName)')
    Left = 75
    Top = 133
    ParamData = <
      item
        Name = 'BUTTID'
        ParamType = ptInput
      end
      item
        Name = 'DEVNAME'
        ParamType = ptInput
      end
      item
        Name = 'BUTTNAME'
        ParamType = ptInput
      end>
  end
  object QGetDeviceOther: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select ID'
      '  from Device'
      ' where UPPER(Name) = UPPER(:Name) and'
      '       ID <> :DevID')
    Left = 887
    Top = 249
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        Name = 'DEVID'
        ParamType = ptInput
      end>
  end
  object QGetBLDevices: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Name,'
      '       Model,'
      '       Type,'
      '       IP,'
      '       Mac,'
      '       HexType,'
      '       Manufacturer'
      '  from BLDevice'
      ' order by 1')
    Left = 75
    Top = 191
  end
  object TBLButtons: TFDTable
    Connection = FDCBL
    TableName = 'BLButtons'
    Left = 75
    Top = 481
  end
  object QGetBLButton: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select b.ID, b.Name, b.Command, b.Protected'
      '  from BLButtons b, BLDevice d'
      ' where  UPPER(d.Name) = UPPER(:DeviceName) and'
      '        b.DeviceMac = d.Mac and'
      '        UPPER(b.Name) = UPPER(:ButtName)')
    Left = 278
    Top = 133
    ParamData = <
      item
        Name = 'DEVICENAME'
        ParamType = ptInput
      end
      item
        Name = 'BUTTNAME'
        ParamType = ptInput
      end>
  end
  object QGetBLButtonID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from BLButtons')
    Left = 481
    Top = 133
  end
  object QGetBLButtons: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select b.ID, b.Name, b.Command, b.Protected'
      '  from BLButtons b, BLDevice d'
      ' where  UPPER(d.Name) = UPPER(:DeviceName) and'
      '        b.DeviceMac = d.Mac'
      ' order by 2')
    Left = 684
    Top = 133
    ParamData = <
      item
        Name = 'DEVICENAME'
        ParamType = ptInput
      end>
  end
  object TTimers: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDCBL
    TableName = 'Timers'
    Left = 684
    Top = 539
  end
  object QGetTimerID: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select Max(ID) + 1 as NewID'
      'from Timers')
    Left = 481
    Top = 423
  end
  object QGetTimers: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  Device.Name As DeviceName,'
      '  Buttons.Name As ButtName'
      'From'
      '  Timers'
      '  Inner Join'
      '  Device On Timers.DeviceID = Device.ID'
      '  Inner Join'
      '  Buttons On Timers.ButtonID = Buttons.ID'
      'where Timers.DeviceID <> 0'
      'union'
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  Macros.Name As DeviceName,'
      '  '#39'Macro'#39' as ButtName'
      'From'
      '  Timers'
      '  Inner Join'
      '  Macros On Timers.MacroID = Macros.ID'
      'where Timers.MacroID <> 0'
      'Union'
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  BLButtons.Name as DeviceName,'
      '  BLDevice.Name as ButtName'
      'From'
      '  BLDevice'
      '  Inner Join'
      '  Timers On Timers.BLRemoteName = BLDevice.Name'
      '  Inner Join'
      '  BLButtons On BLButtons.DeviceMac = BLDevice.Mac'
      'where Timers.DeviceID = 0 and'
      '      Timers.MacroID = 0'
      'Order By 9 asc')
    Left = 684
    Top = 423
  end
  object TLocations: TFDTable
    Connection = FDCBL
    TableName = 'Locations'
    Left = 887
    Top = 481
  end
  object QGetLocations: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Locations.Name,'
      '  Locations.Lattitude,'
      '  Locations.Longitude,'
      '  Locations."Default"'
      'From'
      '  Locations')
    Left = 684
    Top = 307
  end
  object QResetDefaultLocation: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Update Locations'
      '  Set "Default" = False'
      'where UPPER(Name) <> UPPER(:Name)  ')
    Left = 887
    Top = 423
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QGetLocRestr: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Timers.ID'
      'From'
      '  Timers'
      'Where'
      '  UPPER(Timers.Location) = UPPER(:Location)')
    Left = 887
    Top = 307
    ParamData = <
      item
        Name = 'LOCATION'
        ParamType = ptInput
      end>
  end
  object QGetMacroRestr: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Timers.ID'
      'From'
      '  Timers'
      '  Inner Join'
      '  Macros On Timers.MacroID = Macros.ID'
      'Where'
      '  Upper(Macros.Name) = Upper(:MacroName)')
    Left = 684
    Top = 365
    ParamData = <
      item
        Name = 'MACRONAME'
        ParamType = ptInput
      end>
  end
  object QGetLocation: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Locations.Name'
      'From'
      '  Locations'
      'Where'
      '  Upper(Locations.Name) = Upper(:Name)')
    Left = 481
    Top = 307
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object QGetDueTimers: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  Device.Name As DeviceName,'
      '  Buttons.Name As ButtName'
      'From'
      '  Timers'
      '  Inner Join'
      '  Device On Timers.DeviceID = Device.ID'
      '  Inner Join'
      '  Buttons On Timers.ButtonID = Buttons.ID'
      'where Timers.DeviceID <> 0 and'
      '      Timers.NextRun <= :DTNow'
      'union'
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  Macros.Name As DeviceName,'
      '  '#39'Macro'#39' as ButtName'
      'From'
      '  Timers'
      '  Inner Join'
      '  Macros On Timers.MacroID = Macros.ID'
      'where Timers.MacroID <> 0 and'
      '      Timers.NextRun <= :DTNow'
      'Union'
      'Select'
      '  Timers.ID,'
      '  Timers.StartTime,'
      '  Timers.RepeatType,'
      '  Timers.RepeatInterval,'
      '  Timers.MacroID,'
      '  Timers.DeviceID,'
      '  Timers.ButtonID,'
      '  Timers.DeviceType,'
      '  Timers.NextRun,'
      '  Timers.IntervalType,'
      '  Timers.BLRemoteName,'
      '  Timers.DeltaTime,'
      '  Timers.DeltaTimeType,'
      '  Timers.DeltaTimeBA,'
      '  Timers.Location,'
      '  BLButtons.Name as DeviceName,'
      '  BLDevice.Name as ButtName'
      'From'
      '  BLDevice'
      '  Inner Join'
      '  Timers On Timers.BLRemoteName = BLDevice.Name'
      '  Inner Join'
      '  BLButtons On BLButtons.DeviceMac = BLDevice.Mac'
      'where Timers.DeviceID = 0 and'
      '      Timers.MacroID = 0 and'
      '      Timers.NextRun <= :DTNow'
      'Order By 9 asc')
    Left = 278
    Top = 307
    ParamData = <
      item
        Name = 'DTNOW'
        ParamType = ptInput
      end>
  end
  object QGetBLRemotes: TFDQuery
    Connection = FDCBL
    SQL.Strings = (
      'Select'
      '  BLDevice.Name,'
      '  BLDevice.Model,'
      '  BLDevice.Type,'
      '  BLDevice.IP,'
      '  BLDevice.Mac,'
      '  BLDevice.HexType,'
      '  BLDevice.Manufacturer'
      'From'
      '  BLDevice'
      'Where'
      '  BLDevice.Type = '#39'Universal WiFi Remote'#39
      'Order By'
      '  1')
    Left = 278
    Top = 191
  end
end
