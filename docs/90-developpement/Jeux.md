# Panel de jeux
|Nom|CPU|Année|API|OS|
|-|-|-|-|-|
|[Battlezone](https://www.pcgamingwiki.com/wiki/Battlezone)|166mhz|1998|D3D|Windows|
|[Requiem](https://www.pcgamingwiki.com/wiki/Requiem:_Avenging_Angel)|200mhz|2000|D3D/Glide|Windows|
|[Deus Ex](https://www.pcgamingwiki.com/wiki/Requiem:_Avenging_Angel)|200mhz|2000|D3D/Glide|Windows|

<br><br>

# Jeux testés
## Jeux 2D
|Jeu|OS|API|DoxBox|QEMU*|VMWARE*|VirtualBox*|86Box|Wrappers|Notes|
|-|-|-|-|-|-|-|-|-|-|
| Command & Conquer|DOS|DDRaw | TB |Non|Non|Non|Non|Non||
| Command & Conquer GOLD|Win9x|??? |Non|Err|Err|EE|TB|Perte réseau| La version gold dézoome pour afficher en 640x480, pose problème avec les pilotes JHRobotics et divers hyperviseurs de niveau 2. |
|Starcraft|Win98|DDRAW/DirectX2|Non|TB|TB|TB|TB|???|Simple à tester|

<br>

## Jeux 3D
|Jeu|OS|API|DoxBox|QEMU3DFX|VMWARE*|VirtualBox*|86Box|Wrappers|Notes|
|-|-|-|-|-|-|-|-|-|-|
|Battlezone|Win98|DirectX5|-|-|TB|-|-|???||
|Half Life|Win98|DirectX?|-|-|TB|-|TB||
|Unreal|Win98|DirectX5|-|-|TB|-|TB||
|Messiah|Win98|Direct ??|Non|-|TB|Err|-||


*SoftGPU
*Qemu nécessite la compilation 3DFX pour accélérer la 3D.

<br><br>

# Tests
## Unreal

|Hyper/Emu|Host|Réglage|API|Résolution Max|Commentaire|
|-|-|-|-|-|-|
|VirtualBox|Windows 10|VMSVGA**|D3D|1920x1080 |Fluide|
|VirtualBox|ArchW98|VMSVGA**|D3D|1024x768|Fluide|
|86Box|Windows11|Voodoo2 x1|3DFX|800x600|Fluide|
|VirtualBox|ArchW98|VBOXVGA|D3D|800x600|Fluide|


<br>

## Half Life
|Hyper/Emu|Host|Réglage|API|Résolution Max|Commentaire|
|-|-|-|-|-|-|
|VirtualBox|Windows 11|VMSVGA|OpenGL|1600x1200|Fluide|
|VirtualBox|ArchW98|VMSVGA|OpenGL|1600x1200|Fluide|
|86Box|Windows11|Voodoo2 x1|3DFX|800x600|Fluide|
|86Box|Windows11|Voodoo2 x2|3DFX|1024x768|Fluide|

<br>

## Battlezone
|Hyper/Emu|Host|Réglage|API|Résolution Max|Commentaire|
|-|-|-|-|-|-|
|VirtualBox|ArchW98|VMSVGA**|????|1152x864|Fluide|



<br><br>


# Mise en place VirtualBox pour SoftGPU
Ces paramètres sont à mettre autant sur Linux que sur Windows sinon l'accélération 3D ne se fera pas en passtrough

- Configuration VirtualBox
  -  General:
    - Type: Linux
    - Version: Other Linux (32-bit)   
  - Display
    -  Controleur Graphic **VMSVGA**
    -  Mémoire: 128 Mo (Ne pas mettre moins, sinon L'accélération 3D peut se couper parfois). Plus peut amener d'autres [problèmes](https://github.com/JHRobotics/vmdisp9x/issues/2).
- Guest:
  - 32 Bits pour le support de l'accération 3D


<br>

Base memory: 512 MB (this is minimum (for vGPU10), but more 512 MB isn't recommended without additional patches!), CPU: 1
Disk size: recommended is at least 20 GB for 98/Me (you can select less, but HDD becomes full faster). Select 2 GB if you plan install Windows 95. Tip: If you storing virtual machine on classic HDD, check Pre-allocate Full Size, because it leads to lower disk image fragmentation.
Finish wizard
Open VM setting



Check enable 3D Acceleration
Optional adjustment
set USB controller to USB 1.1 (OHCI) for 98/Me, or turn USB off for 95
Audio controller set to SoundBlaster 16 for 95 and 98 or AC 97 for 98 and Me (working drivers for Windows 98 are below).
Install system - Windows 98 SE is highly recommended (for newer CPU, you need my patch: https://github.com/JHRobotics/patcher9x)
Optional increase memory - especially vGPU10 driver is relative heavy about RAM usage. Apply PATCHMEM by rloew, after it you can increase base RAM (768 MB or 1024 MB should be enough)
Insert SoftGPU iso (can be downloaded in Releases) and run softgpu.exe
VirtualBox 7.0.16 and higher: Uncheck DX flags option:

![image](https://github.com/daerlnaxe/QemuPlay/assets/18460858/601eb020-0c86-4d9a-a3ae-e20a549511e3)


# Wrappers
NGlide

## Severance 
Fonctionnel avec NGlide

