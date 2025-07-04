#!/bin/bash

DEVICE="$MY_DEVICE"
# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

if [[ "$DEVICE" == "rax3000m" ]];then
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/MineRouter/g' package/base-files/files/bin/config_generate
fi
	

