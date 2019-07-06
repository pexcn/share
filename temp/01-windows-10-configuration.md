# Windows 10 配置

### 开启 Administrator 账户

```bash
net user administrator /active:yes
```

### 组策略优化

运行 `gpedit.msc`

1. 计算机配置 — Windows 设置 — 安全设置 — 帐户策略 - 密码策略 — 密码最长使用期限 - 0
2. 计算机配置 — 管理模板 — Windows 组件 — OneDrive — 禁止使用 OneDrive 进行文件存储 — 已启用
3. 计算机配置 — 管理模板 — Windows 组件 — Windows 更新 — Windows 更新不包括驱动程序 — 已启用
4. 计算机配置 — 管理模板 — Windows 组件 — Windows 错误报告 — 禁用 Windows 错误报告 — 已启用
5. 用户配置 — 管理模板 — Windows 组件 — 附件管理器 — 文件附件中不保留区域信息 — 已启用

### 计划任务优化

```bash
# 磁盘碎片整理
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"

# 错误报告
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"

# 磁盘诊断
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"

# Windows Defender
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification"

# .NET Framework
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical"

# Microsoft 客户体验改善计划
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Autochk\Proxy"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"

# 家长控制
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask"

# 网络信息收集器
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo"

# 位置
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\Notifications"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\WindowsActionDialog"

# 地图
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsToastTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask"

# 内存诊断
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"

# 自动磁盘清理
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"

# 杂项
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maintenance\WinSAT"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\WDI\ResolutionHost"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Bluetooth\UninstallDeviceTask"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\UPnP\UPnPHostConfig"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Registry\RegIdleBackup"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary"
SCHTASKS /Change /Disable /TN "\Microsoft\XblGameSave\XblGameSaveTask"
```

### 服务优化

