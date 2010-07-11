# list contents right after changing directories
cd() {
    if [ "$1" ]
    then builtin cd "$1" && ls
    else builtin cd && ls
    fi
    declare -f __rvm_cd > /dev/null
    if [ $? -eq 0 ]; then
        __rvm_cd
    fi
}

# http://www.shell-fu.org/lister.php?id=769

# Go up n levels:
# .. 3
function .. (){
    local arg=${1:-1};
    local dir=""
    while [ $arg -gt 0 ]; do
        dir="../$dir"
        arg=$(($arg - 1));
    done
    cd $dir >&/dev/null
}

# Go up to a named dir
# ... usr
function ... (){
    if [ -z "$1" ]; then
        return
    fi
    local maxlvl=16
    local dir=$1
    while [ $maxlvl -gt 0 ]; do
        dir="../$dir"
        maxlvl=$(($maxlvl - 1));
        if [ -d "$dir" ]; then
            cd $dir >&/dev/null
        fi
    done
}

spell (){
    echo $1 | aspell -a
}


function __bundler_ps1 {
  if [ -n "${BUNDLE_GEMFILE-}" ]; then
    project_path="${BUNDLE_GEMFILE%/Gemfile}"
    project_name="${project_path##**/}"

    if [ -n "${1-}" ]; then
      printf "$1" "${project_name}"
    else
      printf " (%s)" "${project_name}"
    fi
  fi
}

function ssh-add {
    eval file=\$$#
    SSHADD=$(which ssh-add)
    if [ -f ~/.ssh/$file ]; then
        args=''
        for i in "$@"; do
            if [ $i != $file ]; then
                args="$args $i"
            fi
        done
        $SSHADD $args ~/.ssh/$file
    else
        $SSHADD $@
    fi
}

llaon() {
    alias ll='ls -lA'
}
llaoff() {
    alias ll='ls -l'
}

# vim:ft=sh
