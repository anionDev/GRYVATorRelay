#!/bin/bash

sed -i -e "s/__.torrc.nickname.__/$nickname/g" ./torrc    
sed -i -e "s/__.torrc.orport.__/$orport/g" ./torrc    
sed -i -e "s/__.torrc.exitrelay.__/$exitrelay/g" ./torrc    
sed -i -e "s/__.torrc.socksport.__/$socksport/g" ./torrc    
sed -i -e "s/__.torrc.controlsocket.__/$controlsocket/g" ./torrc    
sed -i -e "s/__.torrc.contactinfo.__/$contactinfo/g" ./torrc    
if [[ "${lognotice}" = true ]]; then
  sed -i -e "s/__.torrc.lognotice.__/Log notice file \/var\/log\/tor\/notices.log/g" ./torrc    
else
  sed -i -e "s/__.torrc.lognotice.__//g" ./torrc    
fi
if [[ "${logdebug}" = true ]]; then
  sed -i -e "s/__.torrc.logdebug.__/Log notice file \/var\/log\/tor\/debug.log/g" ./torrc    
else
  sed -i -e "s/__.torrc.logdebug.__//g" ./torrc    
fi

tor -f ./torrc
