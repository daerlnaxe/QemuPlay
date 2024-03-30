# Présentation
La console permet d'envoyer des commandes à QEMU, que cela soit pour:

- Changer de disque
- Collecter des informations
- Mettre en pause le guest.
- ...

<br>


## Lancement de la console
### Lancement de la console en mode SDL

**Windows**

La console peut être lancée en pressant les touches [Ctrl]+[Alt]+[2]
![sdl_console](../../assets/images/sdl_console.png)


<br>

## Aide
Dans la console taper `help`

Pour obtenir de l'aide sur une commande précise taper `help <commande>`

<br>

## Liste des commandes
Non exhaustif

- change: permet de modifier un média amovible (à tester: changer les options d'affichage d'un VNC, et changer le mot de passe utilisé sur un VNC)


<br>
<hr>

# Medias amovibles
## Changement du CD-Rom

Procédure:

- Identification des médias disponibles, taper `info block` 
![info_block.png](../../assets/images/info_block.png)
- Pour changer le CD-Rom désigné par `ide1-cd0`, taper `change ide1-cd0 <lien vers l'image|lecteur>`

<br>

Exemple de résultat avec la commande:

- Partie console  
![change_cdrom](../../assets/images/change_cdrom.png)
- Changement automatique dans Windows 98  
![change_cdrom_2](../../assets/images/change_cdrom_2.png)

<br>

Comme déjà indiqué, QEMU fonctionne avec un lecteur physique, un lecteur virtuel ou directement avec certaines images. Dans mon cas je n'ai plus de lecteur physique comme beaucoup d'entre nous sur cette machine.

