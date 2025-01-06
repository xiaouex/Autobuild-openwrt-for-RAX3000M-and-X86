#!/bin/bash
#=================================================
# File name: perest-clash-core.sh
# System Required: Linux
# Version: 1.0 se
# Lisence: MIT
# Author: SuLingGG [edit by xiaouex]
# Changelog:Download Meta Core only
#=================================================

echo -e "预置Clash内核"
mkdir -p $GITHUB_WORKSPACE/openwrt/feeds/small/luci-app-openclash/root/etc/openclash/core
core_path="$GITHUB_WORKSPACE/openwrt/feeds/small/luci-app-openclash/root/etc/openclash/core"
goe_path="$GITHUB_WORKSPACE/openwrt/feeds/small/luci-app-openclash/root/etc/openclash"

cd $GITHUB_WORKSPACE/clash-core
gunzip -c mihomo-linux-amd64-alpha-*.gz  > $core_path/clash_meta
wget -qO- https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat > $goe_path/GeoIP.dat
wget -qO- https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat > $goe_path/GeoSite.dat

chmod +x $core_path/clash*
