[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$adminUsername,
	
  [Parameter(Mandatory=$True,Position=2)]
  [string]$adminPassword,

  [Parameter(Mandatory=$True,Position=3)]
  [string]$domainName,

  [Parameter(Mandatory=$True,Position=4)]
  [string]$serverName
)
$adminSecurePassword = ConvertTo-SecureString -String $adminPassword -AsPlainText -Force
$joinADcredential = New-Object System.Management.Automation.PSCredential ($adminUsername, $adminSecurePassword)

Add-Computer -Credential $joinADcredential -DomainName $domainName -NewName $serverName;Restart-Computer -Force