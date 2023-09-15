#Install vscode
choco install vscode -y

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

#Install vscode extensions
code --install-extension ms-vscode.powershell
code --install-extension github.copilot

