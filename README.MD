<strong>New appoach1, to get audio working without / with SOF / get DA7219 working:</strong><br>
1. Extract Device-tree from kernel firmware or kernel ChromeOS, and or overlays. (dts,Dtb,dtbo)<br>
2. Extract ACPI from chromeOS<br>
3 build new kernel with (flat) Device-tree <br>
4 make sure regulator reg_audio: is included.<br>
5 build<br>
<Br>

<strong>New appoach2, to get audio working without / with SOF / get DA7219 working:</strong><br>
1. Add to da7219.h :
U32 vddio
u32 vdd
u32 vddmic

2 add to acpi dlg,vddio and value 1800 , dlg,vdd value 1800 and dlg,vddmic  3300
3 da719.c  read ACPI and write to according u32.

+     if (device_property_read_u32(dev, "dlg,vdd", &of_val32) >= 0)
+             pdata->vdd = of_val32;
+

+     if (device_property_read_u32(dev, "dlg,vddio", &of_val32) >= 0)
+             pdata->vddio = of_val32;
+


+     if (device_property_read_u32(dev, "dlg,vddmic", &of_val32) >= 0)
+             pdata->vddmic = of_val32;
+
 ret = regulator_get_voltage(vddio);
+     /* If regulator_get_voltage() fails, try to use vddio from pdata. */
+     if (ret < 0 && da7219->pdata)
+            ret = da7219->pdata->vddio;
   
 ret = regulator_get_voltage(vdd);
+     /* If regulator_get_voltage() fails, try to use vdd from pdata. */
+     if (ret < 0 && da7219->pdata)
+            ret = da7219->pdata->vdd;


  ret = regulator_get_voltage(vddmic);
    /* If regulator_get_voltage() fails, try to use vddio from pdata. */
+     if (ret < 0 && da7219->pdata)
+            ret = da7219->pdata->vddmic;

+             dev_warn(component->dev, "Invalid VDDIO voltage: %d mV\n",
+                     ret);

 
 
+     /* Handle DT/ACPI/Platform data */
+     da7219->pdata = dev_get_platdata(component->dev);
 +     if (!da7219->pdata)
 +             da7219->pdata = da7219_fw_to_pdata(component);
 +


Or use Device tree and ACPI together..
Works guaranteed!! 
Thanks


<b><strong>Chromebook Coral rev5 (Apollolake / Broxton) Audio fix v4</strong></b><br>
There is now an offical SOF topology file for the APL platform with da7219, made by the SOF Team<br>
delete original sof-apl-da7219.tplg
extract the file: sof-apl-da7219.tplg.gz<br>
make apollolake_audio2.sh executable
Run the apollolake_audio2.sh<br>
If audio problems still persist, manually copy the options from the sh file into /etc/modprobe.d/inteldsp.conf


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

