<b>Chromebook Coral rev5 (Apollolake / Broxton) Audio fix / TPM / Sleep & Resume</b><br>
<br>

AUDIO APOLLOLAKE / BROXTON /SKYLAKE FIX + SLEEP/RESUME (TPM)<br>
<br>
<br>
Install MrChromeBox RW/Legacy firmware<br>
Developer mode + ctrl -d<br>
sudo crossystem "dev_boot_usb"=1 "dev_boot_altfw"=1 "dev_boot_signed"=0<br>
<br>
Can be installed on internal with GBB FLAGS , FORCE_DEV_MODE, FORCE_DEV_ALTFW, SHORT_WAIT<Br>
 sudo /usr/share/vboot/bin/set_gbb_flags.sh 0xd <br>
reduce google screen start: sudo crossystem "loc_idx"=100 <br>
<br>
Linux kernel 5.13 Audio fix Apollo Lake Chromebooks <br>
Kernel 5.13.0-19-generic (Fresh install Ubuntu 21.10 impish)  <br>
Double checked , altered some typos<br><br>
Sources + Partner + Partner sources repositories should be enabled.<br>
After install it should mention Headphones - Celeron N3350 / Pentium N4..<br>
Sound is via speakers<br>
  <br>
<br>Suspend Resume also working
<br>
TODO: <br>
-Alsa UCM ->  profile jack / speaker<br> 




