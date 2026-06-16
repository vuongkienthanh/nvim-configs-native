# IDE neovim config

## On Ubuntu/WSL

- Install [rustup]( https://rustup.rs ) then [tree-sitter-cli]( https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md )
- Install neovim and dependencies
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# install clipboard on wsl/ubuntu
if grep -qi microsoft /proc/version; then
    winget.exe install win32yank
else
    sudo apt install xclip
fi

sudo apt install\
    software-properties-common\
    git curl wget\
    gzip tar unzip\
    ripgrep fd-find\
    gcc g++ make clang\
    python3-full python3-venv python3-pynvim\
    nodejs node-typescript npm\
    neovim
```
- Setup git config
```sh
git config --global user.name={username}
git config --global user.email={email@abc.com}
git config --global core.autocrlf input
git config --global core.editor "nvim --clean"
git config --global pull.rebase false
git config --global commit.verbose true
```
- Clone this repo at `~/.config/nvim`

## On Windows

- Install neovim and dependencies
```sh
winget install git
winget install wget
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
winget install tree-sitter-cli
winget install cmake
winget install 7zip.7zip
winget install GnuWin32.Gzip
winget install GnuWin32.UnZip
winget install MartinStorsjo.LLVM-MinGW.MSVCRT

winget install python3
pip install pynvim
winget install nodejs
npm install -g typescript

winget install neovim
```

- Add `GnuWin32` path to `PATH` environment. ( to find `unzip`, `gzip` ) 

- Setup git config
```
git config --global user.name={username}
git config --global user.email={email@abc.com}
git config --global core.autocrlf true
git config --global core.editor "nvim --clean"
git config --global pull.rebase false
git config --global commit.verbose true
```

- Clone this repo at `C:\Users\{username}\AppData\Local\nvim`

# Run `:checkhealth` after finish all steps above
