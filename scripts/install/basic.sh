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

add_all_ppa() {
  for ppa in $@; do
    add_ppa $ppa
  done
}

notify() {
  echo "\n\e[91m>\e[92m>\e[93m>\e[94m>\e[95m>\e[96m>\e[92m $1 \e[96m<\e[95m<\e[94m<\e[93m<\e[92m<\e[91m<\e[39m\n"
}

downlaod() {
  echo "\e[93m>>> \e[35mDownload \e[34m[$1]\e[39m"
  wget $1 -nv -P /tmp/boot/ > /dev/null
  return_logger $? $1
}

downlaod_all_deb() {
  for link in $@; do
    downlaod $link
  done
}

install_by_deb_file() {
  echo "\e[93m>>> \e[35mInstalling \e[34m[$1]\e[39m"
  sudo dpkg -i /tmp/boot/$1 > /dev/null
  return_logger $? $1
}

install_all_deb_files() {
  for deb_file in $@; do
    install_by_deb_file $deb_file
  done
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
  rvm
)

ppa_paths=(
  peek-developers/stable
  rael-gc/rvm
)

links_to_deb=(
  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  https://az764295.vo.msecnd.net/stable/7f3ce96ff4729c91352ae6def877e59c561f4850/code_1.28.2-1539735992_amd64.deb
)

deb_files=(
  google-chrome-stable_current_amd64.deb
  code_1.28.2-1539735992_amd64.deb
)

notify "Updating"
update

notify "Native Package"
install_all_package $native_package_names

notify "Updating"
update

notify "Add PPAs"
add_all_ppa $ppa_paths

notify "Updating"
update

notify "External Package"
install_all_package $external_package_names

notify "Dowloading all .deb"
downlaod_all_deb $links_to_deb

notify "Instaling .deb"
install_all_deb_files $deb_files
