# Kickstart file automatically generated by anaconda.
# Copyright 2017-2018, Adrian Lucrèce Céleste and the AIS contributors
# SPDX-License-Identifier: GPL-3.0+
#version=RHEL6
install
text
url --url=http://mirror.rit.edu/centos/6/os/i386/
lang en_US.UTF-8
keyboard us
network --onboot yes --device eth0 --bootproto dhcp --noipv6 --hostname=c6-x86-01.localdomain
rootpw  --iscrypted $6$T7Nss6xFxdCR9lWb$ByUC4IQzWhwicd60QcTL1Dmful9fkFm3W8DODOcVIwmAigoCb7y36D7xtkNZDdIQQgeoje6Nm0yVeqWYN9JfP/
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --enforcing
timezone --utc America/New_York
bootloader --location=mbr --driveorder=sda --append="crashkernel=auto rhgb quiet"
# The following is the partition information you requested
# Note that any partitions you deleted are not expressed
# here so unless you clear all partitions first, this is
# not guaranteed to work
zerombr
clearpart --all --drives=sda
reboot
part /boot --fstype=ext4 --size=500
part pv.253002 --grow --size=1
volgroup vg_c601 --pesize=4096 pv.253002
logvol / --fstype=ext4 --name=lv_root --vgname=vg_c601 --grow --size=1024 --maxsize=51200
logvol swap --name=lv_swap --vgname=vg_c601 --grow --size=2016 --maxsize=2016

repo --name="CentOS"  --baseurl=http://mirror.rit.edu/centos/6/os/i386/ --cost=100

%packages
@core
@server-policy
@workstation-policy
%end
