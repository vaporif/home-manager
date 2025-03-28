export PATH="/opt/homebrew/bin:$PATH"

ulimit -Sn 4096      # Increase open files.
ulimit -Sl unlimited # Increase max locked memory.

alias ghc="gh pr create --title "$(git log --reverse --pretty=format:"%s" $(git merge-base HEAD origin/main)..HEAD | head -1)""
alias ghl="gh pr list"
alias ghm="gh pr merge"
