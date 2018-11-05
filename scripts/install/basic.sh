#!/bin/zsh

#functions logger

return_logger() {
  if [ "$1" -ne "0" ]; then
    echo "\e[93m<<< \e[31m[failed]\e[33m[$2]\e[36m[code:$1]\e[39m"
  else
    echo "\e[93m<<< \e[32m[succesfuly]\e[33m[$2]\e[36m[code:$1]\e[39m"
  fi
}

install_by_apt() {
  # echo "\e[93m>>> \e[95mInstalling \e[94m[$1]\e[39m"
  sudo apt-get -qq -y install $1 > /dev/null
  return_logger $? $1
}

update() {
  sudo apt-get -qq -y update > /dev/null
  return_logger $? update
}


update

package_names=(
  terminator
  wget
  git
  cmake
  carlos
  libpq-dev
  golang-go
)

for package_name in $package_names; do
  install_by_apt $package_name
done
