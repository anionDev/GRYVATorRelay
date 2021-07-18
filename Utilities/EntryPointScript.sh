#!/bin/bash

sed -i -e "s/__.torrc.nickname.__/$nickname/g" /torrc
sed -i -e "s/__.torrc.orport.__/$orport/g" /torrc
sed -i -e "s/__.torrc.exitrelay.__/$exitrelay/g" /torrc
sed -i -e "s/__.torrc.socksport.__/$socksport/g" /torrc
sed -i -e "s/__.torrc.controlsocket.__/$controlsocket/g" /torrc
sed -i -e "s/__.torrc.contactinfo.__/$contactinfo/g" /torrc

tor -f /torrc
