#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR/..
    # export GOPATH="$(pwd)"

    # mkdir $GOPATH/src 
    echo "############1"
    echo $GOPATH
    echo $WORKSPACE
    echo "############2"
    project_name=$(echo $GIT_URL | awk -F/ '{print $NF}' | sed 's/.git//g')
    echo ${project_name}
    echo "############3"
    mkdir -p $GOPATH/src/github.com/xplaceholder
    # echo $GOPATH
    # /Users/andy/workspace/gopath
    # ln -f -s $WORKSPACE $GOPATH/src/$project_name
    # /var/data/jenkins/jenkins_home/workspace/placeholder_ashandler
    # _draft-WL57Q6JEUNXVWHXVEQD6XHK5ASSGWV2DTWF3TH3V7YNHGIZU2QEQ/ashandler
    echo "##########4 $WORKSPACE/${project_name}" 
    # /var/data/jenkins/jenkins_home/workspace/placeholder_ashandler_draft-WL57Q6JEUNXVWHXVEQD
    # 6XHK5ASSGWV2DTWF3TH3V7YNHGIZU2QEQ/src/github.com/xplaceholder/ashandler
    echo "##########5 $GOPATH/src/github.com/xplaceholder/${project_name}"
    echo "##########6"
    mkdir $GOPATH/src/github.com/xplaceholder/${project_name}
    cp -r $WORKSPACE/ $GOPATH/src/github.com/xplaceholder/${project_name}/
    # ln -f -s $WORKSPACE $GOPATH/src/github.com/xplaceholder/${project_name}

    ls $WORKSPACE
    echo "##########7"
    ls $GOPATH/src/github.com/xplaceholder/${project_name}
    echo "##########8"
    pushd $GOPATH/src/github.com/xplaceholder/${project_name}
        go get -u golang.org/x/lint/golint
        go get -u github.com/onsi/ginkgo/ginkgo
        go get -u github.com/onsi/gomega/...
        export PATH="$PATH:$GOPATH/bin"
        # pushd 
        # golint `go list ./... | grep -v /vendor/`
        # ls $GOPATH
        echo "####xx"
        ls
        echo "####xx2"
        ginkgo -race -r
    popd
popd