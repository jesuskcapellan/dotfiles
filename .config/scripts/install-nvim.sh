sudo apt update
sudo apt-get install ninja-build gettext cmake unzip curl
source ~/.bashrc

mkdir ~/git-clones
cd ~/git-clones
git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install
source ~/.bashrc
