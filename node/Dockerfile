FROM ubuntu:20.04
LABEL version="9.0"

RUN apt-get update && apt-get install --yes software-properties-common apt-utils
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update && apt-get install geth --yes

ADD http://boot.joys.digital/posa/joys-posa.json /root/
ADD http://boot.joys.digital/posa/static-nodes.json /root/

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 31323
EXPOSE 31323/udp
EXPOSE 8545

ENTRYPOINT /root/start.sh
