
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

# checking what's in the index, exactly
alias gdc="git diff --cached"

# which freaking process id is using that port so I can kill -9 it?
# USAGE: psbyport <port-number>
find_ps_by_port() {
  netstat -pal --numeric-ports | sed -n 's/.*\:'"$1"'[[:space:]]\+.*LISTEN[[:space:]]*\([[:digit:]]\+\)\/.*/\1/p'
}
# this works on OSX
find_ps_by_port() {
  lsof -i tcp:$1
}
alias psbyport='find_ps_by_port'

# make a named gif from an mp4, mpg, or other movie file, requires node and npm:gify to be globally installed
alias nodegif='node --eval "require(\"gify\")(process.argv[2], process.argv[3] || \"out.gif\")"'

# foolish but effective way to generate UUIDs on the command line for mock data, etc; requires node and npm:uuid globally installed
alias uuid='node --eval "console.log(require(\"uuid\").v4())"'

# concatenate a few movie files listed line by line in the movie.txt file
# format is: 
## file './foo.mpg'
## file './foo2.mpg'
alias concatmovie='ffmpeg -f concat -safe 0 -i movie.txt -c copy output.mpg'
