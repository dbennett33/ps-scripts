# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol `
-bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install git
choco install git -y


if (Test-Path -Path "C:\ps-scripts" -PathType Container)
{
    cd "C:\ps-scripts"
    git pull
}
else {
    cd "C:\"
    git clone https://github.com/dbennett33/ps-scripts.git
}
 
cd "C:\ps-scripts\NewMachine"