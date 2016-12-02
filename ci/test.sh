#!/bin/bash

echo "Download und extract sourcemod"
wget -q "http://www.sourcemod.net/latest.php?version=$1&os=linux" -O sourcemod.tar.gz
# wget "http://www.sourcemod.net/latest.php?version=$1&os=linux" -O sourcemod.tar.gz
tar -xzf sourcemod.tar.gz

echo "Give compiler rights for compile"
chmod +x addons/sourcemod/scripting/spcomp

echo "Compile MyJailbreak plugins"
for file in addons/sourcemod/scripting/MyJailbreak/*.sp
do
  addons/sourcemod/scripting/spcomp -E -v0 $file
done

echo "Compile MyJailbreak Add-ons"
for file in addons/sourcemod/scripting/MyJailbreak/Add-ons/*.sp
do
  addons/sourcemod/scripting/spcomp -E -v0 $file
done
