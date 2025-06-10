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
cp -f $GITHUB_WORKSPACE/rax3000m/mt7981b-cmcc-rax3000m-nand.dtso $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/dts/mt7981b-cmcc-rax3000m-nand.dtso
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

mkdir -p package/xiaouex
mv -f $GITHUB_WORKSPACE/rax3000m/files/ipv6-helper package/xiaouex/ipv6-helper
mv -f $GITHUB_WORKSPACE/rax3000m/files/my-script package/xiaouex/my-script

cp $GITHUB_WORKSPACE/bbr3/601-*.patch target/linux/generic/hack-6.12
cp $GITHUB_WORKSPACE/bbr3/501-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/bbr3/502-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/bbr3/500-*.patch package/network/utils/iproute2/patches