```bash
sc stop AJRouter
sc config AJRouter start= disabled
sc stop ALG
sc config ALG start= disabled
sc stop AppMgmt
sc config AppMgmt start= disabled
sc stop BthAvctpSvc
sc config BthAvctpSvc start= disabled
sc stop BDESVC
sc config BDESVC start= disabled
sc stop wbengine
sc config wbengine start= disabled
sc stop PeerDistSvc
sc config PeerDistSvc start= disabled
sc stop CertPropSvc
sc config CertPropSvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop DsSvc
sc config DsSvc start= disabled
sc stop diagsvc
sc config diagsvc start= disabled
sc stop DPS
sc config DPS start= disabled
sc stop WdiServiceHost
sc config WdiServiceHost start= disabled
sc stop WdiSystemHost
sc config WdiSystemHost start= disabled
sc stop TrkWks
sc config TrkWks start= disabled
sc stop MapsBroker
sc config MapsBroker start= disabled
sc stop EFS
sc config EFS start= disabled
sc stop fhsvc
sc config fhsvc start= disabled
sc stop fdPHost
sc config fdPHost start= disabled
sc stop FDResPub
sc config FDResPub start= disabled
sc stop lfsvc
sc config lfsvc start= disabled
sc stop GraphicsPerfSvc
sc config GraphicsPerfSvc start= disabled
sc stop hidserv
sc config hidserv start= disabled
sc stop HvHost
sc config HvHost start= disabled
sc stop vmickvpexchange
sc config vmickvpexchange start= disabled
sc stop vmicguestinterface
sc config vmicguestinterface start= disabled
sc stop vmicshutdown
sc config vmicshutdown start= disabled
sc stop vmicheartbeat
sc config vmicheartbeat start= disabled
sc stop vmicvmsession
sc config vmicvmsession start= disabled
sc stop vmictimesync
sc config vmictimesync start= disabled
sc stop vmicvss
sc config vmicvss start= disabled
sc stop vmicrdv
sc config vmicrdv start= disabled
sc stop IKEEXT
sc config IKEEXT start= disabled
sc stop irmon
sc config irmon start= disabled
sc stop SharedAccess
sc config SharedAccess start= disabled
sc stop iphlpsvc
sc config iphlpsvc start= disabled
sc stop iphlpsvc
sc config iphlpsvc start= disabled
sc stop IpxlatCfgSvc
sc config IpxlatCfgSvc start= disabled
sc stop PolicyAgent
sc config PolicyAgent start= disabled
sc stop diagnosticshub.standardcollector.service
sc config diagnosticshub.standardcollector.service start= disabled
sc stop wlidsvc
sc config wlidsvc start= disabled
sc stop AppVClient
sc config AppVClient start= disabled
sc stop MSiSCSI
sc config MSiSCSI start= disabled
sc stop InstallService
sc config InstallService start= disabled
sc stop SmsRouter
sc config SmsRouter start= disabled
sc stop NetTcpPortSharing
sc config NetTcpPortSharing start= disabled
sc stop NcdAutoSetup
sc config NcdAutoSetup start= disabled
sc stop NcbService
sc config NcbService start= disabled
sc stop CscService
sc config CscService start= disabled
sc stop PNRPsvc
sc config PNRPsvc start= disabled
sc stop p2psvc
sc config p2psvc start= disabled
sc stop p2pimsvc
sc config p2pimsvc start= disabled
sc stop PhoneSvc
sc config PhoneSvc start= disabled
sc stop PNRPAutoReg
sc config PNRPAutoReg start= disabled
sc stop WPDBusEnum
sc config WPDBusEnum start= disabled
sc stop Spooler
sc config Spooler start= disabled
sc stop PrintNotify
sc config PrintNotify start= disabled
sc stop wercplsupport
sc config wercplsupport start= disabled
sc stop PcaSvc
sc config PcaSvc start= disabled
sc stop QWAVE
sc config QWAVE start= disabled
sc stop SessionEnv
sc config SessionEnv start= disabled
sc stop TermService
sc config TermService start= disabled
sc stop UmRdpService
sc config UmRdpService start= disabled
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled
sc stop RemoteAccess
sc config RemoteAccess start= disabled
sc stop seclogon
sc config seclogon start= disabled
sc stop SensorDataService
sc config SensorDataService start= disabled
sc stop SensrSvc
sc config SensrSvc start= disabled
sc stop SensorService
sc config SensorService start= disabled
sc stop LanmanServer
sc config LanmanServer start= disabled
sc stop shpamsvc
sc config shpamsvc start= disabled
sc stop ShellHWDetection
sc config ShellHWDetection start= disabled
sc stop SCardSvr
sc config SCardSvr start= disabled
sc stop ScDeviceEnum
sc config ScDeviceEnum start= disabled
sc stop SCPolicySvc
sc config SCPolicySvc start= disabled
sc stop SNMPTRAP
sc config SNMPTRAP start= disabled
sc stop SSDPSRV
sc config SSDPSRV start= disabled
sc stop SysMain
sc config SysMain start= disabled
sc stop lmhosts
sc config lmhosts start= disabled
sc stop WalletService
sc config WalletService start= disabled
sc stop TokenBroker
sc config TokenBroker start= disabled
sc stop WebClient
sc config WebClient start= disabled
sc stop WbioSrvc
sc config WbioSrvc start= disabled
sc stop FrameServer
sc config FrameServer start= disabled
sc stop WerSvc
sc config WerSvc start= disabled
sc stop stisvc
sc config stisvc start= disabled
sc stop PushToInstall
sc config PushToInstall start= disabled
sc stop WSearch
sc config WSearch start= disabled
sc stop SDRSVC
sc config SDRSVC start= disabled
sc stop spectrum
sc config spectrum start= disabled
sc stop perceptionsimulation
sc config perceptionsimulation start= disabled
sc stop WManSvc
sc config WManSvc start= disabled
sc stop LicenseManager
sc config LicenseManager start= disabled
sc stop icssvc
sc config icssvc start= disabled
sc stop wisvc
sc config wisvc start= disabled
sc stop LanmanWorkstation
sc config LanmanWorkstation start= disabled
sc stop WwanSvc
sc config WwanSvc start= disabled
sc stop XboxGipSvc
sc config XboxGipSvc start= disabled
sc stop XblAuthManager
sc config XblAuthManager start= disabled
sc stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled
sc stop XblGameSave
sc config XblGameSave start= disabled
sc stop wlpasvc
sc config wlpasvc start= disabled
sc stop SEMgrSvc
sc config SEMgrSvc start= disabled
sc stop camsvc
sc config camsvc start= disabled
sc stop WpcMonSvc
sc config WpcMonSvc start= disabled
sc stop SharedRealitySvc
sc config SharedRealitySvc start= disabled
sc stop BTAGService
sc config BTAGService start= disabled
sc stop bthserv
sc config bthserv start= disabled
sc stop VacSvc
sc config VacSvc start= disabled
sc stop CDPSvc
sc config CDPSvc start= disabled
sc stop RetailDemo
sc config RetailDemo start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop DmEnrollmentSvc
sc config DmEnrollmentSvc start= disabled
sc stop DusmSvc
sc config DusmSvc start= disabled
sc stop LxpSvc
sc config LxpSvc start= disabled
sc stop tzautoupdate
sc config tzautoupdate start= disabled
sc stop NaturalAuthentication
sc config NaturalAuthentication start= disabled
sc stop UevAgentService
sc config UevAgentService start= disabled
sc stop TabletInputService
sc config TabletInputService start= disabled
sc stop CDPUserSvc
sc config CDPUserSvc start= disabled
sc stop CaptureService
sc config CaptureService start= disabled
sc stop ConsentUxUserSvc
sc config ConsentUxUserSvc start= disabled
sc stop PimIndexMaintenanceSvc
sc config PimIndexMaintenanceSvc start= disabled
sc stop DevicePickerUserSvc
sc config DevicePickerUserSvc start= disabled
sc stop BcastDVRUserService
sc config BcastDVRUserService start= disabled
sc stop MessagingService
sc config MessagingService start= disabled
sc stop UserDataSvc
sc config UserDataSvc start= disabled
sc stop UnistoreSvc
sc config UnistoreSvc start= disabled
sc stop DisplayEnhancementService
sc config DisplayEnhancementService start= disabled
sc stop BluetoothUserService
sc config BluetoothUserService start= disabled
sc stop upnphost
sc config upnphost start= disabled
sc stop SstpSvc
sc config SstpSvc start= disabled
sc stop RasMan
sc config RasMan start= disabled
sc stop ssh-agent
sc config ssh-agent start= disabled
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled
sc stop UWPService
sc config UWPService start= disabled
sc stop AtherosSvc
sc config AtherosSvc start= disabled
sc stop igfxCUIService2.0.0.0
sc config igfxCUIService2.0.0.0 start= disabled
sc stop NVDisplay.ContainerLocalSystem
sc config NVDisplay.ContainerLocalSystem start= disabled
sc stop GamingCenter
sc config GamingCenter start= disabled
sc stop ibtsiva
sc config ibtsiva start= disabled
sc stop cplspcon
sc config cplspcon start= disabled
sc stop cphs
sc config cphs start= disabled
sc stop XTU3SERVICE
sc config XTU3SERVICE start= disabled
sc stop IAStorDataMgrSvc
sc config IAStorDataMgrSvc start= disabled

sc stop BITS
sc config BITS start= demand
sc stop W32Time
sc config W32Time start= demand
sc stop WpnService
sc config WpnService start= demand
sc stop WpnUserService
sc config WpnUserService start= demand
sc stop DevicesFlowUserSvc
sc config DevicesFlowUserSvc start= demand

reg add "HKLM\SYSTEM\CurrentControlSet\Services\embeddedmode" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d 4 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 3 /f
```

