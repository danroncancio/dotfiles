#Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt M365Princess

#Env
$Env:XDG_CONFIG_DIRS = 'C:\Users\Daniel\'

#Icons
Import-Module -Name Terminal-Icons

#PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#Alias
Set-Alias v nvim
Set-Alias ll ls
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

#Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
