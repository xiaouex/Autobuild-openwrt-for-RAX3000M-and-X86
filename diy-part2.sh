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
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/luci2/bin/config_generate
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

cp -f $GITHUB_WORKSPACE/bg1.jpg $GITHUB_WORKSPACE/openwrt/feeds/kenzo/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

echo "
CONFIG_PACKAGE_bridger=y
" >> .config
