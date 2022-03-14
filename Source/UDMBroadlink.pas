unit UDMBroadlink;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Uni, Data.DB, MemDS, DBAccess,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, MySQLUniProvider, MemData;

type
  TDMBroadlink = class(TDataModule)
    FDCBL: TFDConnection;
    QGetManufacturerByName: TFDQuery;
    QCreateDB: TFDQuery;
    QDellButton: TFDQuery;
    QDelMacroButton: TFDQuery;
    QDelMacroButtons: TFDQuery;
    QGetBLDevByName: TFDQuery;
    QGetButtonID: TFDQuery;
    QGetButtons: TFDQuery;
    QGetCode: TFDQuery;
    QGetMacroID: TFDQuery;
    QGetMacroByName: TFDQuery;
    QGetMacroButtons: TFDQuery;
    QGetDeviceID: TFDQuery;
    QGetDeviceByName: TFDQuery;
    QGetDevFromManuModel: TFDQuery;
    QGetManufacturerID: TFDQuery;
    TBLDevice: TFDTable;
    TButtons: TFDTable;
    TDevice: TFDTable;
    TMacros: TFDTable;
    TManufacturers: TFDTable;
    TMMMacroButton: TFDTable;
    UCCommonDB: TUniConnection;
    QCommonGetDevice: TUniQuery;
    QCommonGetDeviceButtons: TUniQuery;
    QGetCommonManufacturerByName: TUniQuery;
    QGetCommonManuModels: TUniQuery;
    TCommonButtons: TUniTable;
    TCommonDevice: TUniTable;
    TCommonManufacturers: TUniTable;
    QCommonGetManufacturerID: TUniQuery;
    QGetManufacturerModels: TFDQuery;
    QCommonGetDeviceID: TUniQuery;
    QGetDeviceButtons: TFDQuery;
    QGetCommonButtonID: TUniQuery;
    QGetCommonDeviceButton: TUniQuery;
    QGetDevices: TFDQuery;
    QCommonGetManufacturers: TUniQuery;
    QGetCommonButtonByCode: TUniQuery;
    QFindButtonOther: TFDQuery;
    QGetDeviceOther: TFDQuery;
    QGetBLDevices: TFDQuery;
    TBLButtons: TFDTable;
    QGetBLButton: TFDQuery;
    QGetBLButtonID: TFDQuery;
    QGetBLButtons: TFDQuery;
    TTimers: TFDTable;
    QGetTimerID: TFDQuery;
    QGetTimers: TFDQuery;
    TLocations: TFDTable;
    QGetLocations: TFDQuery;
    QResetDefaultLocation: TFDQuery;
    QGetLocRestr: TFDQuery;
    QGetMacroRestr: TFDQuery;
    QGetLocation: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure UCCommonDBConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBroadlink: TDMBroadlink;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMBroadlink.DataModuleCreate(Sender: TObject);
begin

   UCCommonDB.Options.LocalFailover := True;

end;

procedure TDMBroadlink.UCCommonDBConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin

   RetryMode := rmReconnectExecute;

end;

end.






