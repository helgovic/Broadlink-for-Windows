// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program WinBroadlink;

uses
  Vcl.Forms,
  UFBroadlink in 'UFBroadlink.pas' {FBroadlink},
  Vcl.Themes,
  Vcl.Styles,
  UFAddDevice in 'UFAddDevice.pas' {FAddDevice},
  UFAddButton in 'UFAddButton.pas' {FAddButton},
  UFBLDev in 'UFBLDev.pas' {FBLDevName},
  UFMacros in 'UFMacros.pas' {FMacros},
  UFNewMacro in 'UFNewMacro.pas' {FNewMacro},
  UFAddMacroButton in 'UFAddMacroButton.pas' {FAddMacroButton},
  UFSetUpBl in 'UFSetUpBl.pas' {FSetUpBL},
  UFInstructions in 'UFInstructions.pas' {FInstructions},
  UDMBroadlink in 'UDMBroadlink.pas' {DMBroadlink: TDataModule},
  UFShareInfo in 'UFShareInfo.pas' {FShareInfo},
  UFAddLightButton in 'UFAddLightButton.pas' {FAddLightButton},
  UFTimers in 'UFTimers.pas' {FTimers},
  UFrTimer in 'UFrTimer.pas' {FrTimer: TFrame},
  UFAddTimer in 'UFAddTimer.pas' {FAddTimer},
  UFLocations in 'UFLocations.pas' {FLocations},
  UFNewLocation in 'UFNewLocation.pas' {FNewLocation},
  GpTimezone in '..\Utils\GpTimezone.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.CreateForm(TDMBroadlink, DMBroadlink);
  Application.CreateForm(TFBroadlink, FBroadlink);
  Application.CreateForm(TFAddDevice, FAddDevice);
  Application.CreateForm(TFAddButton, FAddButton);
  Application.CreateForm(TFBLDevName, FBLDevName);
  Application.CreateForm(TFMacros, FMacros);
  Application.CreateForm(TFNewMacro, FNewMacro);
  Application.CreateForm(TFAddMacroButton, FAddMacroButton);
  Application.CreateForm(TFSetUpBL, FSetUpBL);
  Application.CreateForm(TFInstructions, FInstructions);
  Application.CreateForm(TFShareInfo, FShareInfo);
  Application.CreateForm(TFAddLightButton, FAddLightButton);
  Application.CreateForm(TFTimers, FTimers);
  Application.CreateForm(TFAddTimer, FAddTimer);
  Application.CreateForm(TFLocations, FLocations);
  Application.CreateForm(TFNewLocation, FNewLocation);
  Application.Run;
end.
