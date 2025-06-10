mv -f $GITHUB_WORKSPACE/rax3000m/files/Makefile_v2ray_geodata feeds/smpackage/v2ray-geodata/Makefile
git clone --depth 1 https://github.com/DustReliant/luci-app-filetransfer packages/xiaouex/luci-app-filetransfer
git clone --depth 1 https://github.com/gSpotx2f/luci-app-temp-status feeds/luci/applications/luci-app-temp-status


./scripts/feeds update -a
./scripts/feeds install -a 
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
