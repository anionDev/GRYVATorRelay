#!/bin/bash

configurationfile="/Workspace/Application/torrc"

sed -i -e "s/__.torrc.nickname.__/$nickname/g" $configurationfile
sed -i -e "s/__.torrc.orport.__/$orport/g" $configurationfile
sed -i -e "s/__.torrc.exitrelay.__/$exitrelay/g" $configurationfile
sed -i -e "s/__.torrc.socksport.__/$socksport/g" $configurationfile
sed -i -e "s/__.torrc.controlsocket.__/$controlsocket/g" $configurationfile
sed -i -e "s/__.torrc.contactinfo.__/$contactinfo/g" $configurationfile
sed -i -e "s/__.torrc.relaybandwidthrate.__/$relaybandwidthrate/g" $configurationfile

if [[ "${lognotice}" = true ]]; then
  sed -i -e "s/__.torrc.lognotice.__/Log notice file \/var\/log\/tor\/notices.log/g" $configurationfile
else
  sed -i -e "s/__.torrc.lognotice.__//g" $configurationfile
fi
if [[ "${logdebug}" = true ]]; then
  sed -i -e "s/__.torrc.logdebug.__/Log notice file \/var\/log\/tor\/debug.log/g" $configurationfile
else
  sed -i -e "s/__.torrc.logdebug.__//g" $configurationfile
fi

echo "--------------------"
echo "Tor-version:"
tor --version
echo "--------------------"
echo "Tor-Configuration:"
cat $configurationfile
echo "--------------------"
echo "Starting tor..."
tor -f $configurationfile
