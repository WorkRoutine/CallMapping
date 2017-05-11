#!/bin/bash
# ----------------------------------------------------------------------
# CallMap 
# Maintainer: Buddy <buddy.zhang@aliyun.com>
#
# Copyright (C) 2017 BiscuitOS
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

# Import CallMap configure
. /etc/CallMap/CallMap.conf

PWD=`pwd`
${CALLMAP} -f $1 -d ${SOURCE_TREE} -b ${BROWSER} -D ${TREE_DEEP} > /dev/null 2>&1
sleep 2
rm -rf *.svg

