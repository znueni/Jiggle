# Use this Powershell script to create an Autostart item for running the Jiggler script every time you boot/login
# This uses a little trick, which lets no visible window appear: It actually runs a mini powershell script which itself uses the Process API to start the Jiggle powershell script without a hidden window :)


#rem Set the path to the jiggle script here. Avoid blanks - ie.e move the file to a path where there are no blanks involved.
$PathToYourMouseJigglerWithoutBlanks="C:\Temp\Jiggle.ps1"

$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$Name = "Mouse"
$value = '$s=(New-Object System.Diagnostics.ProcessStartInfo);$s.Arguments=''-ExecutionPolicy Unrestricted -NoExit -File '+$PathToYourMouseJigglerWithoutBlanks+''';$s.FileName=''powershell.exe'';$s.WindowStyle=[System.Diagnostics.ProcessWindowStyle]::Hidden; [System.Diagnostics.Process]::Start($s)'
$value = "powershell ""$value"""
clear
New-ItemProperty -Path $RegistryPath -Name $Name -Value $value -PropertyType String -Confirm



 
