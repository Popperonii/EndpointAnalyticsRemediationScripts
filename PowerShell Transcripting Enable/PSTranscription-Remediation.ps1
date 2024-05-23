# Check if transcription is enabled
# Define the path to the registry key
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Define the name of the registry value to check = VALUENAME
$Name = "EnableTranscripting"

# Define the expected value of the registry value = VALUE DATA
$Value = "1"

Write-Warning "Not Compliant. Attempting remediation..."
# Set the registry value to the expected value
Set-ItemProperty -Path $Path -Name $Name -Value $Value -Force
# Verify remediation
$RemediatedRegistry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name
if ($RemediatedRegistry -eq $Value) {
    Write-Output "Fixed"
    Exit 0
} else {
    Write-Warning "Remediation failed"
    Exit 1
}
