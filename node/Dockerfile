FROM ethereum/client-go:v1.10.8
ADD http://boot.joys.digital/posa/joys-posa.json /root/
ADD http://boot.joys.digital/posa/static-nodes.json /root/

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 31323
EXPOSE 31323/udp
EXPOSE 8545
EXPOSE 8546

#STOPSIGNAL SIGINT
#ENTRYPOINT ["geth"]
ENTRYPOINT /root/start.sh
