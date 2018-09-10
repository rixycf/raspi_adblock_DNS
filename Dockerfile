# @rixycf dnsmasq container for adblock

FROM resin/rpi-raspbian:jessie

LABEL maintainer="rixycf kasnake1013@gmail.com"

RUN apt update && \
    apt install dnsmasq && \
    curl -sSL "https://warui.intaa.net/adhosts/hosts.txt" | \
    awk 'NR > 1 {print "address=/"$2"/"$1}' >> /etc/dnsmasq.adblock.conf && \
    echo "domain-needed" >> /etc/dnsmasq.conf && \
    echo "bogus-priv" >> /etc/dnsmasq.conf && \
    echo "no-resolv" >> /etc/dnsmasq.conf && \
    echo "no-poll" >> /etc/dnsmasq.conf && \
    echo "server=8.8.8.8" >> /etc/dnsmasq.conf && \
    echo "server=8.8.4.4" >> /etc/dnsmasq.conf && \
    echo "conf-file=/etc/dnsmasq.adblock.conf" >> /etc/dnsmasq.conf
    
CMD ["dnsmasq", "--no-daemon"]
