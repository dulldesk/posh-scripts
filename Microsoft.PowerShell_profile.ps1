& "$PSScriptRoot\rand-asciicat\random-asciicat.ps1"

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

function lsm {
  get-childitem @args | select-object name, lastwritetime, mode
}

. $PSScriptRoot\ls-recent.ps1      # ls-rec
. $PSScriptRoot\strip-bom.ps1      # sb
. $PSScriptRoot\recycle.ps1   	   # recycle
. $PSScriptRoot\pomodoro\pomodoro.ps1
. $PSScriptRoot\tiny-url.ps1
. $PSScriptRoot\wget-drive.ps1

$downloads = "$home\Downloads"

set-alias l ls
set-alias gti git
set-alias got git
set-alias igt git

set-alias start dolphin

function conf {
  param([switch]$HomeManager=$false)
  if (-not $HomeManager) {
    sudo nvim /etc/nixos
  } else {
    nvim ~/.config/home-manager
  }
}

$env:EDITOR = 'nvim'

$env:PATH = [Environment]::GetEnvironmentVariable("PATH") + ":/home/puffin/.cargo/bin"

function global:prompt {return "PS $((pwd | select-object -exp path).replace($home,"~").replace("\Documents\schol","📎"))> "}

if ($isWindows) {
function refreshenv {
  param([switch]$Silent=$False)
  $env:PATH = [Environment]::GetEnvironmentVariable("PATH")
  if (-not $Silent) {write-host "Refreshed (path) environment variables"}
}

. $PSScriptRoot\play.ps1

set-alias unzip expand-archive
set-alias zip compress-archive

function cold {choco outdated}
function sold {scoop old}
function wold {winget upgrade @args}
function sclr {scoop cache rm *; scoop cleanup *; rm "$ENV:tmp\chocolatey\*" -rec -force -confirm; rm "$ENV:USERPROFILE\AppData\Local\NuGet\Cache\*" -rec -force -confirm; rm "$ENV:ChocolateyInstall\lib-bad\*" -rec -force -confirm; rm "$ENV:ChocolateyInstall\lib-bkp\*" -rec -force -confirm; Write-Host "Cleared scoop and choco cache"}
}

Import-Module posh-git
