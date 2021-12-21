Install MrChromeBox RW/Legacy firmware
Developer mode + ctrl -d
sudo crossystem "dev_boot_usb"=1 "dev_boot_altfw"=1 "dev_boot_signed"=0

Can be installed on internal with GBB FLAGS , FORCE_DEV_MODE, FORCE_DEV_ALTFW, SHORT_WAIT
reduce google screen start: sudo crossystem "loc_idx"=100 

Linux kernel 5.13 Audio fix Apollo Lake Chromebooks
Working Ubuntu 21.10
<br>Suspend Resume also working

TODO: <br>
-Alsa UCM ->  profile jack / speaker<br> 
-acpid lid open/close



