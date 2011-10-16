export AUTOFEATURE=false
export RSPEC=true


export PATH=/Applications/MAMP/Library/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
export SVN_EDITOR=vi
export PGOPTIONS='-c client_min_messages=WARNING'

export PS1='\u@\h:\w $(vcprompt)\$ '

export BUNDLER_EDITOR="mate -w"

alias debugstart='touch tmp/debug.txt && touch tmp/restart.txt'

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
 
alias seed='rake db:seed && rake db:seed RAILS_ENV=test'
alias be='bundle exec'
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias testprep='rake db:migrate db:seed RAILS_ENV=test'
alias cuc='be cucumber -r features'

alias sbstop='launchctl stop com.sickbeard.sickbeard'
alias sbstart='launchctl start com.sickbeard.sickbeard'
alias cpstop='launchctl stop com.couchpotato.couchpotato'
alias cpstart='launchctl start com.couchpotato.couchpotato'

alias tail='tail -n500 -f'

alias work='mate .;gitx'

alias gcm='git clone --mirror'

cdbundle() {
  local item_name="$1"
  if [[ -n "$item_name" ]]; then
    local gem_path="$(bundle show "$@" 2>/dev/null)"
    local result="$?"
    [[ "$result" -gt 0 ]] && cd "$gem_path"
  fi
}
alias cdb=cdbundle

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function nt {
  if [ $# -ne 1 ]; then
    TIMES=1
  else
    TIMES=$1
  fi

  osascript -e "
    repeat $TIMES times
      tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
      tell application \"Terminal\" to do script \"cd $PWD; clear;\" in selected tab of the front window
    end repeat
  " > /dev/null 2>&1
}

[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

      # Add the following to your ~/.bashrc or ~/.zshrc
      hitch() {
        command hitch "$@"
        if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
      }
      alias unhitch='hitch -u'
      # Uncomment to persist pair info between terminal instances
      # hitch

