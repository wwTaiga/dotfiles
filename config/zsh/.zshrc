# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/taiga/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add path
path=(
    $path
    ~/.cargo/bin
)

# Theme
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
PROMPT='%F{magenta}%1~ %F{white}➜ '
