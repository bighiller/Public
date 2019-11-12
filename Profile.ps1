#My Profile
function Connect-O365 
{
#Check for MSOLService module
#Check for Exchange Online module
#Check for Azure AD module
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowBasic" -Value 1 | out-null
Import-Module $((Get-ChildItem -Path $($env:LOCALAPPDATA+"\Apps\2.0\") -Filter Microsoft.Exchange.Management.ExoPowershellModule.dll -Recurse ).FullName|?{$_ -notmatch "_none_"}|select -First 1)
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell/" -Authentication Basic -AllowRedirection
Import-PSSession $Session
Connect-MsolService
}
