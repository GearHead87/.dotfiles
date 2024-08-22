# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-path $PSScriptRoot ".\gearhead.omp.json" 
oh-my-posh init pwsh --config $omp_config | Invoke-Expression

#Icons
Import-Module Terminal-Icons

#Z
Import-Module z

#PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Users\hosan\scoop\apps\git\current\usr\bin\tig.exe'
Set-Alias less 'C:\Users\hosan\scoop\apps\git\current\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
