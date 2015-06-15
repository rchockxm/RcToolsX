; Rchockxm

[ISSI]
#define ISSI_WizardImages "1"
#define ISSI_ChineseTrad
#define ISSI_About "{cm:issiAbout}"
#define ISSI_GenerateSerial

#define ISSI_BeveledLabel "Rchockxm Tools Test"

#define ISSI_IncludePath "C:\ISSI"
#include ISSI_IncludePath+"\_issi.isi"

[Setup]
AppName=RcToolsX Example
AppVerName=RcToolsX Example v1.3
AppVersion=1.3
AppPublisher=Rchockxm
AppPublisherURL=http://rchockxm.pp.ru/
AppSupportURL=http://rchockxm.pp.ru/
AppUpdatesURL=http://rchockxm.pp.ru/archives/rctoolsx
AppCopyright=Silence Unlimited
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=RcToolsX Example

DefaultDirName={pf}\RcTools
DefaultGroupName=RcToolsX

Compression=lzma
SolidCompression=yes

VersionInfoCompany=Silence Unlimited
VersionInfoCopyright="Copyright(C) 2010 Silence Unlimited"
VersionInfoDescription="RcToolsX Example Setup"
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion=1.3.0.0
VersionInfoTextVersion=1.3.0.0

[Files]
//Source: ISSkin.dll; DestDir: {app}; Flags: dontcopy
//Source: Office2007.cjstyles; DestDir: {tmp}; Flags: dontcopy

[CustomMessages]
cht.issiAbout=Rchockxm Tools Test Form http://rchockxm.com/

[Code]
//procedure LoadSkin(lpszPath: String; lpszIniFileName: String);
//external 'LoadSkin@files:isskin.dll stdcall';

//procedure UnloadSkin();
//external 'UnloadSkin@files:isskin.dll stdcall';

//function ShowWindow(hWnd: Integer; uType: Integer): Integer;
//external 'ShowWindow@user32.dll stdcall';

//function InitializeSetup(): Boolean;
//begin
	//ExtractTemporaryFile('Office2007.cjstyles');
	//LoadSkin(ExpandConstant('{tmp}\Office2007.cjstyles'), 'NormalBlack.ini');
	//Result := True;
//end;

//procedure DeinitializeSetup();
//begin
	//ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	//UnloadSkin();
//end;







