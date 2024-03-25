# Cartes videos:
- none   : rien  
- std    : standard VGA (default) - can work with [JHRobotics SoftGpu](https://github.com/JHRobotics/softgpu)  
  - Windows Host : Tested with SoftGpu, little problem on display settings but work by trying several times.  
- cirrus : Cirrus VGA (5446, a classic):  
  - Windows Host : Drivers 1.41 : bug display settings  
- vmware : VMWare SVGA"  
- qxl    : QXL VGA"  
- virtio : Virtio VGA"  

(- device `ati-vga` 2 ati rage pro)

<br>

# Cartes son:
- sb16   : Creative Sound Blaster 16, bus isa (peut poser problème*)  
- AC97 : Intel 82801AA AC97 Audio, bus PCI, alias "ac97" (1999)  
- ES1370 : ENSONIQ AudioPCI ES1370, bus PCI (1997)  

mettre -audio none pour ne rien avoir 

!!! warning
    recent versions of QEMU (>= 4.0) have a broken support for this sound card. See bug: [[2]](https://bugs.launchpad.net/qemu/+bug/1873769). Briefly, when QEMU's GTK UI is used and audio is playing, you'll experience the QEMU window freezing. In addition, there will be flickering in the audio as well. (wiki.osdev.org)[https://wiki.osdev.org/Sound_Blaster_16]

<br> 



draft
name "adlib", bus ISA, desc "Yamaha YM3812 (OPL2)"
name "cs4231a", bus ISA, desc "Crystal Semiconductor CS4231A"
name "gus", bus ISA, desc "Gravis Ultrasound GF1"
name "hda-duplex", bus HDA, desc "HDA Audio Codec, duplex (line-out, line-in)"
name "hda-micro", bus HDA, desc "HDA Audio Codec, duplex (speaker, microphone)"
name "hda-output", bus HDA, desc "HDA Audio Codec, output-only (line-out)"
name "ich9-intel-hda", bus PCI, desc "Intel HD Audio Controller (ich9)"
name "intel-hda", bus PCI, desc "Intel HD Audio Controller (ich6)"

name "usb-audio", bus usb-bus
name "virtio-sound-device", bus virtio-bus
name "virtio-sound-pci", bus PCI, alias "virtio-sound", desc "Virtio Sound"

<br>

# Cartes réseaux
- e1000  : 10/100/1000Mb (pci) 
- RTL8139 : 100 mbps (1997)
