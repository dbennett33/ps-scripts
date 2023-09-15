."$PSScriptRoot/NewMachine.Functions.ps1"
## POWER SETTINGS

#Set high performance power plan
Set-HighPerformancePowerPlan

# Set sleep to never
powercfg /change standby-timeout-ac 0
Write-Host "Sleep setting has been set to 'Never' when the PC is plugged in."


## WINDOWS SETTINGS

# Hide the Windows Taskbar search box
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0

# Hide the Windows Task View button
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Force

# Disable News and interests
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"
$RegistryName = "ShellFeedsTaskbarViewMode"
Set-ItemProperty -Path $RegistryPath -Name $RegistryName -Value 2 -Force
Write-Host "News and interests has been disabled."

#Show file extensions and hidden files in explorer
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -value 1


# Restart the Explorer shell to apply changes !
Stop-Process -Name "explorer" -Force
#Start-Process -Name "explorer"    
Write-Host "Windows Taskbar search has been set to 'Hidden'."