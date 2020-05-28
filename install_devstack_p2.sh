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
git checkout master

echo "#Starting deployment"
export OPENEDX_RELEASE=
make dev.checkout
make dev.clone
make dev.provision

echo '#Lauching devstack'
make lms-restart
make studio-restart
make dev.up
