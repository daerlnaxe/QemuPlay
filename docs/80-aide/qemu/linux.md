Monter une image 
```bash
mount -o loop,offset=32256 /path/to/image.img /mnt/mountpoint
```

Pour ajouter la possibilité d'écrire
```bash
mount -o rw,loop,offset=32256 /path/to/image.img /mnt/mountpoint
```
