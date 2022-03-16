#!/bin/bash
#OpenClash(AchmadPR)
echo "Auto Installer Openclash by Achmad PR"
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf
echo "src/gz custom_generic https://raw.githubusercontent.com/lrdrdn/my-opkg-repo/main/generic" >> /etc/opkg/customfeeds.conf
echo "src/gz custom_arch https://raw.githubusercontent.com/lrdrdn/my-opkg-repo/main/$(cat /etc/os-release | grep OPENWRT_ARCH | awk -F '"' '{print $2}')" >> /etc/opkg/customfeeds.conf
opkg list-installed | grep dnsmasq
opkg remove dnsmasq
opkg update && opkg install dnsmasq-full
opkg install luci luci-base iptables coreutils coreutils-nohup \
bash curl jsonfilter ca-certificates ipset ip-full \
iptables-mod-tproxy kmod-tun luci-compat
opkg install luci-app-openclash
echo "Instalasi Selesai, silahkan reboot perangkat anda"
echo "Auto Installer Config Editor Openclash by Achmad PR"

