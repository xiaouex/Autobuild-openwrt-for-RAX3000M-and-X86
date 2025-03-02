#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '3i src-git opentopd https://github.com/sirpdboy/sirpdboy-package' feeds.conf.default
#sed -i '5s/.*/& bridger/' $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/filogic/target.mk
#cp -f $GITHUB_WORKSPACE/rax3000m/Config.in $GITHUB_WORKSPACE/openwrt/toolchain/Config.in
#cp -f $GITHUB_WORKSPACE/rax3000m/Bridger_Makefile $GITHUB_WORKSPACE/openwrt/package/network/services/bridger/Makefile
cp -f $GITHUB_WORKSPACE/rax3000m/mt7981b-cmcc-rax3000m-nand.dts $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/dts/mt7981b-cmcc-rax3000m-nand.dts
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

mkdir -p package/xiaouex
mv -f $GITHUB_WORKSPACE/rax3000m/files/ipv6-helper package/xiaouex/ipv6-helper