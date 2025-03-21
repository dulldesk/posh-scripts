& "$PSScriptRoot\rand-asciicat\random-asciicat.ps1"

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

function refreshenv {
  param([switch]$Silent=$False)
  $env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")
  if (-not $Silent) {write-host "Refreshed (path) environment variables"}
}

function lsm {
  get-childitem @args | select-object name, lastwritetime, mode
}


. $PSScriptRoot\ls-recent.ps1      # ls-rec
. $PSScriptRoot\strip-bom.ps1      # sb
. $PSScriptRoot\recycle.ps1   	   # recycle
. $PSScriptRoot\pomodoro\pomodoro.ps1
. $PSScriptRoot\play.ps1
. $PSScriptRoot\tiny-url.ps1
. $PSScriptRoot\wget-drive.ps1

$downloads = "$home\Downloads"

set-alias l ls
set-alias gti git
set-alias got git
set-alias unzip expand-archive
set-alias zip compress-archive

function global:prompt {return "PS $((pwd | select -exp path).replace($home,"~").replace("\Documents\schol","📎"))> "}

function cold {choco outdated}
function sold {scoop old}
function wold {winget upgrade @args}
function sclr {scoop cache rm *; scoop cleanup *; rm "$ENV:tmp\chocolatey\*" -rec -force -confirm; rm "$ENV:USERPROFILE\AppData\Local\NuGet\Cache\*" -rec -force -confirm; rm "$ENV:ChocolateyInstall\lib-bad\*" -rec -force -confirm; rm "$ENV:ChocolateyInstall\lib-bkp\*" -rec -force -confirm; Write-Host "Cleared scoop and choco cache"}

Import-Module posh-git
