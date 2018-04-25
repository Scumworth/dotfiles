export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# below changes command prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.git-flow-completion.bash ]; then
  . ~/.git-flow-completion.bash
fi

export PATH="/home/scumworth/anaconda3/bin:$PATH"

# added by travis gem
[ -f /home/scumworth/.travis/travis.sh ] && source /home/scumworth/.travis/travis.sh
