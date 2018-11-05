#!/bin/zsh

return_logger() {
  if [ "$1" -ne "0" ]; then
    echo "\e[93m<<< \e[31m[failed]\e[33m[$2]\e[36m[code:$1]\e[39m"
  else
    echo "\e[93m<<< \e[32m[succesfuly]\e[33m[$2]\e[36m[code:$1]\e[39m"
  fi
}

install_by_apt() {
  echo "\e[93m>>> \e[35mInstalling \e[34m[$1]\e[39m"
  sudo apt-get -qq -y install $1 > /dev/null
  return_logger $? $1
}

update() {
  sudo apt-get -qq -y update > /dev/null
  return_logger $? update
}

install_all_package() {
  for package_name in $@; do
    install_by_apt $package_name
  done
}

add_ppa() {
  echo "\e[93m>>> \e[35mAdding \e[34m[$1]\e[39m"
  sudo add-apt-repository -y ppa:$1 > /dev/null
  return_logger $? $1
}

title() {
  echo "\n\e[91m>\e[92m>\e[93m>\e[94m>\e[95m>\e[96m>\e[92m $1 \e[96m<\e[95m<\e[94m<\e[93m<\e[92m<\e[91m<\e[39m\n"
}

native_package_names=(
  terminator
  wget
  git
  cmake
  libpq-dev
  golang-go
)

external_package_names=(
  peek
)

title "Updating"
update

title "Native Package"
install_all_package $native_package_names

title "Updating"
update

title "Add PPAs"
add_ppa peek-developers/stable

title "Updating"
update

title "External Package"
install_all_package $external_package_names
