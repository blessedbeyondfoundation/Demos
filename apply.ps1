#Set-StrictMode -Version Latest
#####################################################
# Apply
#####################################################
<#PSScriptInfo

.VERSION 0.1

.GUID 602bc07e-a621-4738-8c27-0edf4a4cea8e

.AUTHOR David Walker, Sitecore Dave, Radical Dave

.COMPANYNAME David Walker, Sitecore Dave, Radical Dave

.COPYRIGHT David Walker, Sitecore Dave, Radical Dave

.TAGS sitecore powershell local install iis solr

.LICENSEURI https://github.com/SitecoreDave/SharedSitecore.SitecoreLocal/blob/main/LICENSE

.PROJECTURI https://github.com/SitecoreDave/SharedSitecore.SitecoreLocal

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
- see README.md

#>

<#
.SYNOPSIS
Apply

.DESCRIPTION
PowerShell script that helps you Applymate All The Things!

.EXAMPLE
PS> Apply 'name'

PS> Apply az armtemplate.json

.EXAMPLE
PS> Apply 'name' 'template'

.EXAMPLE
PS> Apply 'name' 'template' 'd:\repos'

.Link
https://github.com/Radical-Dave/Apply

.OUTPUTS
    System.String
#>
[CmdletBinding(SupportsShouldProcess=$true)]
Param(
    [Parameter(Mandatory = $false, Position=0)]
	[string] $data = '',
    [Parameter(Mandatory = $false, Position=1)]
	[string] $baseFolder = ''#,    
	# [Parameter(Mandatory = $false, Position=1)]
	# [string] $action = 'help',
)
begin {
    $Global:ErrorActionPreference = 'Stop'
	$PSScriptName = ($MyInvocation.MyCommand.Name.Replace(".ps1",""))
	$PSScriptVersion = (Test-ScriptFileInfo -Path $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty Version)
	$PSCallingScript = if ($MyInvocation.PSCommandPath) { $MyInvocation.PSCommandPath | Split-Path -Parent } else { $null }
	Write-Verbose "#####################################################"
    $cwd = $PWD
    if (!$baseFolder) { $baseFolder = $cwd}
    $path = "$baseFolder\$data"
    Write-Host "# $baseFolder\$data"
	Write-Host "# $PSScriptRoot/$PSScriptName $($PSScriptVersion):$data $path called by:$PSCallingScript" -ForegroundColor White    
}
process {
    set-location $path
    terraform.exe fmt
    terraform.exe init
    terraform.exe plan
    #terraform.exe apply -Apply-approve

    Set-Location $cwd
}
