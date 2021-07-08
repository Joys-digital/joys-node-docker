#!/usr/bin/env bash

if [ ! -f ~/.initialised ]; then
    echo "First time running node..."
    geth --datadir=/root/node/joys init "/root/genesis.json"
    touch ~/.initialised
fi
if [ ! -f ~/.fork1 ]; then
    echo "fork1 running node..."
    geth --datadir=/root/node/joys init "/root/fork1.json"
    touch ~/.fork1
fi
if [ ! -f ~/.fork2 ]; then
    echo "fork2 running node..."
    geth --datadir=/root/node/joys init "/root/fork2.json"
    touch ~/.fork2
fi

sleep 3
cp /root/static-nodes.json /root/node/joys/geth

NODE_NAME=dockerff.${HOSTNAME}

geth \
--datadir=/root/node/joys \
--networkid=35855456 \
--rpc \
--rpcvhosts "*" \
--rpccorsdomain="*" \
--rpcaddr "0.0.0.0" \
--rpcapi "admin,db,personal,eth,net,web3,shh,txpool" \
--bootnodes="\
enode://3d71b3f2e8e4463e9b91c9c9f7794e67df4892cfb2354bc0444f9b6aa66ea6c99451e567b89e795e7ebcff79e56679234169f85f197b282b5d5f59e3c4cc3a30@92.53.100.7:30303,\
enode://d5a16003ec151aced5683b6d437c851fcf5d5d3338a193f8180e59e95157d2c5a75864012dc44e60509b1d9aa56ee61f46b38aae1c7c102b565ee22f58fcd6a9@92.53.69.64:30303" \
--nat "any" \
--ethstats=${NODE_NAME}:8382716d0b07b0a3@eth.joys.digital:3000