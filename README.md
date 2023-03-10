# Overview

A collection of information about the notebook Acer Predator Helios 300 2021 (PH315-54-70LH, Brazil Version).

## Notebook specifications

| Device                  | PH315-54-70LH, Brazil Version                               |
| ----------------------- | :---------------------------------------------------------- |
|Screen	  | 15.6 inch, 1920 x 1080 px resolution, IPS, 144 Hz|
|Processor|	Intel Tiger Lake Core i7-11800H, eight-core|
|Video    |	Intel UHD and up to Nvidia GeForce RTX 3070 8GB 80-110W|
|Memory   |	16 GB DDR4-3200 (2x 8 GB DIMMs, dual-channel, Brazil Brand ADATA)|
|Storage  | 512 GB PCie gen4 SSDs, Brazil Brand WD Black, 2x M.2 slots + 2.5″ bay|
|Connectivity|	WiFi 6 (Killer AX1650i) with Bluetooth 5.2, Killer 2600 Gigabit Ethernet LAN|
|Ports	     | 3x USB-A 3.2 gen2, 1x USB-C with Thunderbolt 4, HDMI 2.1, miniDP, LAN, headphone/mic, Kensington Lock|
|Battery	 | 58 Wh, 230 W power adapter|
|Size	     | 363 mm or 14.27” (w) x  255 mm or 10” (d) x  22.9 mm or .9” (h)|
|Weight	     | 2.2 kg (4.85 lb), .75 kg (1.65 lbs) power brick, EU version|
|Extras	     | RGB backlit keyboard – 4 zones, NumPad, 2x stereo speakers, HD webcam|

[Source](https://www.ultrabookreview.com/47441-acer-predator-helios-300-review-ph315-54/)

## Windows

* [Unlock undervolting](https://www.reddit.com/r/AcerNitro/comments/qvznen/unlock_undervolting_on_11th_gen_h45_nitro_5/)
* [Unlock BIOS Downgrade](https://www.tenforums.com/drivers-hardware/72206-downgrade-acer-laptop-bios.html)
* [Unlock BIOS Downgrade 2](https://community.acer.com/en/discussion/536571/is-it-possible-to-downgrade-a-bios)
* [Heating Issue System/PCH](https://community.acer.com/en/discussion/648827/heating-issue-helios-300-ph315-54)

### Video Bios Mod RTX 3070

* [Unlock 140W TGP on PH315-54 - RTX 3070 - Portuguese](https://www.youtube.com/watch?v=Vp9Xb-62W9k)
* VBios Files (to use with nvflash.exe):
    * [My VBios](https://www.techpowerup.com/vgabios/236084/236084) - Base ??? / Max 110W TGP - MD5 3491a5598028693a0e39a218a64d4522
    * [PH317-55 VBios](https://www.techpowerup.com/vgabios/239596/239596) - Base 112W/Max 140W TGP - MD5 fe551497a9171e1f64c44d5d3bd4ab49
    * [Above video VBios - Model ???](https://www.techpowerup.com/vgabios/241172/241172) - Base 115W/Max 140W TGP - MD5 de2f57f0a19dde8cd64f01735be4be23
    * [MSI GE76 RAIDER 10UG](https://www.techpowerup.com/vgabios/229426/229426) - Base 125W/Max 140W TGP - MD5 8d7eb73124f196f827e9ade2de65772d

## Linux

* [Turbo mode and RGB Keyboard](https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module)
* [Fan control](https://github.com/nbfc-linux/nbfc-linux)
* [ACPI Acer EC module](https://github.com/MusiKid/acpi_ec)
* [Generic info about Acer Notebook on linux](https://wiki.archlinux.org/title/Laptop/Acer)
* [intel-undervolt](https://github.com/kitsunyan/intel-undervolt)
* [Acer Baterry Health and Calibration](https://github.com/frederik-h/acer-wmi-battery)

### PCH Tiger Lake Temp Read

There is no PCH temp reading on linux (System temp on Predator Sense on Windows side). I tested on kernel 6.0, 6.1 and 6.2-rc6, and there is no information about the
PCH temp reported by the kernel. Using the `acpi_ec` and `nbfc`, I could read this information from the EC reg directly.
To get this information you need to compile the `nbfc` project and use the `ec_probe` program to read the register 0xB3
in my case. You can run the command `sudo ec_probe read 0xB3` to get the measure.

EC List:

* `0xB3` : Intel PCH Temp
* `0xB4` : RTX 3070 Temp
* `0x13` : Read CPU Fan Speed ??? (From [nbfc config file](https://github.com/nbfc-linux/nbfc-linux/blob/main/share/nbfc/configs/Acer%20Predator%20PH315-54.json))

### Undervolt

I'm using the intel-undervolt project to do the undervolt on 11800H CPU (after the unlock procedure on the Windows, see
the Windows section). I'm using this configuratio below without any problem:

```
undervolt 0 'CPU' -84.0
undervolt 1 'GPU' -25.0
undervolt 2 'CPU Cache' -70.0
#undervolt 3 'System Agent' -60.0 // This value does not work on my linux
undervolt 4 'Analog I/O' -65.0

# Min tjoffset -4
tjoffset -8
```

## Hardware Modifications

* [Open more ventilation slots on the back cover - Portuguese](https://www.youtube.com/watch?v=Yur9NBcA638)
* [Screen replace - Portuguese](https://www.youtube.com/watch?v=Jb1lpp_M8Mc)

## Resources

* Acer Support pages:
  * [USA](https://www.acer.com/us-en/support?filter=global_download&search=Predator%20PH315-54)
  * [Brazil](https://www.acer.com/br-pt/support?search=Predator%20PH315-54&filter=global_download&suggest=ph315-54;1)
* [Brazil User group on Telegram](https://t.me/predatorhelios300br)
* [PH315-54 Review](https://www.ultrabookreview.com/47441-acer-predator-helios-300-review-ph315-54/)