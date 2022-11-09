## This script requires powershell version 7 or greater. 

if ($PSVersionTable.PSVersion.Build -ge 7 ) {
    $Credntial = Get-Credential
    $Services = Get-WmiObject win32_service | Where-Object {$_.Name -match 'zVision'} 
    Foreach ($Service in $Services) {
    Set-Service -Name $Service.Name -credential $Credntial
    write-host "Setting credentials for $service"
    }
}else {
    Write-host "This script requires Powershell Version 7 or greater. Please upgrade to the latest version and run the script again."
}
