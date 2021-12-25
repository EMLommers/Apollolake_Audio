#! /bin/sh
# v0.2
# 
# Sources + Partner sources repository should be enabled
# R/W Legacy from MrChromebox.tech should be installed
# Fresh install of (X/L)Ubuntu 21.10 Kernel 5.13.0-19-generic
# GBB flags 0xd . Running directly from internal SSD with sound. 
# Sound amplifier should be set and it should say 'Headphones - Celeron N3350/Pentium N4...'
# sound is via Speakers. At least it is working. WIP
# Double checked and removed some typos

sudo apt-get update && sudo apt-get upgrade
set -e
sudo apt install alsa-topology* alsa-ucm* linux-firmware
sudo apt install dpkg-dev build-essential g++-multilib g++-11-multilib gcc-multilib autoconf automake libtool flex bison gcc-11-multilib gcc-11-locales libncurses-dev 

sudo apt-get build-dep linux linux-image-$(uname -r)
sudo apt install linux-source

cd /usr/src/
sudo tar -xf linux-source-5.13.0.tar.bz2
sudo chmod -R 777 linux-source-5.13.0
cd linux-source-5.13.0
sed -i '750 i .disable_route_checks = true,' sound/soc/intel/boards/bxt_da7219_max98357a.c
sudo sh -c 'echo "options snd_intel_dspcfg dsp_driver=3" > /etc/modprobe.d/inteldsp.conf' 
make oldconfig
sudo cp /lib/modules/$(uname -r)/modules* .
sudo cp /sys/kernel/btf/vmlinux .
sudo cp -R /lib/modules/$(uname -r)/build .
sudo cp  /lib/modules/$(uname -r)/build/Module.symvers . 
make modules_prepare
make -j`nproc` M=sound/soc/intel/boards

sudo cp sound/soc/intel/boards/*.ko /lib/modules/$(uname -r)/kernel/sound/soc/intel/boards/

sudo mkdir -p /lib/firmware/intel/sof/community
sudo cp -R /lib/firmware/intel/sof/s* /lib/firmware/intel/sof/community
sudo cp -R /lib/firmware/intel/sof/v* /lib/firmware/intel/sof/community
reboot
