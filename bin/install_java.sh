#!/bin/sh
# Copyright (c) 2009 The Open Source Geospatial Foundation.
# Licensed under the GNU LGPL.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License,
# or any later version.  This library is distributed in the hope that
# it will be useful, but WITHOUT ANY WARRANTY, without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Lesser General Public License for more details, either
# in the "LICENSE.LGPL.txt" file distributed with this software or at
# web page "http://www.fsf.org/licenses/lgpl.html".

# About:
# =====
# This script will install jre 7 and jdk 7

# java 7 is now only from official ubuntu repos

apt-get install --yes default-jdk default-jre

echo TODO
exit 1


#Next 2 lines make it possible to accept the licence agreement interactively
#Source http://coreyhulen.org/2010/04/11/unattended-java-install-on-linux/
export DEBIAN_FRONTEND=noninteractive
echo "sun-java6-jdk shared/accepted-sun-dlj-v1-1 boolean true" | debconf-set-selections

#add-apt-repository "deb http://archive.canonical.com/ natty partner"
add-apt-repository "deb http://ppa.launchpad.net/duh/sun-java6/ubuntu natty main"
apt-get update

apt-get --assume-yes remove openjdk-6-jre openjdk-6-jre-headless

apt-get --assume-yes install java-common sun-java6-bin \
     sun-java6-jre sun-java6-jdk

apt-get --assume-yes install gsfonts-x11


cat << EOF > /etc/profile.d/set_JAVA_HOME.sh
JAVA_HOME=/usr/lib/jvm/java-6-sun
export JAVA_HOME
EOF


### see if we can reinstall this without bringing in the kitchen sink
###   otherwise we'll drop it
#apt-get --assume-yes install pdftk

