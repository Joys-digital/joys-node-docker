#!/usr/bin/env bash

if [ ! -f ~/.initialised ]; then
    echo "First time running node..."
    geth --datadir=/root/node/joys init "/root/genesis.json"
    touch ~/.initialised
fi
if [ ! -f ~/.fork1 ]; then
    echo "w/o fork running node..."
    geth --datadir=/root/node/joys init "/root/fork1.json"
    touch ~/.fork1
fi

sleep 3
cp /root/static-nodes.json /root/node/joys/geth

NODE_NAME=dockerf.${HOSTNAME}

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
enode://a4cd386a86c607dab8686a5e919757df08a1006bcfd9df75d0d58338f6985e91bc8091a49be36acb582a3c2c70db33e36f59741311325fc6cb24073eb1f2dfee@185.91.52.220:30303,\
enode://aa2a8c5438adef24647871bdfd75496a8a4b47226253385cb7cbcaa7fbcfc9872c64b3990033abfe584dbfdeccca013d64a659b7426c88ed71a0987b969bbd83@79.141.65.76:30303,\
enode://e3bfcdc6999131f9a34a96d9fd77da2c2721a9002d7994d887c2fea1ba876ffdea6dae285c6a4ced7d7d694c39a39e5dee3480934a181a0fe4d08183ab5157fb@185.17.146.63:30303,\
enode://d5a16003ec151aced5683b6d437c851fcf5d5d3338a193f8180e59e95157d2c5a75864012dc44e60509b1d9aa56ee61f46b38aae1c7c102b565ee22f58fcd6a9@92.53.69.64:30303" \
--nat "any" \
--ethstats=${NODE_NAME}:8382716d0b07b0a3@eth.joys.digital:3000