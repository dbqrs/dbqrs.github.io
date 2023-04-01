---
author: rs
title: Yaesu FT-891 Cat Control
date: 2023-03-30 01:00:00 -0500 
categories: [Radio]
tags: [radio,yaesu,ft891,catcontrol] 
---

Usually the cat control on most rigs is just plain serial so you should be able to get the serial port of the radio like this: unplug the radio, run ls /dev/tty*, plug in the radio, then wait about 2 seconds, run the command again and write down the new device that pops up. It will probably be something like /dev/ttyAMA0 or /dev/ttyUSB0

If you put the serial port into flrig/fldigi and you get permission denied errors, run:

```bash
sudo usermod -a -G dialout username  
```

[FT-891 and TRX-manager CAT control software](https://www.lb3hc.net/archives/2699)

[RPI4, SignaLink, FT-891 ~ PTT works but no ALC/Power on Transmit](https://groups.io/g/KM4ACK-Pi/topic/rpi4_signalink_ft_891_ptt/83976935?p=)  

I had a lot of trouble with the Singnalink USB and the FT-891, but actually getting power out was not one of them. That said, I've been using FT8, Winlink and all other digital modes quite successfully with that hardware combination and the following radio settings (I did not need to adjust the Data Gain at all, since the Signalink has knobs on the front to adjust TX and RX gain!):  

05-06: CAT RATE: 19200 ; 38400  
05-07: CAT TOT: 1000 msec - kb9vbr  
05-08: CAT RTS: DISABLE; Disable  
08-01: DATA MODE: OTHERS; PSK  
08-02: PSK TONE: 1500  
08-03: OTHER DISP: 1500  
08-04: OTHER SHIFT: 1500  
08-05: DATA LCUT FREQ: 100  
08-06: LCUT SLOPE: 6db/Oct  
08-07: DATA HCUT FREQ: 4000  
08-08: DATA HCUT SLOPE: 6db/Oct  
08-09: DATA IN SELECT: REAR; Rear  
08-10: DATA PTT SELECT: DAKY; Daky  
08-11: DATA OUT LEVEL: 50  
08-12: DATA BFO: USB  
16-03 HF Power: 40 or less  

Menu -> WDH -> 3000  

5-6 Cat Rate: 38400  
5-7 CAT TOT: 1000 msec  
5-8 CAT RTS: Disable  
8-1 Data Mode: PSK  
8-9 Data In Select: Rear  
8-10 Data PTT Select: DAKY  
8-11 Data Out Level: 50  
8-12 Data BFO: USB  
16-03 HF Power: 40  




The Signalink draws its power from the USB socket on the computer, so if your computer is not giving it enough juice, the powered hub may be necessary.  

One thing to note, and it's hidden in the the Signalink USB documentation, is that the PTT mode in the software you're using should be set to "VOX". You do not set the radio to VOX, just the software. If you don't do this, the mic becomes active during transmit and other weird things happen. [See this link for the full troubleshooting session.] (https://wsjtx.groups.io/g/main/topic/82694038#24731) With the above settings, you will be using USB-Data mode. That's nice, because you don't have to keep switching between USB and LSB whenever you change modes/bands.