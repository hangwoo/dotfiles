#!/bin/bash
set -e                  # 모든 라인의 실행 결과를 검사해서 실패할 경우 스크립트 실행 종료
set -o pipefail

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function bashAndVimSetting() {
    echo "bash, vim 설정파일 복사"
    cp ./.bashrc ~/;
    cp ./.bash_profile ~/;
    cp ./.bash_custom ~/;
    cp ./.vimrc ~/;
    cp ./.gitconfig ~/;

    echo "vim vundle 설치"
    rm -rf ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "vundle plugins 설치"
    vim +PluginInstall +qall
}

read -p "This may overwrite existing your current setting files in home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bashAndVimSetting;
fi; 

echo "!!!!!!!!!!!!!! change path bash_profile, bashrc, vimrc {{USER}} => your name !!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!! change git user in gitconfig and commit template {{USER}} => your name !!!!!!!!!!!!!!!"
