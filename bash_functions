# list contents right after changing directories
cd() {
    if [ "$1" ]
    then builtin cd "$1" && ls
    else builtin cd && ls
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
# vim:ft=sh
