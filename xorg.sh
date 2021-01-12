export XORG_PREFIX=/usr/local
export PATH="$PATH:$XORG_PREFIX/bin"
LP="$PREFIX/include"
export CPPFLAGS="$CPPFLAGS -I$LP"
export CPATH="$CPATH:$LP"
export C_INCLUDE_PATH="$C_INCLUDE_PATH:$LP"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$LP"
export OBJC_INCLUDE_PATH="$OBJ_INCLUDE_PATH:$LP"
unset LP

LP="$PREFIX/lib"
export LDFLAGS="$LDFLAGS -L$LP"
export LIBRARY_PATH="$LIBRARY_PATH:$LP"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LP"
export LD_RUN_PATH="$LD_RUN_PATH:$LP"
unset LP

LP="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_LIBDIR="$PKG_CONFIG_LIBDIR:$LP"
export PKG_CONFIG_PATH="$XORG_PREFIX/share/pkgconfig:$LP:$PKG_CONFIG_PATH"
unset LP

export XORG_CONFIG="--prefix=$XORG_PREFIX --disable-shared --enable-static"
export ACLOCAL="aclocal -I $XORG_PREFIX/share/aclocal"

