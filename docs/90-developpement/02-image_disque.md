
# TODO
- [ ] Vérifier dans le temps pour la taille du disque  
- [ ] Refaire Benchmark qcow2 VS raw (snapshots intéressants)  

<br>

# Etude
## Contrôles d'intégrité de l'image HDD
- [x] Stop : ok  
- [x] Reboot : ok  
- [x] Arrêt brutal  
- [x] Désinstallation d'application  
- [x] Lancement après copie de l'image >> Erreur  
- [x] Lancement durant la copie de l'image, puis lancement après >> Erreur, impossible de relancer l'image.  

{nbsp}

## Compression
Le gain de compression est ~80Mo soit dans les 10% entre le plus rapide et le plus performant, que ça soit entre winrar4 et winzip.


!!! note "La compression permet de lever tout l'espace vide; c'est suffisant."

!!! Warning "Ne pas utiliser `stockage`, prend l'espace réel."