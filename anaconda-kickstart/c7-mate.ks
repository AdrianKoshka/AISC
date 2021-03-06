#VERSION=RHEL7
# Copyright 2017-2018, Adrian Lucrèce Céleste and the AIS contributors
# SPDX-License-Identifier: GPL-3.0+
# System authorization information
auth --enableshadow --passalgo=sha512
# Use network installation
url --url="http://mirror.gignet.com/centos/7/os/x86_64/"
repo --name="epel" --mirrorlist="https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch"
repo --name=google-chrome --baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --activate
network  --hostname=hostname.domainname
#Root password
rootpw --lock
# System timezone
timezone America/New_York --isUtc
user --groups=wheel --name=yourusername --password= --iscrypted --gecos="your full name"
# use python3 -c 'import crypt; print(crypt.crypt("My Password"))' to generate a sha512
# crypt-compatible hash of your password that uses a random salt:
# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html
# Firewall configuration
firewall --enabled --ssh
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm --nohome
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --drives=sda --all --initlabel

%packages
@base
@core
@desktop-debugging
@directory-client
@fonts
@guest-agents
@guest-desktop-agents
@input-methods
@internet-browser
@java-platform
@multimedia
@network-file-system-client
@networkmanager-submodules
@print-client
@x11
@MATE
epel-release
google-chrome-stable
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
