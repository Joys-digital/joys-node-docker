#!/usr/bin/env bash

#if [ ! -d /root/node/joys/keystore ]; then
#    echo "/root/node/joys/keystore not found, running 'geth init'..."
#    geth --datadir=/root/node/joys init "/root/genesis.json"
#    echo "...done!"
#fi

geth --datadir=/root/node/joys init "/root/genesis.json"
sleep 3

cp /root/static-nodes.json /root/node/joys/geth

#NODE_NAME=$HOSTNAME
NODE_NAME=docker
GETH_OPTS=${@/XXX/$NODE_NAME}
geth ${GETH_OPTS}
