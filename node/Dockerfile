FROM ubuntu:18.04
LABEL version="7.0"

RUN apt-get update && apt-get install --yes software-properties-common apt-utils
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install --yes geth

ADD http://boot.joys.digital/genesis.json /root/
ADD http://boot.joys.digital/static-nodes.json /root/

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT /root/start.sh
