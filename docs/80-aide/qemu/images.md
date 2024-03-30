## Pro/Cons
### Raw

- Avantages:  
     + Rapide
     + Solide
- Inconvenients:  
     - Snapshots impossibles  (a vérifier)
     - Consomme l'espace
    

<br>

### QCow2

- Avantages:  
     + Snapshots 
     + Ne consomme pas l'espace inutilisé
- Inconvenients:  
     - Fragile
     - Lent comparé à Raw


<br>
<br>


## Introduction
Pour les débutants, les commandes sont à taper via powershell, cmd, ou même cli Linux. Sous windows il faudra aller dans le dossier où se trouve les éxécutables (`cd <dossier>`)

## Création
### Images Raw

Créer une image (pour faire un disque dur, taille 10Giga ici):
```
qemu-img create -f raw <Nom> 10G
```

<br>
<br>

## Edition
### Image Raw

<br>
<br>


## Etendre une image
### Image Raw
```
qemu-img resize <lien vers l'image> +<taille désirée>
```

<br>

Exemple:
```
qemu-img resize "E:\VM\Qemu\Qemu_Perso\win98fr.raw" +7G
```