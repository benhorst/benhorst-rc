
# common stuff that makes me feel good
alias ll='ls -l'
alias cl='clear'

# 'change directory up n times'
# 'cd ..' n times
# USAGE: 'cdu 5' to jump up 5 directories
cdu () {
      set -A ud
      ud[1+${1-1}]=
      cd ${(j:../:)ud}
}

# Netstat pretty Ports in Less
alias npl='netstat -pal --numeric-ports | less'

# my git shortcuts
alias uhohfixme='git reset --hard -f HEAD'

# useful for oh-my-zsh users that have lots of nice git shortcuts but forgot them all
function helpmegit() {
 sed -n 's/alias \(.*=.*\)/   \1/p' $ZSH/plugins/git/git.plugin.zsh
}

# find line diff stats for a git project from one commit to HEAD
# USAGE: gstats <author> <start-commit>
function gstats() {
 git log --numstat --pretty="%H" --author=$1 $2..HEAD | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("+%d, -%d\n"    , plus, minus)}'
}

# my favorite way to add to the git index
alias gap="git add --patch"

# which freaking process id is using that port so I can kill -9 it?
# USAGE: psbyport <port-number>
find_ps_by_port() {
  netstat -pal --numeric-ports | sed -n 's/.*\:'"$1"'[[:space:]]\+.*LISTEN[[:space:]]*\([[:digit:]]\+\)\/.*/\1/p'
}
alias psbyport='find_ps_by_port'
