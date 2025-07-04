#!/bin/bash


DEVICE="$MY_DEVICE"


# Add feed sources
sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe

chmod +x $GITHUB_WORKSPACE/config/files/my-script/files/my_script
mkdir -p package/xiaouex
mv -f $GITHUB_WORKSPACE/config/files/ipv6-helper package/xiaouex/ipv6-helper
mv -f $GITHUB_WORKSPACE/config/files/my-script package/xiaouex/my-script


cp $GITHUB_WORKSPACE/config/files/bbr3/601-*.patch target/linux/generic/hack-6.12
cp $GITHUB_WORKSPACE/config/files/bbr3/501-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/config/files/bbr3/502-*.patch package/network/utils/iproute2/patches
cp $GITHUB_WORKSPACE/config/files/bbr3/500-*.patch package/network/utils/iproute2/patches

sed -i '/label = "bl2";/,/};/ { /read-only;/d }' target/linux/mediatek/dts/mt7981b-cmcc-rax3000m-nand.dtso
