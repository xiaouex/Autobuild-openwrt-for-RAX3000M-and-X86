mv -f $GITHUB_WORKSPACE/x86/files/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
mv -f $GITHUB_WORKSPACE/x86/files/Makefile_v2ray_geodata feeds/smallpackage/v2ray-geodata/Makefile
./scripts/feeds update -a
./scripts/feeds install -a 
#rm -rf feeds/opentopd/luci-app-autotimeset
#git clone https://github.com/sirpdboy/luci-app-autotimeset feeds/opentopd/luci-app-autotimeset
