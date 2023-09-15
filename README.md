# posh-scripts
some of my powershell scripts and utilities

### [rand-asciicat](https://github.com/dulldesk/rand-asciicat)

Prints a random asciicat; useful as a greeting on launch.

### [pomodoro](https://gist.github.com/dulldesk/95060d14da1238d6eed9676b8d215d24)

Pomodoro timer

### [profile.ps1](./Microsoft.PowerShell_profile.ps1)

Profile script that runs on launch. Includes aliases, config, and:
* `refreshenv`: refresh environment path variables
* `lsm`: compact version of `ls`
* `global:prompt`: changes the shell [prompt](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts)


### [ls-recent](./ls-recent.ps1)

`ls` but for the `n` most recently modified files; `n=5` by default

### [recycle](./recycle.ps1)

Recycle files and folders.

### [strip-bom](./strip-bom.ps1)

Removes the [byte order mark](https://en.wikipedia.org/wiki/Byte_order_mark) from the beginning of a file.

### [play](./play.ps1)

Play .wav audio files from the terminal. Usage: `play [file]`, params: `-loop`, `-stop`

### [tiny-url](./tiny-url.ps1)

Shorten urls with [tinyurl.com](https://tinyurl.com/). Usage: `tiny <url>`
