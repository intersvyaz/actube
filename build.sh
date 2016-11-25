#!/bin/bash

# For more information read:
# - https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk
# - https://wiki.openwrt.org/doc/devel/crosscompile

# Please, change this variables!
ACTUBE_PATH="$PWD"
OPENWRT_SDK_PATH="$HOME/work/OpenWrt-SDK-15.05.1-ar71xx-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64"
OPENWRT_TARGET_PATH="$OPENWRT_SDK_PATH/staging_dir/target-mips_34kc_uClibc-0.9.33.2"
OPENWRT_TOOLCHAIN_PATH="$OPENWRT_SDK_PATH/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-0.9.33.2"

# Prepare sdk environment
export PATH="$PATH:$OPENWRT_TOOLCHAIN_PATH/bin"
export STAGING_DIR="$OPENWRT_TOOLCHAIN_PATH"

# Install dependencies
#sudo aptitude install ccache
#cd $OPENWRT_SDK_PATH && ./scripts/feeds update -a
#cd $OPENWRT_SDK_PATH && ./scripts/feeds install libopenssl libnettle libgnutls
#cd $OPENWRT_SDK_PATH && make

# Prepare dev environment
export CC=mips-openwrt-linux-uclibc-gcc
export LD=mips-openwrt-linux-uclibc-ld
export AR=mips-openwrt-linux-uclibc-ar

export CFLAGS="-D_GNU_SOURCE -I$OPENWRT_TARGET_PATH/usr/include"
export LDFLAGS="-L$OPENWRT_TARGET_PATH/usr/lib"

make -C $ACTUBE_PATH/src/contrib/jsmn
make -C $ACTUBE_PATH/src/cw
make -C $ACTUBE_PATH/src/mod
make -C $ACTUBE_PATH/src/wtp
