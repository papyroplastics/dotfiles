
pwd=$(pwd)
echo $pwd

if [[ ! -d $HOME/.config/backup ]]; then
  mkdir $pwd/backup
fi

if [[ -e $HOME/.profile ]]; then
  mv $HOME/.profile $pwd/backup/profile
fi

if [[ -e $HOME/.bashrc ]]; then
  mv $HOME/.bashrc $pwd/backup/bashrc
fi

if [[ -e $HOME/.bash_profile ]]; then
  mv $HOME/.bash_profile $pwd/backup/bash_profile
fi

if [[ -e $HOME/.bash_aliases ]]; then
  mv $HOME/.bash_aliases $pwd/backup/bash_aliases
fi

if [[ -e $HOME/.bash_logout ]]; then
  mv $HOME/.bash_logout $pwd/backup/bash_logout
fi

ln -s $pwd/profile      "$HOME/.profile"
ln -s $pwd/bashrc       $HOME/.bashrc
ln -s $pwd/bash_profile $HOME/.bash_profile
ln -s $pwd/bash_aliases $HOME/.bash_aliases
ln -s $pwd/bash_logout  $HOME/.bash_logout

