# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/yagami/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd beep extendedglob nomatch
unsetopt notify
bindkey -e
# End of lines configured by zsh-newuser-install

source ~/.nix-profile/share/autojump/autojump.zsh
export NIXPKGS=~/nixdev/nixpkgs
eval $(thefuck --alias)
