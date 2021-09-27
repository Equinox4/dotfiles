function title() {
  p1='echo -ne "\033]0;'
  p2='\007"'
  PROMPT_COMMAND=$p1$@$p2
  unset p1
  unset p2
}

alias ls='ls $LS_OPTIONS'
alias ll='ls -l $LS_OPTIONS'
alias la='ls -la $LS_OPTIONS'

alias tmux='tmux -f ~/.config/tmux/tmux.conf new -AD -s vs'

alias title='title'
alias df='df -h'
alias reload='source ~/.bashrc'
alias firefox='firefox &2> /dev/null'
alias thunderbird='thunderbird &'

#### typos nano grmbl ####
alias nani='nano'
alias naon='nano'
alias nao='nano'
alias ano='nano'
alias nan='nano'

alias unzip='unzip -s'
alias dd='dd status=progress'
alias pwd='pwd -P'
