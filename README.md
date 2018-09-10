ラズパイでアドブロック用DNSコンテナを立てる
====

ラズパイの環境
----
raspberry pi version  
`Linux raspberrypi 4.14.62-v7+ #1134 SMP Tue Aug 14 17:10:10 BST 2018 armv7l GNU/Linux`

docker version  
`Docker version 18.06.1-ce, build e68fc7a`


概要
----
ラズパイに内向けDNSサーバを立てて，アドブロックをします．
DNSサーバはコンテナとして稼働させます．

詳細
----
LAN内に静的IPアドレスを割り当てたラズベリーパイをたてて，その中でDNSサーバの入ったコンテナを動かします．
dnsmasqが参照するファイルにhttps://warui.intaa.net/adhosts/hosts.txtを加工したものを読み込ませます．
これによって，広告のドメインを問い合わせた時に，0.0.0.0というIPアドレスが返ってくるようにします．

使用方法
----
このリポジトリにあるdockerfileを自分でビルドして，`docker run` するか以下のコマンドを実行する．

__Run container__  
```
docker container run --cap-add=NET_ADMIN -d -p 53:53/udp -p 53:53/tcp --name adblock_dns rixycf/dnsmasq_adblock_alpine:0.1
```
