#! /bin/sh
sudo apt install alsa-topology* alsa-ucm* linux-firmware
sudo apt install dpkg-dev build-essential
sudo apt-get build-dep linux linux-image-$(uname -r)
sudo apt install linux-source

cd /usr/src/
tar -xfvj linux-source-5.13.0.tar.bz2
sudo chmod -R 777 linux-source-5.13.0
cd linux-source-5.13.0
sed '750 i .disable_route_checks = true,' sound/soc/intel/boards/bxt_da7219_max98357a.c
sudo sh -c 'echo "options snd_intel_dspcfg dsp_driver=3" > /etc/modprobe.d/inteldsp.conf' 
make oldconfig
sudo cp /lib/modules/5.13.0-22-generic/modules* .
sudo cp /sys/kernel/btf/vmlinux .
sudo cp -R /lib/modules/5.13.0-22-generic/build .
sudo cp  /lib/modules/5.13.0-22-generic/build/Modules.symvers . 
make modules_prepare
make -j`nproc` M=sound/soc/intel/boards

sudo cp sound/soc/intel/boards/*.ko /lib/modules/5.13.0-22-generic/kernel/sound/soc/intel/boards/

sudo mkdir -p /lib/firmware/intel/sof/community
sudo cp -R /lib/firmware/intel/sof/s* /lib/firmware/intel/sof/community
sudo cp -R /lib/firmware/intel/sof/v* /lib/firmware/intel/sof/community
reboot
