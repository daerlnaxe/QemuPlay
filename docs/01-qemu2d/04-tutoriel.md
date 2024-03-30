Sommaire:
- [Introduction](#Introduction)
  - [Présentation](#Présentation)
  - [Liens](#Liens)
  - [Lexique](#Lexique)
- [Installation](#Installation)
  - [Base](#base)
  - [Réseau (Optionnel)](#réseau-optionnel)
- [Lancement](#Lancement)
  - [Lancement Automatisé](#lancement-automatisé-de-qemu)
  - [Lancement Manuel](#lancement-manuel-de-qemu)
  - [Optimisation du rendu Graphique](#optimisation-du-rendu)
- [A Faire](#A-Faire)
- [Aide](#Aide)

<br>

----
## Introduction
### Présentation
Ce tutoriel a pour but de permettre une mise en place rapide.

Pour avoir des explications plus poussées voir le fichier `Win98 On Qemu.pdf` disponibles dans les liens.

!!! info 
    Bien que ce tutoriel puisse vous paraître long, c'est en réalité très rapide et simple à mettre en œuvre, c'est très détaillé pour aider les débutants.

<br>
<br>

### Liens
- [Téléchargement pour installation ](https://app.mediafire.com/0h1koc37bbeo5)
    - Image HDD:
        - FR : win98se-fr-v0.3
    - Qemu_Package-v0.3
- [ShaderGlass Releases](https://github.com/mausimus/ShaderGlass/releases) : Optionnel, pour améliorer le rendu via des shaders.
- [Win98 On Qemu.pdf](https://github.com/daerlnaxe/QemuPlay/blob/main/Qemu2D/Win9x%20On%20QEMU%20v0.2.0.pdf) : Explications plus poussées mais également un mémo DOS pour les partitions.

<br>

### Lexique
- Host: Votre machine phyisque
- Guest: La machine virtuelle


<br>
<hr>

## Installation
### Base
- Décompressez le package
- Installez QEMU
- Placer l'image disque système win98fr.raw dans le dossier qui vous arrange. 


<br>
<br>

### Réseau (optionnel)

!!! note 
    Je vous propose une connexion en mode bridge, vous pouvez accéder au net comme à toutes les machines du réseau

<br>

Procédure:

- Suivre le tutoriel de cette[page](https://github.com/daerlnaxe/QemuPlay/wiki/AideR%C3%A9seauQemu#Mode-Bridge) indiquant la mise en place.
- Au niveau du guest, éventuellement paramétrer la Passerelle, mais vous pouvez laisser la configuration en automatique.

<br>
<hr>


## Lancement
Vous pouvez lancer en ligne de commande ou utiliser le nouveau script powershell

<br>

### Lancement automatisé de QEMU
C'est un début de script **PowerShell**, si le fichier de configuration json n'existe pas il sera créé.

Fonctionnement:

- Choix:
    - Lancement sans réseau
    - Lancement avec réseau
- Vous êtes guidé dans les étapes.
- Lance Automatiquement ShaderGlass (si l'exe est dans le même dossier)

<br>

!!! Note "Des évolutions apparaitront afin de permettre plus de choix."

<br>

Exemple de résultat avec le script:
```PowerShell
PS E:\Temp\Qemu_Perso> .\Qemu2D.ps1
Programme lancé depuis 'E:\Temp\Qemu_Perso'
Choix de lancement:
        1) Sans réseau
        2) Réseau mode bridge
Entrez votre choix (x: sortie): 2
Lancement de: 'C:\Program Files\qemu\qemu-system-x86_64.exe -cpu pentium2 -m 256 -vga cirrus -drive format=raw,file="E:\Temp\Qemu_Perso\win98fr.raw" -cdrom f: -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -usb -machine acpi=off -k fr-fr -no-reboot -display sdl'
Lancement de ShaderGlass
Fin de script Qemu2D
```
<br>

!!! WARNING 
    Si un des chemins utilisé n'existe pas, vous aurez une sortie sèche sans avertissement

<br>
<br>

### Lancement Manuel de QEMU
Procédure:

- Ouvrez une invite de commande ou powershell.
    - Déplacez vous dans le répertoire d'installation de QEMU
    - Lancez la commande (voir aide):
        - **Avec** prise en charge réseau mode bridge
        ```Powershell
        .\qemu-system-i386.exe -cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=<Image Disque Systeme> -cdrom <Lettre> -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -usb -no-acpi -k fr-fr -no-reboot -sdl    
        ```
        - **Sans** prise en charge réseau
        ```Powershell
        .\qemu-system-i386.exe -cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=<Image Disque Systeme> -cdrom <Lettre> -device sb16 -nic none -usb -no-acpi -k fr-fr -no-reboot -sdl    
        ```
- QEMU démarre

<br>
<br> 

### Optimisation du rendu
Si vous désirez améliorer le rendu, vous pouvez utiliser ShaderGlass.


<br>

!!! WARNING
    A chaque changement de résolution, si vous êtes en mode Input:window il faudra refaire la manipulation.

<br>

!!! NOTE 
    Une version est mise à disposition dans le package au cas où, avec un fichier de configuration `Qemu2D_Default.sgp` 

<br>

Manipulation

- Décompressez ShaderGlass où vous voulez par contre pensez à faire un lien dans le menu et éventuellement dans la barre des tâches
- Maximisez la fenêtre de QEMU
- Optimisation du rendu (optionnel)
    - Lancez à présent le logiciel [ShaderGlass](#contenu-du-package)
    -  dans "File" -> "Load Profile" chargez ce fichier
    - Normalement via le fichier vous avez capturé votre sortie d'affichage
    - Mettez ShaderGlass en plein écran avec CTRL+Shift+G

<br>
<hr>

## A Faire
Dès la connexion:

- Changez votre mot de passe réseau
- Changez le mot de passe de typsoft ftp server