### 杂项

```bash
# 关闭休眠
powercfg -h off

# 禁用 WfpDiag.ETL 日志
netsh wfp set options netevents = off

# 禁用 Dirty shutdown event 日志
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d 0 /f

# 删除回收站右键 "固定到开始屏幕"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f

# 关闭 Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f

# 关闭 "启用 Windows 安全中心服务" 通知
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\{F56F6FDD-AA9D-4618-A949-C1B91AF43B1A}" /f
```

### SSD 优化

1. 确保 4K 对齐
2. 确保开启 AHCI

3. 关闭系统预读取和启动跟踪

```ini
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnableSuperfetch"=dword:00000000
"EnablePrefetcher"=dword:00000000
"EnableBootTrace"=dword:00000000
```

4. 系统优化

```bash
# 开启 TRIM
fsutil behavior set DisableDeleteNotify 0

# 关闭文件最后访问时间
fsutil behavior set disablelastaccess 1

# 关闭 NTFS journal
fsutil usn deletejournal /n c:
```

```ini
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Wbem\CIMOM]
"Logging"="0"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
"NtfsDisable8dot3NameCreation"=dword:00000001
"NtfsMftZoneReservation"=dword:00000002
"NtfsMemoryUsage"=dword:00000002

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"ClearPageFileAtShutdown"=dword:00000000
"LargeSystemCache"=dword:00000001
```

### 开启硬件加速

注册表搜索 `Acceleration.Level`, 确保值全部都为 `0`

### Shift + 右键 "在此处打开命令窗口"

给注册表的相关路径赋予 `Administrators` 权限，再把相关的键改名，改完之后再把相关路径还原为 `NT SERVICE\TrustedInstaller`

```bash
HKEY_CLASSES_ROOT\Directory\background\shell\cmd
HideBasedOnVelocityId -> ShowBasedOnVelocityId

HKEY_CLASSES_ROOT\Directory\background\shell\Powershell
ShowBasedOnVelocityId -> HideBasedOnVelocityId
```

### 含有小写字母的计算机名

到 `设置 — 系统 — 关于 — 重命名这台电脑` 里修改。

或者

计算机名：`Vanilla`, 先在计算机属性把计算机名设置为 Vanilla, 它会自动变成大写，然后导入以下注册表：
```ini
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ComputerName]
"ComputerName"="Vanilla"

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName]
"ComputerName"="Vanilla"

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Tcpip\Parameters]
"NV Hostname"="Vanilla"
"Hostname"="Vanilla"
```

### `Consolas` 字体 FontLink 到微软雅黑

```ini
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
"Consolas"=hex(7):4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,\
  69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,\
  00,69,00,20,00,55,00,49,00,2c,00,31,00,32,00,38,00,2c,00,39,00,36,00,00,00,\
  4d,00,53,00,59,00,48,00,2e,00,54,00,54,00,43,00,2c,00,4d,00,69,00,63,00,72,\
  00,6f,00,73,00,6f,00,66,00,74,00,20,00,59,00,61,00,48,00,65,00,69,00,20,00,\
  55,00,49,00,00,00,00,00
```

### 调整 cmd 字体

```bash
# 修改活动代码页为 437
chcp 437

# 修改 cmd 的字体和其他设置

# 最后还原活动代码页为 936
chcp 936
```
