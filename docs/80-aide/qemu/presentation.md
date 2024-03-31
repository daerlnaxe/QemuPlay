
Pour vous reprérer dans l'aide de QEMU, quelques bases pour les débutants:  

- [Moniteur](./moniteur.md) : Il permet d'envoyer des commandes à la machine virtuelle, les premiers pas seront souvent pour changer des périphériques amovibles mais le moniteur a des commandes très puissantes.  
- [Paramètres](./parametres.md) : Les paramètres sont à entrer en lançant QEMU, qui est extrêmement customisable; un script powershell est mis à disposition pour simplifier la prise en main.
- Guest: Le terme guest désigne la machine virtuelle que l'on a créé.
- Host: Le terme host désigne l'hôte, votre pc par exemple, sur lequel on va lancer QEMU.
- Hyperviseur: ce sont des fonctions intégrées à un CPU physique qui permettent à la machine virtuelle (VM) de dialoguer avec le CPU de l'host (version simpliste).

<br>
<br>

## Prise en main de la machine virtuelle
Si QEMU héberge le guest, la visualisation de ce qu'il se passe sur le guest n'est pas obligatoirement à afficher sur l'host. Les résultats sont même très intéressants via le protocole SPICE.

Je vous encourage vivemment à vous tourner le plus tôt possible vers un fonctionnement de ce type, même pour faire tourner sur la même machine.

<br>
<br>

## Prise en main du moniteur
Le moniteur est accessible de plusieurs manières dont à distance lui aussi, via telnet.

!!! DANGER "Telnet est un protocole peu sécurisé, pensez à utiliser un firewall efficace !"


