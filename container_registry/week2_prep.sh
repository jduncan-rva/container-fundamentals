#! /usr/bin/env bash
# Week 2 Container Registry Lab Convenience Script
# Author: Jamie Duncan

echo -e "\e[0;32m\n***CONTAINER FUNDAMENTALS LAB***\n\e[m"
echo -e "\e[0;32mThis script will deploy Harbor Container Registry on Port 80 using HTTP\e[m"
echo -e "\e[0;32mThis configuration is DRAMATICALLY insecure for anything other than a lab.\e[m"
echo -e "\e[0;32m\n***SECTION 1: Prerequisites\n\e[m"

sudo apt-get update -y -q 
sudo apt-get install gettext-base certbot -y -q
HARBOR_SRC=https://github.com/goharbor/harbor/releases/download/v2.8.2/harbor-online-installer-v2.8.2.tgz
HARBOR_TARBALL=$(echo $HARBOR_SRC | awk -F '/' {'print $NF'})
sudo rm -rf harbor $HARBOR_TARBALL

echo -e "\e[0;32m\n***SECTION 2: Harbor source code\n\e[m"
echo -e "\e[0;32mDownloading $HARBOR_SRC \e[m" 
wget -q $HARBOR_SRC 1> /dev/null
tar zxf $HARBOR_TARBALL

echo -e "\e[0;32m\n***SECTION 3: Deploying Harbor\n\e[m"
export EXTERNAL_URL=https://$CODESPACE_NAME-80.preview.app.github.dev
export HARBOR_PASS=ThisIsASuperSecurePassword
export DB_PASS=ThisIsASuperSecurePassword

CONFIG_FILE=harbor.yml.tmpl

envsubst < $CONFIG_FILE > harbor/harbor.yml

cd harbor
./prepare
sudo ./install.sh

echo -e "\e[0;32m\n***SECTION 4: Cleaning up\n\e[m"
cd ..
sudo rm -rf harbor $HARBOR_TARBALL
