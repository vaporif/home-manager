export PATH="/opt/homebrew/bin:$PATH"

ulimit -Sn 4096      # Increase open files.
ulimit -Sl unlimited # Increase max locked memory.

alias ghc="gh pr create -a @me"
alias ghl="gh pr list"
alias ghm="gh pr merge -d"
