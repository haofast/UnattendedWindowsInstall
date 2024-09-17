#===[ SYSTEM BEHAVIOR ]===#
  #===[ FILESYSTEM ]===#
    # disable NTFS last access
    fsutil.exe behavior set disableLastAccess 1

    # disable removeable drive indexing
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows" /v "DisableRemovableDriveIndexing" /t REG_DWORD /d 1 /f

    # disable system restore
    Disable-ComputerRestore -Drive "C:\"

  #===[ UPDATE POLICY ]===#
    # set windows automatic update policy to notify before downloading updates
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 2 /f

    # disable auto-reboot when there are logged-in users
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d 1 /f

    # disable delivery optimization
    reg.exe add "HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d 0 /f

  #===[ POWER PLAN ]===#
    # enable processor boost mode control
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "Attributes" /t REG_DWORD /d 2 /f

  #===[ WINDOWS DEFENDER ]===#
    # disable autumatic sample submission
    Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction Continue | Out-Null

  #===[ HIBERNATION ]===#
    # disable fast-boot (hybrid hiberation-shutdown)
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f

    # disable hibernation
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d 0 /f

  #===[ NETWORK ]===#
    # disable remote assistance connections
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f

    # increase IRP stack size for the LanmanServer service to improve network performance and stability
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 32 /f

  #===[ SEARCH ]===#
    # enable "Respect power settings when indexing"
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex" /v "RespectPowerModes" /t REG_DWORD /d 1 /f

  #===[ ACCOUNT ]===#
    # disable password age
    net.exe accounts /maxpwage:UNLIMITED

    # disable the "Allow my organization to manage my device" and "No, sign in to this app only" pop-up message.
    reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin" /v "BlockAADWorkplaceJoin" /t REG_DWORD /d 1 /f


#===[ STUB ]===#
  #===[ FEATURE ]===#
    # disable News and Interests (Widgets)
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests" /v "value" /t REG_DWORD /d 0 /f
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f

    # disable Cortana
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f

    # disable app promotions
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 0 /f

  #===[ AUTO-INSTALL ]=== #
    # stub automatic Chat setup
    reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d 0 /f

    # stub automatic DevHome setup
    reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\DevHomeUpdate" /f

    # stub automatic Outlook setup
    reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate" /f

    # stub automatic OneDrive setup
    Remove-Item "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" -ErrorAction Continue
    Remove-Item "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.exe" -ErrorAction Continue
    Remove-Item "C:\Windows\System32\OneDriveSetup.exe" -ErrorAction Continue
    Remove-Item "C:\Windows\SysWOW64\OneDriveSetup.exe" -ErrorAction Continue


#===[ POST-CONFIGURATION ]===#
  # bypass Microsoft Account creation - This is necessary to skip past creation of an online account
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f

  # disable UAC temporarily - Without UAC disabled, some commands in the post-install script will fail; UAC is renabled later.
  reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f