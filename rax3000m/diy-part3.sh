mv -f $GITHUB_WORKSPACE/rax3000m/files/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
mv -f $GITHUB_WORKSPACE/rax3000m/files/Makefile_v2ray_geodata feeds/smpackage/v2ray-geodata/Makefile
./scripts/feeds install -a 
#&& rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
#rm -rf feeds/packages/utils/v2dat
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
