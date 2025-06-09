mv -f $GITHUB_WORKSPACE/x86/files/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
mv -f $GITHUB_WORKSPACE/x86/files/Makefile_v2ray_geodata feeds/smpackage/v2ray-geodata/Makefile
git clone https://github.com/gSpotx2f/luci-app-temp-status feeds/luci/applications/luci-app-temp-status

./scripts/feeds update -a
./scripts/feeds install -a 
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile

