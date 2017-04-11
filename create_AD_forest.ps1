[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
   [string]$domainName,
	
   [Parameter(Mandatory=$True,Position=2)]
   [string]$forestMode,

  [Parameter(Mandatory=$True,Position=3)]
  [Security.SecureString]$password
)

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 2>> c:\log1.txt
#Install-ADDSForest -DomainName $domainName -ForestMode $forestMode -SafeModeAdministratorPassword $password -Force | Out-File c:\log2.txt