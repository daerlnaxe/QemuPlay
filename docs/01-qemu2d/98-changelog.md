
# Changelog
## PowerShell script
- v0.3
  - Video card choice added in configuration
  - Code splitted in functions and modifications about the configuration checks

<br>

## HDD Image
- v0.31
  - System stabilization: a lot of bugs about drivers, seems ok with cirrus 5446 + e1000 or std with jh robotics 2d drivers
  - FTP serveur modified for a free version: typsoft ftp server ()
 
<br>
<br>

## Old_Changements
- v0.3.0: 
    - Dissociation paquet/image
    - Paquet d'installation
      - Refonte du tutoriel pour être plus accessible + ajout au package.
      - Tests avec la version compilée QEMU du 24/12/2023
      - `-sdl` devient `-display sdl`
      - ShaderGlass v0.9
      - Script powershell pour lancement facilité.
    - Image HDD win98fr
      - Modification du drivers pour la carte graphique cirrus
      - Retour vers les drivers 1.12|1.31
      - Le panneau pour régler l'affichage est de nouveau disponible.
      - Erreur sur l'explorer n'arrive plus
      - Bug connu, les symboles réduire, agrandir, fermer, question, sont indisponibles
        - Clic droit sur le bureau &rarr; Propriétés
        - Onglet apparence
        - Choisir une apparence, ou une police.
- v0.2.0: Version fr, lanceur i386
- v0.1.0: Version us, lanceur x86_64
