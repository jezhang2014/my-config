ln -sf `pwd`/nvim ~/.config/nvim
#ln -sf `pwd`/nvim-lua ~/.config/nvim
ln -sf `pwd`/ranger ~/.config/ranger
mkdir -p ~/.m2
ln -sf `pwd`/m2/settings.xml ~/.m2/settings.xml
ln -sf `pwd`/bash/bashrc ~/.bashrc
mkdir -p ~/.rustup
ln -sf `pwd`/rustup/settings.toml ~/.rustup/settings.toml
ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf
ln -sf `pwd`/git/gitconfig ~/.gitconfig
ln -sf `pwd`/vnc ~/.vnc
ln -sf `pwd`/npm/npmrc ~/.npmrc
ln -sf `pwd`/docker/daemon.json /etc/docker/daemon.json
ln -sf `pwd`/ssh/authorized_keys ~/.ssh/authorized_keys
ln -sf `pwd`/systemd/logind.conf /etc/systemd/logind.conf
mkdir -p ~/.config/lf
ln -sf `pwd`/lf/lfrc ~/.config/lf/lfrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p /etc/systemd/system/docker.service.d
ln -sf `pwd`/docker/http-proxy.conf /etc/systemd/system/docker/http-proxy.conf

# start conda
source /opt/anaconda/bin/activate root
