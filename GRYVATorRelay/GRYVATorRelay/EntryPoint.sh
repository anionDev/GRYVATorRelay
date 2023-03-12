#!/bin/bash

configurationfile="/Workspace/Application/torrc"

sed -i -e "s/__.torrc.nickname.__/$nickname/g" "$configurationFile"
sed -i -e "s/__.torrc.orport.__/$orport/g" "$configurationFile"
sed -i -e "s/__.torrc.exitrelay.__/$exitrelay/g" "$configurationFile"
sed -i -e "s/__.torrc.socksport.__/$socksport/g" "$configurationFile"
sed -i -e "s/__.torrc.controlsocket.__/$controlsocket/g" "$configurationFile"
sed -i -e "s/__.torrc.contactinfo.__/$contactinfo/g" "$configurationFile"
sed -i -e "s/__.torrc.relaybandwidthrate.__/$relaybandwidthrate/g" "$configurationFile"

if [[ "${lognotice}" = true ]]; then
  sed -i -e "s/__.torrc.lognotice.__/Log notice file \/var\/log\/tor\/notices.log/g" "$configurationFile"
else
  sed -i -e "s/__.torrc.lognotice.__//g" "$configurationFile"
fi
if [[ "${logdebug}" = true ]]; then
  sed -i -e "s/__.torrc.logdebug.__/Log notice file \/var\/log\/tor\/debug.log/g" "$configurationFile"
else
  sed -i -e "s/__.torrc.logdebug.__//g" "$configurationFile"
fi

sed -i '/^$/d' "$configurationFile" # Remove empty lines
sed -i '' -e '$a\' "$configurationFile" # Append empty line

echo "--------------------"
echo "Tor-version:"
tor --version
echo "--------------------"
echo "Tor-Configuration:"
cat "$configurationFile"
echo "--------------------"
echo "Starting tor..."
tor -f "$configurationFile"
