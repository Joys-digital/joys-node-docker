#!/usr/bin/env bash

if [ ! -d /root/node/joys/keystore ]; then
    echo "/root/node/joys/keystore not found, running 'geth init'..."
    geth --datadir=/root/node/joys init "/root/genesis.json"
    echo "...done!"
fi

sleep 3
cp /root/static-nodes.json /root/node/joys/geth

NODE_NAME=LaToken.com
GETH_OPTS=${@/XXX/$NODE_NAME}
geth ${GETH_OPTS}
#geth --datadir=/root/node/joys --rpccorsdomain="*" --networkid=35855456 --rpc --rpcapi "admin,db,personal,eth,net,web3,shh,txpool" --bootnodes="enode://1750c090cd33c713c5bdba7d77e01223126fe5bde3a9829ef177a33bb911da3d1c5369ea089e1862c4c149761249c702c00fce70cefe764d6dbfc2853bf74848@95.213.151.253:30303"  --nat "any" --ethstats=LaToken.com:8382716d0b07b0a3@eth.joys.digital:3000 console
