#!/bin/bash

echo "-------------------------------------------------------"
echo "WeUpLearning Custom DevStack Install for juniper alpha1"
echo "-------------------------------------------------------"

echo "# Part2 !"

echo "# Creating directories"
cd ~
mkdir edx
cd edx
mkdir devstack_files
cd devstack_files

echo "#Cloning devstack"
git clone https://github.com/weuplearning/devstack
cd devstack
git checkout open-release/juniper.rc3

echo "#Starting deployment"
export OPENEDX_RELEASE=juniper.rc3
make dev.checkout
make dev.clone
make dev.provision

cd ~/edx/devstack_files/devstack/
docker cp cms.yml edx.devstack.studio:/edx/etc/ &&
docker cp lms.yml edx.devstack.studio:/edx/etc/ &&
docker cp studio.yml edx.devstack.studio:/edx/etc/ &&
docker cp cms.yml edx.devstack.lms:/edx/etc/ &&
docker cp lms.yml edx.devstack.lms:/edx/etc/

echo '#Lauching devstack'
make lms-restart
make studio-restart
make dev.up
