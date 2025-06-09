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
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.defaul
sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '3i src-git opentopd https://github.com/sirpdboy/sirpdboy-package' feeds.conf.default

curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe

mkdir -p package/xiaouex
mv -f $GITHUB_WORKSPACE/x86/files/ipv6-helper package/xiaouex/ipv6-helper

cp $GITHUB_WORKSPACE/bbr3/601-*.patch target/linux/generic/hack-6.12
cp $GITHUB_WORKSPACE/bbr3/501-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/bbr3/502-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/bbr3/500-*.patch package/network/utils/iproute2/patches

sed -i 's/CONFIG_DEFAULT_NET_SCH="fq_codel"/CONFIG_DEFAULT_NET_SCH="fq_pie"/ '  target/linux/generic/config-6.12
sed -i 's/# CONFIG_DEFAULT_FQ_PIE is not set/CONFIG_DEFAULT_FQ_PIE=y/' target/linux/generic/config-6.12
sed -i 's/CONFIG_DEFAULT_FQ_CODEL=y/# CONFIG_DEFAULT_FQ_CODEL is not set/' target/linux/generic/config-6.12
sed -i 's/# CONFIG_NET_SCH_FQ_PIE is not set/CONFIG_NET_SCH_FQ_PIE=y/' target/linux/generic/config-6.12
sed -i '$a\CONFIG_DEFAULT_NET_SCH="fq_pie"' target/linux/x86/config-6.12
sed -i '$a\CONFIG_DEFAULT_FQ_PIE=y' target/linux/x86/config-6.12
sed -i '$a\CONFIG_NET_SCH_FQ_PIE=y' target/linux/x86/config-6.12