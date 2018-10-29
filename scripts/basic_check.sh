#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR/..
    project_name=$(echo $GIT_URL | awk -F/ '{print $NF}' | sed 's/.git//g')
    mkdir -p $GOPATH/src/github.com/xplaceholder
    mkdir $GOPATH/src/github.com/xplaceholder/${project_name}
    cp -r $WORKSPACE/* $GOPATH/src/github.com/xplaceholder/${project_name}/
    ls $WORKSPACE
    ls $GOPATH/src/github.com/xplaceholder/${project_name}
    pushd $GOPATH/src/github.com/xplaceholder/${project_name}
        go get -u golang.org/x/lint/golint
        go get -u github.com/onsi/ginkgo/ginkgo
        go get -u github.com/onsi/gomega/...
        export PATH="$PATH:$GOPATH/bin"
        ginkgo -race -r
    popd
popd