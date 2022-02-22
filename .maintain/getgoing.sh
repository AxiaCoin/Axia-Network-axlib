/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install openssl cmake
curl https://sh.rustup.rs -sSf | sh
source ~/.cargo/env
cargo install --git https://github.com/axiatech/axlib subkey
cargo install --git https://github.com/axiatech/axlib axlib
