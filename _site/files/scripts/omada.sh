#!/bin/bash

apt update && apt install apt-transport-https ca-certificates software-properties-common curl net-tools gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list

wget -qO - /adoptopenjdk/api/gpg/key/public | apt-key add -
add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

apt update && apt install mongodb-org adoptopenjdk-8-hotspot jsvc

wget -c https://static.tp-link.com/upload/software/2023/202303/20230321/Omada_SDN_Controller_v5.9.31_Linux_x64.deb

dpkg -i Omada_SDN_Controller_v5.9.31_Linux_x64.deb
