mv -f $GITHUB_WORKSPACE/x86/files/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
./scripts/feeds update -a
./scripts/feeds install -a 
#rm -rf feeds/opentopd/luci-app-autotimeset
#git clone https://github.com/sirpdboy/luci-app-autotimeset feeds/opentopd/luci-app-autotimeset
