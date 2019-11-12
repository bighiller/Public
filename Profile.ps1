
function Connect-O365 
{
#requires -RunAsAdministrator
#Check for MSOLService module
#Check for Exchange Online module
#Check for Azure AD module
$CreateEXOPSSession = (Get-ChildItem -Path $env:userprofile -Filter CreateExoPSSession.ps1 -Recurse -ErrorAction SilentlyContinue -Force | Select -Last 1).DirectoryName
. "$CreateEXOPSSession\CreateExoPSSession.ps1"
Connect-MsolService
}
