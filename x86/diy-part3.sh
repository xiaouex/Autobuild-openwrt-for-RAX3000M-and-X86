mv -f $GITHUB_WORKSPACE/x86/files/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
mv -f $GITHUB_WORKSPACE/x86/files/Makefile_v2ray_geodata feeds/smpackage/v2ray-geodata/Makefile
git clone https://github.com/gSpotx2f/luci-app-temp-status feeds/luci/applications/luci-app-temp-status
#sed -i 's/PKG_VERSION:=0.4.1-r1/PKG_VERSION:=0.4.1/g' feeds/luci/applications/luci-app-temp-status/Makefile
#sed -i '14i PKG_RELEASE:=2' feeds/luci/applications/luci-app-temp-status/Makefile
./scripts/feeds update -a
./scripts/feeds install -a 
#rm -rf feeds/opentopd/luci-app-autotimeset
#git clone https://github.com/sirpdboy/luci-app-autotimeset feeds/opentopd/luci-app-autotimeset
