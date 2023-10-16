# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to Android SDK
export ANDROID_HOME=/Users/sinhyeonmin/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# For compilers to find libpq when using Homebrew:
export PATH="/usr/local/opt/libpq/bin:$PATH"

# JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

function java-version() {
# print current java version
echo "\n------------[Your current java configuration]------------" 
java -version
echo "-----------------------------------------------------------\n"

declare -a java_version_array # initialize java_version_array

    # get all installed java version by using awk
    java_version_array=($(ls -1 /Library/Java/JavaVirtualMachines/ | awk -F '\n' '{print $1}'))

    # echo $java_version_array

    # get selected java version by using select
    # print all java version
    count=1
    for i in $java_version_array 
    do
        echo "$count) $i"
        count=$((count+1))
    done

    echo ""
    count=$((count-1))

    # select java version
    _java_version=""
    vared -p 'Choose the number : ' -c _java_version

    # check java version => _java_version must be smaller than count or upper than 0
    if [ $_java_version -gt $count ] || [ $_java_version -lt 1 ]; then
        echo "Please select the correct number"
        echo "You selected the wrong number : $_java_version"
        return
    fi

    count=1
    selected_java_version=""
    for i in $java_version_array
    do
        if [ $_java_version -eq $count ]; then
            selected_java_version=$i
            break
        fi
        count=$((count+1))
    done

    echo "\nThe selected java version => " $selected_java_version

    # print selected java path
    # need to consider linked path
    # try to open path by using open command and catch the case when the path is not exist (just linked path)
    # openjdk-11.jdk -> /usr/local/opt/openjdk@11/libexec/openjdk.jdk
    # you can checked by ls -al command
    #  ls -al /Library/Java/JavaVirtualMachines 2>&1 | awk -F '->' '{print $2}'
    linked_dir=($(ls -al /Library/Java/JavaVirtualMachines 2>&1 | awk '/->/ {print $9 " " $11}'))
    linked_target=($(ls -al /Library/Java/JavaVirtualMachines 2>&1 | awk '/->/ {print $9}'))
    linked_path=($(ls -al /Library/Java/JavaVirtualMachines 2>&1 | awk '/->/ {print $11}'))

    selected_path="/Library/Java/JavaVirtualMachines/${selected_java_version}/Contents/Home"
    count=0

    for i in $linked_target
    do
        if [ $i = $selected_java_version ]; then
            selected_path="$linked_path/Contents/Home"
            break
        fi
        count=$((count+1))
    done

    echo "The selected java path => " $selected_path '\n'
    echo $fg[green]'successfuly changed with : ' $(java -version 2>&1 | awk '/version/') '🎉🎉\n'$reset_color

    # set java version
    export JAVA_HOME=$selected_path
}

# pnpm
export PNPM_HOME="/Users/sinhyeonmin/Library/pnpm"
# pnpm endexport PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# postgreSQL
# For compilers to find postgresql@15 you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

# For pkg-config to find postgresql@15 you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="amuse"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Take an ownership for a specific file.
function takeown() {
    USER=$(whoami)
    file_name=$(which $*)

    if [ -z $file_name ]; then
        echo "No file name"
        return
    fi

    if [ -z $file_name ]; then
        echo "No file selected"
    else
        # first try to take permission via chown 
        # if chown can't take permission and then use chmod
        sudo chown -R $USER $file_name || sudo chmod -R 777 $file_name
        echo "Take ownership of $file_name"
    fi
}

function takePicture() {
    imagesnap -w 2 ~/Desktop/ImageSnap/$(date +%Y%m%d%H%M%S).jpg
    open ~/Desktop/ImageSnap
}

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm use node

# GEM
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# rbenv 
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim"
alias ohmyzsh="nvim ~/.oh-my-zsh"

alias imgsnap="imagesnap -w 2 ~/Desktop/ImageSnap/$(date +%Y%m%d%H%M%S).jpg"
alias checkimg="open ~/Desktop/ImageSnap"
alias gradle-rm="rm -rf ~/.gradle/caches"

# make sure open with .md file with nvim
alias md='nvim'

# set up standard ls command - with options
alias ls='ls -A1'

function gitconfig() {
    echo "select the git config"
    echo "1. SotaTek"
    echo "2. ShinMini"

    choice=""
    vared -p 'please chose the account: ' -c choice

    case $choice in
        1) git config --local user.name SotaTek-shinmini && git config --local user.email shinmini@sotatek.com
            ;;
        2) git config --local user.name ShinMini && git config --local user.email gusals121234@gmail.com
            ;;
        *) echo "Invalid choice: ${choice}";;
    esac

    echo "\n[your current git config]"
    echo $fg[green]"user.name: $(git config --local user.name)"
    echo "user.email: $(git config --local user.email)"$reset_color
}

function ghremote() {
    git remote add origin $(gh repo view $1 --json sshUrl --jq .sshUrl)
}

function gitpush() {
    git add .
    git commit -m "$1"
    git push
}

function goto() {
    dir_mini=~/Workspace/personal
    dir_work=~/Workspace/sotatek
    dir_down=~/Downloads
    dir_desk=~/Desktop
    dir_memo=~/Desktop/memo

    typeset -a goto_choice
    goto_choice=("mini" "work" "down" "desk" "memo")

    token=""
    if [[ -n $1 ]]
    then
        if [[ $1 == "mini" || $1 -eq 1 ]]
        then
            echo $fg[red]"goto mini..."$reset_color
            cd $dir_mini
            return
        elif [[ $1 == "work" || $1 -eq 2 ]]
        then
            echo $fg[blue]"goto workspace..."$reset_color
            cd $dir_work
            return
        elif [[ $1 == "down" || $1 -eq 3 ]]
        then
            echo $fg[green]"goto download..."$reset_color
            cd $dir_down
            return
        elif [[ $1 == "desk" || $1 -eq 4 ]]
        then
            echo $fg[yellow]"goto desktop..."$reset_color
            cd $dir_desk
            return
        elif [[ $1 == "memo" || $1 -eq 5 ]]
        then
            echo $fg[black]"goto memo..."$reset_color
            cd $dir_memo
            return
        fi
        echo "Invalid parameter: $1"
    fi


    goto_where=""
    echo "Where do you want to go?"
    echo "1. mini"
    echo "2. work"
    echo "3. down"
    echo "4. desk"
    echo "5. memo"

    vared -p 'please chose the number: ' -c goto_where

    case $goto_where in
        1) cd $dir_mini;;
        2) cd $dir_work;;
        3) cd $dir_down;;
        4) cd $dir_desk;;
        5) cd $dir_memo;;
        *) echo "Invalid choice: $goto_where";;
    esac

}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
