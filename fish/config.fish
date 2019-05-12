# general binaries
set -x PATH ~/bin $PATH

# yarn binaries
set -x PATH ~/.yarn/bin $PATH

# rust
set -x PATH ~/.cargo/bin $PATH

# golang
set -x GOHOME ~/go
set -x GOBIN $GOHOME/bin
set -x PATH $GOBIN $PATH