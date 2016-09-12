# Install Guide

1. install chocolatey

2. install sudo
  * cinst -y sudo

3. install git
  * `sudo cinst -y git`

4. install ctags
  * `sudo cinst -y ctags`

5. install vim

6. `git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/vundle/`
  * path : %userprofile%

7. copy this _vimrc to %userprofile%

8. run below
  * `vim +PluginInstall +qall`


# Optional Guide for Rust

1. clone Rust source code from GitHub
  * `git clone https://github.com/rust-lang/rust.git %userprofile%\rust`

2. set env variable RUST_SRC_PATH
  * `set RUST_SRC_PATH=%userprofile%\rust`
