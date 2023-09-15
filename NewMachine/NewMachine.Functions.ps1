
function Set-HighPerformancePowerPlan {
    # Get the list of available power plans
    $powerPlans = powercfg /list | Select-String "([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})"

    # Iterate through the list to find the 'High Performance' power plan
    foreach ($plan in $powerPlans) {
        $matches = $plan | Select-String -Pattern "High Performance"
        if ($matches) {
            $guid = $matches.Matches[0].Groups[1].Value
            # Set the 'High Performance' plan as active
            powercfg /setactive $guid
            Write-Host "Power plan set to 'High Performance' with GUID: $guid"
            return
        }
    }

    Write-Host "Error: 'High Performance' power plan not found."
}



function Remove-PinnedAppFromTaskBar {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $AppName
    )
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() |
    Where-Object {$_.Name -eq $AppName}).Verbs() | Where-Object {$_.Name.replace('&','') -match 'Unpin from taskbar'} | ForEach-Object {$_.DoIt()}
}


