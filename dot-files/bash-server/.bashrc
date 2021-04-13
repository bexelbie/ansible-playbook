# Make sure everyone knows the EDITOR
export EDITOR=/usr/bin/vim

# Ansible
# no cows
export ANSIBLE_NOCOWS=1

# Path
export PATH=$PATH:$HOME/bin

# Manpath - I store my manpages next to their binaries
export MANPATH=$HOME/bin:$MANPATH

# History Timestamps
HISTTIMEFORMAT="%H:%M "

# Keep a lot of commands
export HISTSIZE=10000

# User specific aliases and functions
alias cat=bat
alias vi=vim
alias mv='mv -i'
alias cp='cp -i'
alias grep="rg --maxdepth 0"
alias nobash="HISTFILE=/dev/null /bin/bash"
alias myip="curl http://ipecho.net/plain; echo"
alias ssh-no="ssh -o PubkeyAuthentication=no"
alias wgrep="grep -nw --color=auto -- "
alias wdiff="git diff --word-diff=color"

function pullpr {
    remote="${2:-upstream}"
    git fetch $remote pull/$1/head:pr_$1
    git checkout pr_$1
}

# Podman helpers
alias podman-killall='podman rm -f `sudo podman ps -aq`'
alias podman-cleanall='podman rm -f `sudo podman ps -aq`;podman rmi `podman images -f dangling=true -qa`'
alias podman-rmdangle='podman rmi $(podman images -f "dangling=true" -q)'
alias tempcentos='podman run -i -t --privileged -v `pwd`:/workdir --rm=true centos /bin/bash'
alias tempfedora='podman run -i -t --privileged -v `pwd`:/workdir --rm=true fedora /bin/bash'
alias blogtest='podman run -e BUNDLE_CACHE=1 --privileged --rm --label=jekyll --volume="/home/bexelbie/Repositories/Personal/bexelbie.github.io/.bundle:/usr/local/bundle:z" --volume=/home/bexelbie/Repositories/Personal/bexelbie.github.io:/srv/jekyll:z -it -p 4000:4000 jekyll/jekyll jekyll s --force_polling --unpublished --future'
alias nginx-here='podman run --rm -v $(pwd):/usr/share/nginx/html:z -p 8080:80 nginx'

# Make PDFs stand out from other docs
export EXA_COLORS="*.pdf=33"
alias ls=exa
alias tree="exa --tree"

function rand() {
      echo $((RANDOM%$1+1))
  }

# Setup Prompt
# from https://xta.github.io/HalloweenBash/
#export PS1="\u@\h:\w \\$ "
export PS1="bexsrv \w\\$ "
# Set git information in prompt
. "$(git --html-path)/contrib/completion/git-prompt.sh"
#PROMPT_COMMAND="$(printf '%q ' __git_ps1 "${PS1%%\\\$*}" "\\\$${PS1#*\\\$}");$PROMPT_COMMAND"
GIT_PS1_SHOWCOLORHINTS=t
GIT_PS1_SHOWDIRTYSTATE=t
GIT_PS1_SHOWSTASHSTATE=t
GIT_PS1_SHOWUNTRACKEDFILES=t
GIT_PS1_SHOWUPSTREAM=git
PROMPT_COMMAND="$(printf '%q ' __git_ps1 "${PS1%%\\\$*}" "\\\$${PS1#*\\\$}");$PROMPT_COMMAND"
