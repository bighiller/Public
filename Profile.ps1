
function Connect-O365 
{
#requires -RunAsAdministrator
#Check for MSOLService module
#Check for Exchange Online module
#Check for Azure AD module
If(!(get-module | where name -eq "Microsoft.Exchange.Management.ExoPowershellModule"))
{Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") -Filter Microsoft.Exchange.Management.ExoPowershellModule.dll -Recurse ).FullName|?{$_ -notmatch "_none_"}|select -First 1)}
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowBasic" -Value 1 | out-null
Connect-EXOPSSession
Connect-MsolService
}
