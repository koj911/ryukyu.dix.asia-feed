#!/bin/bash
set -x

IPATH=/usr/local/share/ryukyu.dix.asia

systemctl disable --now ryukyu-mlat
systemctl disable --now ryukyu-mlat2 &>/dev/null
systemctl disable --now ryukyu-feed

if [[ -d /usr/local/share/tar1090/html-ryukyu ]]; then
    bash /usr/local/share/tar1090/uninstall.sh ryukyu
fi

rm -f /lib/systemd/system/ryukyu-mlat.service
rm -f /lib/systemd/system/ryukyu-mlat2.service
rm -f /lib/systemd/system/ryukyu-feed.service

cp -f "$IPATH/ryukyu-uuid" /tmp/ryukyu-uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/ryukyu-uuid "$IPATH/ryukyu-uuid"

set +x

echo -----
echo "ryukyu.dix.asia feed scripts have been uninstalled!"
