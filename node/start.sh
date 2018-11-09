#!/usr/bin/env bash

if [ ! -f ~/.intialised ]; then
    echo "First time running node..."
    geth --datadir=/root/node/joys init "/root/genesis.json"
    sleep 3
    cp /root/static-nodes.json /root/node/joys/geth
    touch ~/.initialised
fi

#NODE_NAME=$HOSTNAME
NODE_NAME=docker.${HOSTNAME}
#GETH_OPTS=${@/XXX/$NODE_NAME}
#geth ${GETH_OPTS}
#geth --datadir=/root/node/joys  --rpcvhosts "*" --rpccorsdomain="*" --networkid=35855456 --rpc --bootnodes="enode://1750c090cd33c713c5bdba7d77e01223126fe5bde3a9829ef177a33bb911da3d1c5369ea089e1862c4c149761249c702c00fce70cefe764d6dbfc2853bf74848@95.213.151.253:30303"  --nat "any" --ethstats=XXX:8382716d0b07b0a3@eth.joys.digital:3000
geth \
--datadir=/root/node/joys \
--rpcvhosts "*" \
--rpccorsdomain="*" \
--networkid=35855456 \
--rpc \
--bootnodes="enode://1750c090cd33c713c5bdba7d77e01223126fe5bde3a9829ef177a33bb911da3d1c5369ea089e1862c4c149761249c702c00fce70cefe764d6dbfc2853bf74848@95.213.151.253:30303" \
--nat "any" \
--ethstats=${NODE_NAME}:8382716d0b07b0a3@eth.joys.digital:3000
