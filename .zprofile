# Extending PATH
export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=~/Scripts:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PATH=~/Library/Android/sdk/emulator:$PATH
export PATH=~/Projects/helseapp-devops:$PATH
export PATH=/Users/hussamyousif/.nimble/bin:$PATH

# Alias
alias :q="exit"
alias :Q="exit"
alias DockerRun="goto gap && docker-compose up --build -d && goto gb && docker-compose up --build -d && goto aps && docker-compose up --build -d"
alias GrabCode="goto codegrabber && source venv/bin/activate && ./grabcode.sh"
alias RunSpp="goto frontend && cd android &&  sudo ./gradlew installsppdevdebug && cd ../ && npm start"
alias RunStb="goto frontend && cd android &&  sudo ./gradlew installstbdevdebug && cd ../ && npm start"
alias RunDkv="goto frontend && cd android &&  sudo ./gradlew installdkvdevdebug && cd ../ && npm start"

# Android emulator
alias pixel="emulator @Pickie -wipe-data -no-snapshot-load -no-snapshot-save -no-boot-anim -accel auto -netdelay none -netspeed full -no-skin"
alias smol="emulator @smol -wipe-data -no-snapshot-load -no-snapshot-save -no-boot-anim -accel auto -netdelay none -netspeed full -no-skin"

alias ls='lsd'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Cd and ls
cl() {
    cd "$@" && ls
}

# Variables required by stuff
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk/"

# Work repositories
export blifrisk="/Users/hussamyousif/Projects/helseapp-blifrisk-rn"
export aps="/Users/hussamyousif/Projects/helseapp-aps"
export gb="/Users/hussamyousif/Projects/helseapp-gb"
export gap="/Users/hussamyousif/Projects/helseapp-gap"

# Functions

# in .bash_profile / .bash_rc etc put:
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

# FZF
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

