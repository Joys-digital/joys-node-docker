#!/usr/bin/env bash

# deprecated PoW
#
#if [ ! -f ~/.initialised ]; then
#    echo "First time running node..."
#    geth --datadir=/root/node/joys init "/root/genesis.json"
#    touch ~/.initialised
#fi
#if [ ! -f ~/.fork1 ]; then
#    echo "fork1 running node..."
#    geth --datadir=/root/node/joys init "/root/fork1.json"
#    touch ~/.fork1
#fi
#
#if [ ! -f ~/.fork2 ]; then
#    echo "fork2 running node..."
#    geth --datadir=/root/node/joys init "/root/fork2.json"
#    touch ~/.fork2
#fi

# PoAS
if [ ! -f ~/.poas1 ]; then
    echo "PoAS running node..."
    geth --datadir=/root/node/joys-poas init "/root/joys-posa.json"
    touch ~/.poas1
fi
# json-key оne-time migration
if [ -f ~/.fork2 ]; then
    echo "fork2 found, attempt key migration..."
    if [ ! -f ~/.migrated ]; then
      echo "Migrating json keys..."
      cp /root/node/joys/keystore/* /root/node/joys-poas/keystore/
    touch ~/.migrated
    fi
fi

sleep 3
cp /root/static-nodes.json /root/node/joys-poas/geth

NODE_NAME=dockerp.${HOSTNAME}

geth \
--datadir=/root/node/joys-poas \
--networkid=35855456 \
--http \
--http.vhosts "*" \
--http.corsdomain "*" \
--http.addr 0.0.0.0 \
--http.api "eth,net,web3,txpool" \
--bootnodes="\
enode://98b954bb16ece6ad373a040f0ebac1b80e0bb4be36102ea6dcf7ea36ddd83f7ec72966727959d00bc8134bb7dd9a92cda533a3e28e8334c455f655c01704ed56@188.124.39.113:31323,\
enode://fe09937a938b3747fcd9b89db94d5ae9e2d319751a8139085ed7f8cc79d4409c5cffc53807cf6db65b45c9e12b9754c3393e4db0ee90a3f9de2bc1ab6c5a3ba4@188.124.39.231:31323" \
--port 31323 \
--nat "any" \
--txlookuplimit=0 \
--miner.gasprice 20000000000 \
--ethstats=${NODE_NAME}:q32399VqOO4n@poas.joys.digital:3000
