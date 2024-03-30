---
title: Parametres
category: qemu2d
order: 2
---


# Paramètres
## Note sur la syntaxe

- `<lien>` : Les chevrons ne sont pas à mettre, ils indiquent que vous devez compléter en adaptant à votre situaiton.

<br>

exemple:
- Utiliser une iso pour votre cdrom
```
-cdrom "<lien>"
```
- Vous compléterez par votre chemin, ici pour moi:
```
-cdrom "e:\isos\windows 98.iso"`
```


<br>
<br>

## Supports
Quelques exemples pour correctement entrer les liens vers les supports.

Exemples:  

- Windows: `-cdrom r:`
- Windows: `-cdrom "e:\isos\windows 98.iso"`
- Ubuntu: `-cdrom /dev/sr0`

<br>
<hr>

## CD-Rom
Utiliser `-cdrom "<lien>"`

!!! note Ils peuvent être un lecteur physique ou virtuel, une iso...

<br>

## Disquette
utiliser `-fda <lien>`

<br>

## Ordre de boot
Activer le `menu boot`
```bash
-boot menu=on
```

<br>
<hr>

## Affichage déporté
### VNC

!!! WARNING 
    Pour le moment je n'ai pas réussi sous windows host à faire transiter le son entre deux PC. Sous linux il 
    est probable qu'il faille utiliser pulseaudio.

<br>

Syntaxe:
```
-vnc :<port>
```

<br>

#### Problème de décalage pointeur host/guest
Utiliser l'option ci-dessous qui est totalement compatible windows98
```
-usbdevice tablet 
```

<br>

Clients:  
- Real VNC Viewer
- ...


<br>

### Spice

!!! success "Le son transite parfaitement entre deux machines distantes"

<br>

Syntaxe:
```
-spice port=<port>[,options]
```

<br>

Options:  
- Pas de password: `disable-ticketing=on`

<br>

Clients :  
- Virt-Viewer (Lancer sous Windows comme Remote Viewer)


<br>
<br>

### Telnet
Permet d'utiliser la console pour piloter Qemu à distance.

<br>

Clients:
- Putty