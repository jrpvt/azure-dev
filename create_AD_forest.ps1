[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
   [string]$domainName,
	
   [Parameter(Mandatory=$True,Position=2)]
   [string]$forestMode,

  [Parameter(Mandatory=$True,Position=3)]
  #[Security.SecureString]$password
  [string]$password
)
$password1 = Convert-To-SecureString -String $password -AsPlainText -Force
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName $domainName -ForestMode $forestMode -SafeModeAdministratorPassword $password1 -Force