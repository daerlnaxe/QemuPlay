# Paramètres
## Ordre de boot
Activer le `menu boot`
```bash
-boot menu=on
```

<br>
<hr>

## Affichage déporté
### VNC

> [!WARNING]
> Pour le moment je n'ai pas réussi sous windows host à faire transiter le son entre deux PC. Sous linux il est probable qu'il faille utiliser pulseaudio.

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


<br>

### Spice

> [!NOTE]
>Le son transite parfaitement entre deux machines distantes

<br>

Syntaxe:
```
-spice port=<port>[,options]
```

<br>

Options:
- Pas de password: disable-ticketing=on

<br>

Clients : 
- Virt-Viewer (Lancer sous Windows comme Remote Viewer)
