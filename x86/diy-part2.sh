#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/luci2/bin/config_generate
# Modify hostname
#sed -i 's/LEDE/MineRouter/g' package/base-files/files/bin/config_generate
#sed -i 's/LEDE/MineRouter/g' package/base-files/luci2/bin/config_generate
#sed -i 's/LEDE/MineRouter/g' package/base-files/files/etc/init.d/system

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 加入OpenClash核心
#chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
#$GITHUB_WORKSPACE/preset-clash-core.sh

sed -i 's/PKG_SOURCE_DATE:=2024-04-04/PKG_SOURCE_DATE:=2025-02-14/g' package/kernel/mt76/Makefile
sed -i 's/8f301a5c5fe3d998b50666bde1d35d412833be89/e5fef138524e63314cb96ff8314048d175294e95/g' package/kernel/mt76/Makefile
sed -i 's/49291145ccceeac2964c9a43a46bed88298e5c1da63c6f3c2c1f6b3c1902a61e/4d6ea8669b3034c97f5b341a5473facf4fe21262a2fde71257b57c4d1c86be5e/g' package/kernel/mt76/Makefile
