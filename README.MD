<b>My Apollolake is Bricked, after changing firmware</b><br>
I cannot check issues anymore, you are on your own.... for now<br>
Good luck <br>
 


<b><strong>Chromebook Coral rev5 (Apollolake / Broxton) Audio fix v4</strong></b><br>
There is now an offical SOF topology file for the APL platform with da7219, made by the SOF Team<br>
extract the file: sof-apl-da7219.tplg.gz<br>
Run the apollolake_audio2.sh<br>



<b><strong>Chromebook Coral rev5 (Apollolake / Broxton) Audio fix v3</strong></b><br>
sudo cp /lib/firmware/intel/sof-tplg/sof-glk-da7219.tplg  /lib/firmware/intel/sof-tplg/sof-apl-da7219.tplg <br>
sudo sed -i 's/ssp1/ssp5/g' /lib/firmware/intel/sof-tplg/sof-apl-da7219.tplg <br>
sudo sed -i 's/SSP1/SSP5/g' /lib/firmware/intel/sof-tplg/sof-apl-da7219.tplg <br>
sudo sed -i 's/ssp2/ssp1/g' /lib/firmware/intel/sof-tplg/sof-apl-da7219.tplg <br>
sudo sed -i 's/SSP2/SSP1/g' /lib/firmware/intel/sof-tplg/sof-apl-da7219.tplg<br>
reboot<br>





<b><strong>Chromebook Coral rev5 (Apollolake / Broxton) Audio fix v2</strong></b><br>
Copy only the new tplg file to /lib/firmware/intel/sof-tplg<br>
 Kernel parameter: snd_intel_dspcfg.dsp_driver=3<br>
 <br>
 Or... just run: apollolake_audio2.sh<br>
 <br>
<br>That's it<br>
 <br>
 Rest is obsolete<br>
 
 



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
 sudo sh /usr/share/vboot/bin/set_gbb_flags.sh 0xd <br>
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

<br>
 <br>

output $ aplay -l<br>
 <br>
&nbsp; &#42;&#42;&#42;&#42; List of PLAYBACK Hardware Devices &#42;&#42;&#42;&#42;<br>
card 0: sofbxtda7219max [sof-bxtda7219max], device 0: Speakers (&#42;) []<br>
&nbsp;&nbsp;  Subdevices: 0/1<br>
&nbsp;&nbsp;  Subdevice #0: subdevice #0<br>
card 0: sofbxtda7219max [sof-bxtda7219max], device 1: Headset (&#42;) []<br>
&nbsp;&nbsp;  Subdevices: 1/1<br>
&nbsp;&nbsp;  Subdevice #0: subdevice #0<br>
card 0: sofbxtda7219max [sof-bxtda7219max], device 5: HDMI1 (&#42;) []<br>
&nbsp;&nbsp;  Subdevices: 1/1<br>
&nbsp;&nbsp;  Subdevice #0: subdevice #0<br>
card 0: sofbxtda7219max [sof-bxtda7219max], device 6: HDMI2 (&#42;) []<br>
&nbsp;&nbsp;  Subdevices: 1/1<br>
&nbsp;&nbsp;  Subdevice #0: subdevice #0<br>
card 0: sofbxtda7219max [sof-bxtda7219max], device 7: HDMI3 (&#42;) []<br>
&nbsp;&nbsp;  Subdevices: 1/1<br>
&nbsp;&nbsp;  Subdevice #0: subdevice #0<br>

