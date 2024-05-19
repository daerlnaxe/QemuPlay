|Jeu|OS|API|DoxBox|QEMU*|VMWARE*|VirtualBox*|86Box|Wrappers|Notes|
|-|-|-|-|-|-|-|-|-|-|
| Command & Conquer|DOS|DDRaw | TB |Non|Non|Non|Non|Non||
| Command & Conquer GOLD|Win9x|??? |Non|Err|Err|EE|TB|Perte réseau| La version gold dézoome pour afficher en 640x480, pose problème avec les pilotes JHRobotics et divers hyperviseurs de niveau 2. |
|Starcraft|Win98|DDRAW/DirectX2|Non|TB|TB|TB|TB|???|Simple à tester|
|Unreal|Win98|


*SoftGPU

<br><br>

# Tests
## Unreal

|Hyper/Emu|Host|Réglage|API|Résolution Max|Commentaire|
|-|-|-|-|-|-|
|VirtualBox|Windows 10|VMSVGA**|D3D|1920x1080 |Fluide|
|86Box|Windows11|Voodoo2 x1|3DFX|800x600|Fluide|
|VirtualBox|ArchW98|VBOXVGA|D3D|800x600|Fluide|


## Half Life
VirtualBox: Réglé en OpenGL 1600x1200
86Box Voodoo2x1 : 800x600
86Box Voodoo2x2 : 1024x768

<br><br>


# Mise en place VirtualBox pour SoftGPU
Ces paramètres sont à mettre autant sur Linux que sur Windows sinon l'accélération 3D ne se fera pas en passtrough

- General:
  - Type: Linux
  - Version: Other Linux (32-bit)   
- Controleur Graphic **VMSVGA**
- 


Create new VM selecting Machine -> New in menu
Type: Microsoft Windows, Version: Windows 98
Base memory: 512 MB (this is minimum (for vGPU10), but more 512 MB isn't recommended without additional patches!), CPU: 1
Disk size: recommended is at least 20 GB for 98/Me (you can select less, but HDD becomes full faster). Select 2 GB if you plan install Windows 95. Tip: If you storing virtual machine on classic HDD, check Pre-allocate Full Size, because it leads to lower disk image fragmentation.
Finish wizard
Open VM setting
In General change type to Linux and version to Other Linux (32-bit) => This setting haven't any effect to hardware configuration but allow you to set GPU type through GUI.
Now in Display

set video memory to 128 MB (VBox sometimes turn off GPU HW acceleration if this value is lower). More on this issue and more about VRAM usability.
Check enable 3D Acceleration
Optional adjustment
set USB controller to USB 1.1 (OHCI) for 98/Me, or turn USB off for 95
Audio controller set to SoundBlaster 16 for 95 and 98 or AC 97 for 98 and Me (working drivers for Windows 98 are below).
Install system - Windows 98 SE is highly recommended (for newer CPU, you need my patch: https://github.com/JHRobotics/patcher9x)
Optional increase memory - especially vGPU10 driver is relative heavy about RAM usage. Apply PATCHMEM by rloew, after it you can increase base RAM (768 MB or 1024 MB should be enough)
Insert SoftGPU iso (can be downloaded in Releases) and run softgpu.exe
VirtualBox 7.0.16 and higher: Uncheck DX flags option:
