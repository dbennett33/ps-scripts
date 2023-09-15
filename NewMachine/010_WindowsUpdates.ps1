Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Confirm:$false
Install-Module PSWindowsUpdate
Get-WindowsUpdate -Verbose
Install-WindowsUpdate -Confirm:$false -Verbose