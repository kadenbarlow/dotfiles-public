mkdir -p ~/.go
export GOPATH=$HOME/.go
export GOROOT=$(brew --prefix golang)/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
