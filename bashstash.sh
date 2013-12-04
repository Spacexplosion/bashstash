#!/bin/bash

WORKDIR=${PWD#/}

case $1 in
push)
    mkdir -p ~/.bashstash/$WORKDIR
    mv * ~/.bashstash/$WORKDIR
    svn update > /dev/null
    ;;
pop)
    rsync -a ~/.bashstash/${WORKDIR}/ .
    rm -r ~/.bashstash/${WORKDIR}/*
    cd ~/.bashstash
    rmdir -p $WORKDIR
    ;;
*) echo Commands: push, pull
esac