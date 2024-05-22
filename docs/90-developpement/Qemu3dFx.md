## Préparation
!!! Réalisé sur ArchLinuxx

- Installation de Git, wget, rsync, patch
```
sudo pacman -S git wget rsync patch
```

<br>

## Compilation
- Création d'un dossier pour cloner le dépôt
```
mkdir qemu3dfx_compil && cd qemu3dfx_compil
```
- Clone du dépôt
```
git clone https://github.com/kjliew/qemu-3dfx.git
```
- On entre dans le dépôt
```
cd qemu-3dfx
```
- Téléchargement des sources de qemu 8.2.1
```
wget https://download.qemu.org/qemu-8.2.1.tar.xz
```
- Extraction des sources
```
tar xf qemu-8.2.1.tar.xz
```
- Synchronisation de ../qemu-0/hw/3dfx & ../qemu-1/hw/mesa vers ./hw/
```
cd qemu-8.2.1
rsync -r ../qemu-0/hw/3dfx ../qemu-1/hw/mesa ./hw/
```

