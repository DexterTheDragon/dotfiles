_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -c%m .rake_tasks)
    changed=$(stat -c%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd `cat .rake_tasks`
  fi
}

compdef _rake rake


_cap_does_task_list_need_generating () {
  if [ ! -f .cap_tasks ]; then return 0;
  else
    accurate=$(stat -c%m .cap_tasks)
    changed=$(stat -c%m Capfile)
    return $(expr $accurate '>=' $changed)
  fi
}

_cap () {
  if [ -f Capfile ]; then
    if _cap_does_task_list_need_generating; then
      echo "\nGenerating .cap_tasks..." > /dev/stderr
      cap --quiet --tasks | grep '^cap' | cut -d " " -f 2 > .cap_tasks
    fi
    compadd `cat .cap_tasks`
  fi
}

compdef _cap cap


_thor_does_task_list_need_generating () {
  if [ ! -f .thor_tasks ]; then return 0;
  else
    accurate=$(stat -c%m .thor_tasks)
    changed=$(stat -c%m lib/tasks/*.thor)
    return $(expr $accurate '>=' $changed)
  fi
}

_thor () {
  if [ -f lib/tasks/*.thor ]; then
    if _thor_does_task_list_need_generating; then
      echo "\nGenerating .thor_tasks..." > /dev/stderr
      thor list | grep thor | cut -d " " -f 2 > .thor_tasks
    fi
    compadd `cat .thor_tasks`
  fi
}

compdef _thor thor
