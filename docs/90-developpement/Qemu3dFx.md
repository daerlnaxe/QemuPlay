## Préparation
!!! Réalisé sur ArchLinuxx

- Installation de Git, wget, rsync, patch
```
sudo pacman -S git wget rsync patch
```

- Installation du builder Ninja
```
sudo pacman -S ninja
```

!!! souci à la compilation

- ~~Installation du générateur de documentation Sphinx~~

```
sudo pacman -S python-sphinx python-sphinx_rtd_theme
```

!!! souci à la compilation


- Installation d'un compilateur C
```
sudo pacman -S gcc
```
- Installation (sur et vital) pkg-config
```
sudo pacman -S pkgconf
```
- Installation (probable) bisons, flex, meson,
```
sudo pacman -S flex bison meson
```

<br>


!!! A voir : sndio(midi), iasl(décompileur?), cgcc, appleframeworks, rutabaga_gfx_ffi, blkio, rados, librbd.h,lzfse.h,rdma_cma.h, ibverbs, xencontrol, xenstore, xenctrl, xendevicemodel, xenforeigmemeory...., u2f-emu, canokey-qemu, libpmem, libselinux, valgrind.h, sys/disk.h, sys/ioccom.h, sys/kcov.h, _aligned_malloc, sched_getcpu, pthread_fchdir_np, optreset, sigev_notify_thread_id, 

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
- Synchronisation de `../qemu-0/hw/3dfx` & `../qemu-1/hw/mesa` vers `./hw/` (Attention de ne pas laisser un `/` à la fin des sources)
```
cd qemu-8.2.1
rsync -r ../qemu-0/hw/3dfx ../qemu-1/hw/mesa ./hw/
```
-
```
patch -p0 -i ../00-qemu82x-mesa-glide.patch
```
-
```
$ bash ../scripts/sign_commit
```
- Compilation
```
mkdir ../build && cd ../build
../qemu-8.2.1/configure && make
```


## Debug
`ERROR: Unrecognized host OS (uname -s reports 'Linux')` : Absence de compilateur C


