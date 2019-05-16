# Ubuntu 18.04 LTS base image 
FROM ubuntu:18.10

ENV HOME=/home/developer

# tools
RUN apt-get update -y -q && apt-get upgrade -y -q 
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git software-properties-common gpg gpg-agent

# fish
RUN apt-add-repository ppa:fish-shell/release-3 \
  && apt-get update -y -q \
  && apt-get --no-install-recommends -y -q install fish

# go 1.12.5
RUN curl -s https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz | tar -v -C /usr/local -xz
ENV PATH $PATH:/usr/local/go/bin
RUN go get -u golang.org/x/tools/cmd/gopls \
  && go get -u golang.org/x/tools/cmd/goimports \
  && go get -u golang.org/x/tools/cmd/guru \
  && go get -u golang.org/x/tools/cmd/gorename \
  && go get -u golang.org/x/lint/golint \
  && go get -u github.com/uudashr/gopkgs/cmd/gopkgs \
  && go get -u github.com/ramya-rao-a/go-outline \
  && go get -u github.com/rogpeppe/godef \
  && go get -u github.com/sqs/goreturns \
  && go get -u github.com/acroca/go-symbols \
  && go get -u github.com/go-delve/delve/cmd/dlv
RUN go get -x -d github.com/stamblerre/gocode \
  && go build -o gocode-gomod github.com/stamblerre/gocode \
  && mv gocode-gomod $GOPATH/bin/

# node 10 & yarn
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update -y -q \
  && apt-get install --no-install-recommends -y -q nodejs
RUN npm i -g yarn \
  && yarn global add n

# rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# docker
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release \
  && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | (OUT=$(apt-key add - 2>&1) || echo $OUT) \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
  && apt-get update \
  && apt-get install -y docker-ce-cli

# user
WORKDIR /home/developer
COPY ./fish /home/developer/.config/fish