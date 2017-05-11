#!/bin/bash
set -e
# ----------------------------------------------------------------------
# Install scripts
# Maintainer: Buddy <buddy.zhang@aliyun.com>
#
# Copyright (C) 2017 BiscuitOS
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

# ----------------------------------------------
# Path for installing
# ----------------------------------------------
INSTALL_PATH=/usr/local/sbin/CallMap

# ----------------------------------------------
# Path of configure file
# ----------------------------------------------
CONFIG_PATH=/etc/CallMap

# ----------------------------------------------
# Name of configure
# ----------------------------------------------
CONFIG_NAME=CallMap.conf

# ----------------------------------------------
# Path of bin
# ----------------------------------------------
BIN_PATH=/usr/bin

# ----------------------------------------------
# Name of bin
# ----------------------------------------------
BIN_NAME=callmap

# ----------------------------------------------
# Main file
# ----------------------------------------------
MAIN_FILE=CallMap.sh

# -----------------------------------------------
# Main dirent
# -----------------------------------------------
MAIN_DIRENT=CallMap

# -----------------------------------------------
# Local configure file
# -----------------------------------------------

ROOT=`pwd`

# File check
if [ ! -f ${ROOT}/${MAIN_DIRENT}/${MAIN_FILE} ]; then
    echo "Abort! Losing ${MAIN_FILE}"
    exit 0
fi

if [ ! -d ${ROOT}/${MAIN_DIRENT} ]; then
    echo "Abort! Losing ${MAIN_DIRENT}"
fi

# Install
if [ ! -d ${INSTALL_PATH} ]; then
    mkdir -p ${INSTALL_PATH}
fi

if [ ! -d ${CONFIG_PATH} ]; then
    mkdir -p ${CONFIG_PATH}
fi

install ${ROOT}/${MAIN_DIRENT}/* ${INSTALL_PATH}
chmod +x -R ${INSTALL_PATH}

# Create link
if [ ! -f ${CONFIG_PATH}/${CONFIG_NAME} ]; then
    ln -s ${INSTALL_PATH}/${CONFIG_NAME} ${CONFIG_PATH}/${CONFIG_NAME} 
fi
if [ ! -f ${BIN_PATH}/${BIN_NAME} ]; then
    ln -s ${INSTALL_PATH}/${MAIN_FILE} ${BIN_PATH}/${BIN_NAME} 
fi

# Install tools from apt-get source 
apt-get -y --no-install-recommends --fix-missing install \
            cflow graphviz gawk

clear
echo -e "\e[1;31m Install finish! \e[0m"
echo ""
echo -e "\e[1;31m ** CallMap Usage ** \e[0m"
echo -e "\e[1;31m 1. Import Source Code tree on /etc/CallMap/CallMap.conf \e[0m"
echo -e "\e[1;31m    > SOURCE_TREE point your source tree  \e[0m"
echo -e "\e[1;31m 2. Normal Usage  \e[0m"
echo -e "\e[1;31m    callmap function_name  \e[0m"
echo -e "\e[1;31m    eg:  \e[0m"
echo -e "\e[1;31m    callmap main  \e[0m"
echo ""
echo -e "\e[1;31m    Good Luck!  \e[0m"
