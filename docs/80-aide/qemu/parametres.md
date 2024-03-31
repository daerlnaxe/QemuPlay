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

## Carte réseau
name: permet de définir un nom qui pourra être utilisée avec le moniteur (entre autres)

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
- Port: `port=<port>`
- IP d'écoute : `addr=<addr>`
- Forcer une version spécifique d'IP:
    - `ipv4=on|off`
    - `ipv6=on|off`
    - `unix=on|off`
- Secret: password-secret=<secret-id>
- sasl=on|off



* : définit l'ID d'un objet "secret" contenant le password à utiliser.

----
Secondaire:
disable-copy-paste=on|off Disable copy paste between the client and the guest.


disable-agent-file-xfer=on|off
Disable spice-vdagent based file-xfer between the client and the guest.


tls-port=<nr>
Set the TCP port spice is listening on for encrypted channels.



x509-dir=<dir>
Set the x509 file directory. Expects same filenames as -vnc $display,x509=$dir

x509-key-file=<file>; x509-key-password=<file>; x509-cert-file=<file>; x509-cacert-file=<file>; x509-dh-key-file=<file>
The x509 file names can also be configured individually.

tls-ciphers=<list>
Specify which ciphers to use.

tls-channel=[main|display|cursor|inputs|record|playback]; plaintext-channel=[main|display|cursor|inputs|record|playback]
Force specific channel to be used with or without TLS encryption. The options can be specified multiple times to configure multiple channels. The special name “default” can be used to set the default mode. For channels which are not explicitly forced into one mode the spice client is allowed to pick tls/plaintext as he pleases.

#### Compression
image-compression=[auto_glz|auto_lz|quic|glz|lz|off]
Configure image compression (lossless). Default is auto_glz.

jpeg-wan-compression=[auto|never|always]; zlib-glz-wan-compression=[auto|never|always]
Configure wan image compression (lossy for slow links). Default is auto.

streaming-video=[off|all|filter]
Configure video stream detection. Default is off.


#### SASL
Require that the client use SASL to authenticate with the spice. The exact choice of authentication method used is controlled from the system / user’s SASL configuration file for the ‘qemu’ service. This is typically found in /etc/sasl2/qemu.conf. If running QEMU as an unprivileged user, an environment variable SASL_CONF_PATH can be used to make it search alternate locations for the service config. While some SASL auth methods can also provide data encryption (eg GSSAPI), it is recommended that SASL always be combined with the ‘tls’ and ‘x509’ settings to enable use of SSL and server certificates. This ensures a data encryption preventing compromise of authentication credentials.



agent-mouse=[on|off]
Enable/disable passing mouse events via vdagent. Default is on.

playback-compression=[on|off]
Enable/disable audio stream compression (using celt 0.5.1). Default is on.

seamless-migration=[on|off]
Enable/disable spice seamless migration. Default is off.

gl=[on|off]
Enable/disable OpenGL context. Default is off.

rendernode=<file>
DRM render node for OpenGL rendering. If not specified, it will pick the first available. (Since 2.9)

<br>

Clients :  
- Virt-Viewer (Lancer sous Windows comme Remote Viewer)


<br>
<br>
<hr>

## Moniteur
### Controle à distance avec Telnet
Permet d'utiliser la console pour piloter Qemu à distance.

```
```

<br>

Clients:
- Putty


