# Check if transcription is enabled
# Define the path to the registry key
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Define the name of the registry value to check = VALUENAME
$Name = "EnableTranscripting"

# Define the expected value of the registry value = VALUE DATA
$Value = "1"

# Retrieve the value of the registry value
$Registry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name

# If the registry value matches the expected value, output "Compliant"
If ($Registry -eq $Value){
    Write-Output "Compliant"
    Exit 0
}

# If the registry value does not match the expected value, output "Non Compliant"
Else {
    Write-Warning "Not Compliant"
    Exit 1
}