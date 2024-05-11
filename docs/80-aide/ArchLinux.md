ArchLinux sert de base à ArchW98

## Debug
### Firmware uniquement au chargement de Grub:
Vérifier si les entrées ont été configurées correctement au démarrage de Grub:
```
cat /boot/grub/grub.cfg | grep menuentry
```

<br>

S'il n'y a que le firmware il faudra rajouter le noyau compressé linux et reconfiguré Grub:

<br>

Pour rajouter le noyau compressé si totalement absent du support:
```
pacman -s mkinitcpio 
```
