#!/bin/bash


WORKDIR="$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)")"

cat << EOF > $WORKDIR/atak/local.properties
takDebugKeyFile=$TAK_KEY_FILE_PATH
takDebugKeyFilePassword=$TAK_KEY_FILE_PASSWD
takDebugKeyAlias=$TAK_KEY_ALIAS
takDebugKeyPassword=$TAK_KEY_PASSWD
takReleaseKeyFile=$TAK_KEY_FILE_PATH
takReleaseKeyFilePassword=$TAK_KEY_FILE_PASSWD
takReleaseKeyAlias=$TAK_KEY_ALIAS
takReleaseKeyPassword=$TAK_KEY_PASSWD
EOF

cd $WORKDIR/atak && ./gradlew assembleCivRelease
