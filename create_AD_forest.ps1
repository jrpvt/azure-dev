[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$domainName,
	
  [Parameter(Mandatory=$True,Position=2)]
  [string]$forestMode,

  [Parameter(Mandatory=$True,Position=3)]
  [string]$dsrmPassword
)
$dsrmSecurePassword = ConvertTo-SecureString -String $dsrmPassword -AsPlainText -Force
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName $domainName -ForestMode $forestMode -SafeModeAdministratorPassword $dsrmSecurePassword -Force