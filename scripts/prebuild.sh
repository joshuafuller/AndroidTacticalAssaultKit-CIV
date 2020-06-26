#!/bin/sh

WORKDIR="$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)")"

(cd $WORKDIR && \
        gzip -d ./depends/gdal-2.2.3-mod.tar.gz && \
        cp depends/gdal-2.2.3-mod.tar . && \
        tar xf gdal-2.2.3-mod.tar)

(cd $WORKDIR/takthirdparty && make TARGET=android-armeabi-v7a \
	build_spatialite \
	build_commoncommo \
	build_gdal \
	build_assimp) &
(cd $WORKDIR/takthirdparty && make TARGET=android-arm64-v8a \
	build_spatialite \
	build_commoncommo \
	build_gdal \
	build_assimp) &
(cd $WORKDIR/takthirdparty && make TARGET=android-x86 \
	build_spatialite \
	build_commoncommo \
	build_gdal \
	build_assimp) &
wait

(mkdir -p $WORKDIR/takengine/thirdparty && cd $WORKDIR/takengine/thirdparty && git clone https://github.com/synesissoftware/STLSoft-1.9.git stlsoft)
