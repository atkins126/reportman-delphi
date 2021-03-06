; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Report Manager TCP Client and metafile viewer
AppVerName=Report Manager TCP Client 2.8a
AppVersion=2.8a
OutputBaseFilename=reportmanclient2_8a
AppPublisher=Toni Martir
AppPublisherURL=http://reportman.sourceforge.net
AppSupportURL=http://sourceforge.net/projects/reportman
AppUpdatesURL=http://sourceforge.net/projects/reportman
DefaultDirName={pf}\Report Manager
DefaultGroupName=Report Manager
LicenseFile=license.txt
PrivilegesRequired=admin
LanguageDetectionMethod=uilanguage
WizardImageFile=HardwareClassic05.bmp
WizardImageStretch=False
WizardSmallImageFile=SetupModernSmall02.bmp
; uncomment the following line if you want your installation to run on NT 3.51 too.
; MinVersion=4,3.51

[Types]
Name: full; Description: {cm:Fullinstallation}
Name: custom; Description: {cm:Custominstallation}; Flags: iscustom

[Components]
Name: clienttcp; Description: {cm:TCPclientandmetafileviewer}; Types: full custom

[Languages]
Name: en; MessagesFile: EnglishT.isl
Name: de; MessagesFile: GermanT.isl
Name: es; MessagesFile: SpanishT.isl
Name: cat; MessagesFile: CatalanT.isl
Name: pt; MessagesFile: PortugueseT.isl
Name: it; MessagesFile: ItalianT.isl
Name: fr; MessagesFile: FrenchT.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: Additional icons:; MinVersion: 4,4
;Name: "quicklaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4; Flags: unchecked

[Files]
Source: ..\repman\reportmanres.*; DestDir: {app}; Flags: restartreplace
Source: ..\repman\transwin\metaviewxp.*; DestDir: {app}; Components: clienttcp; Flags: ignoreversion
Source: ..\repman\utils\metaview\metaviewxp.exe.manifest; DestDir: {app}; Components: clienttcp; Flags: ignoreversion
Source: ..\repman\utils\metaview\metaviewxp.exe; DestDir: {app}; Components: clienttcp; Flags: ignoreversion
Source: license.txt; DestDir: {app}; Flags: ignoreversion
Source: ..\drivers\win32\upx.exe; DestDir: {sys}; Flags: restartreplace



[Registry]
Root: HKCR; Subkey: .rpmf; Components: clienttcp; ValueType: string; ValueName: ; ValueData: Report Manager Client; Flags: uninsdeletevalue
Root: HKCR; Subkey: Report Manager Client; Components: clienttcp; ValueType: string; ValueName: ; ValueData: Report Manager Metafile; Flags: uninsdeletekey
Root: HKCR; Subkey: Report Manager Client\DefaultIcon; Components: clienttcp; ValueType: string; ValueName: ; ValueData: {app}\metaviewxp.exe,0
Root: HKCR; Subkey: Report Manager Client\shell\open\command; Components: clienttcp; ValueType: string; ValueName: ; ValueData: """{app}\metaviewxp.exe"" ""%1"""

[Icons]
Name: {group}\{cm:MetafileViewerandReportClientXP}; Filename: {app}\metaviewxp.exe; Components: clienttcp; WorkingDir: {app}
Name: {group}\{cm:SLicense}; Filename: {app}\license.txt
Name: {userdesktop}\{cm:ReportManagerClient}; Filename: {app}\metaviewxp.exe; WorkingDir: {app}; Components: clienttcp; MinVersion: 4,4; Tasks: desktopicon

[Run]
Filename: {app}\metaviewxp.exe; Description: Ejecutar Cliente de informes; Components: clienttcp; Flags: nowait postinstall skipifsilent
