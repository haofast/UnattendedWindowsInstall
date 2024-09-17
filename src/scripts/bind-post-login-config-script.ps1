# load default user data profile
reg.exe load "HKU\DefaultUser" "C:\Users\Default\NTUSER.DAT"

# bind configuration script for system settings to the default user runonce registry; this registry change gets copied over to any newly created user
reg.exe add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Runonce" /v "currentuser" /t REG_SZ /d "C:\Windows\Setup\Scripts\apply-post-login-config.cmd" /f

# unload default user data profile
reg.exe unload "HKU\DefaultUser"