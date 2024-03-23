---
@mixin admon-color($color) {
  color: darken($color, 15%);
  background-color: lighten($color, 25%);
  border-color: $color;
}

.admonition {
  padding: 0 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
  text-align: left;
  &-title {
    font-weight: bold;
    text-align: left;
  }
  &.note,
  &.info,
  &.tips {
    $base-blue: #3498db;
    @include admon-color($base-blue);
  }
  &.warning,
  &.warn,
  &.important {
    $base-carrot: #e67e22;
    @include admon-color($base-carrot);
  }
  &.danger,
  &.critical {
    $base-alizarin: #e74c3c;
    @include admon-color($base-alizarin);
  }
}
---

<div class="admonition note">
  <p class="admonition-title">Note</p>
  <p>Hello this is just a test.</p>
  <p>This is an another line.</p>
</div>


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


> [!NOTE]
> Information the user should notice even if skimming.

! This is an info message.


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
