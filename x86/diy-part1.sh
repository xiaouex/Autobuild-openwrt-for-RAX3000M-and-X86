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

#rm -rf package/network/services/hostapd
#rm -rf package/kernel/mt76/Makefile
#rm -rf package/system/ubox
#rm -rf package/kernel/mt76/patches-6.x/002-mt7603-fix-mixed-code.patch
#rm -rf package/kernel/mt76/patches-6.x/003-wifi-mt76-mt7915-fix-oops.patch
#rm -rf package/kernel/mt76/patches-6.x/101-fixes-mt7925-build-error.patch
#rm -rf package/kernel/mt76/patches-6.x/200-fix-kernel-6.12-support.patch
#rm -rf package/kernel/mac80211
#mv -f $GITHUB_WORKSPACE/x86/files/hostapd package/network/services/hostapd
#mv -f $GITHUB_WORKSPACE/x86/files/Makefile_mt76 package/kernel/mt76/Makefile
#mv -f $GITHUB_WORKSPACE/x86/files/udebug package/libs/udebug
#mv -f $GITHUB_WORKSPACE/x86/files/Makefile_ubus package/system/ubus/Makefile
#mv -f $GITHUB_WORKSPACE/x86/files/ubox package/system/ubox
#mv -f $GITHUB_WORKSPACE/x86/files/mac80211 package/kernel/mac80211
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
cp $GITHUB_WORKSPACE/x86/files/952-add-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-6.12

cp $GITHUB_WORKSPACE/x86/files/001-libnftnl-add-fullcone-expression-support.patch package/libs/libnftnl/patches

mkdir package/turboacc/fullconenat-nft/patches
cp $GITHUB_WORKSPACE/x86/files/010-fix-build-with-kernel-6.12.patch package/turboacc/fullconenat-nft/patches/010-fix-build-with-kernel-6.12.patch

mkdir -p package/xiaouex
mv -f $GITHUB_WORKSPACE/x86/files/ipv6-helper package/xiaouex/ipv6-helper

#cp $GITHUB_WORKSPACE/bbr3/601-*.patch target/linux/generic/hack-6.12
#cp $GITHUB_WORKSPACE/bbr3/500-*.patch package/network/utils/iproute2/patches
#cp $GITHUB_WORKSPACE/bbr3/900-*.patch target/linux/ath79/patches-6.12