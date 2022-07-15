#! /bin/sh

sudo apt install alsa-topology* alsa-ucm* linux-firmware
sudo cp sof-apl-da7219.tplg /lib/firmware/intel/sof-tplg/
sudo sh -c 'echo "options snd_intel_dspcfg dsp_driver=3" >> /etc/modprobe.d/inteldsp.conf' 
sudo sh -c 'echo "options snd-sof-pci fw_path=/intel/sof/" >>  /etc/modprobe.d/inteldsp.conf' 
reboot

