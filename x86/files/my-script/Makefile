include $(TOPDIR)/rules.mk

PKG_NAME:=my-script
PKG_VERSION:=20250610
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/my-script
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=My Startup Script
endef

define Package/my-script/description
  A simple startup script to run some orders after startup.
endef

define Build/Compile
endef

define Package/my-script/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/my_script $(1)/etc/init.d/my_script
endef

$(eval $(call BuildPackage,my-script))
