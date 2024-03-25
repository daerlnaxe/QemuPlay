# Lancement Basique
!!! TIP "Un script PowerShell est fourni pour faciliter l'utilisation"

<br>

## Paramètres de la commande QEMU
- `<Image Disque Systeme>`: Chemin vers `win98fr.raw`
- `<Lettre>` : Lettre du lecteur cd-rom (avec les deux points). Vous pouvez utiilser un lecteur virtuel comme Daemon Tools si vous le désirez.

<br>

Exemples de lancement
- Network désactivé

```PowerShell
.\qemu-system-i386.exe -cpu pentium2 -m 256 -vga cirrus -drive format=raw,file="D:\Temp\Qemu-Package v0.2.0\win98fr.raw" -cdrom h: -device sb16 -nic none -usb -machine acpi=off -k fr-fr -no-reboot -display sdl 
```

<br>





 

