
# Changelog
## PowerShell script

- v0.4 Work In Progress  
    - [x] Spice mode  
    - [x] Generating secret for Spice
    - [x] Collection of Virtual Machines
    - [x] Telnet intégration & port  
        - Local  
        - Lan  
    - [ ] Spice intégration + port + ip
        - Local
        - Lan
        - Secret
        - Port
    - [ ] Function to Verify VM
    - [ ] Deport verification system for the selected vm
    - [ ] Modify VM
    - [ ] Remote control mode for Spice mode.  
    - [ ] Seeing SSH mode  
    - [ ] Putty Path
    - [ ] Remote Viewer Path
    - [ ] Function for path
    - [ ] Sound parameter
    - [ ] Launching putty if telnet mode  
    - [ ] Launching remote viewer if spice mode
    - [ ] Function to rewrite call before to launch qemu
- v0.3  
    - Video card choice added in configuration  
    - Code splitted in functions and modifications about the   configuration checks  

<br>

## HDD Image

- v0.35  
    - System stabilization: improved stabilization, works fine with cirrus vga card, rtl8039, sb16 with SDL mode.  
    - Some free programs added   
    - Registry Backup
    - HardDrive extended to 10G with a second partition.
- v0.31  
    - System stabilization: a lot of bugs about drivers, seems ok with cirrus 5446 + e1000 or std with jh robotics 2d drivers
    - FTP serveur modified for a free version: typsoft ftp server ()
 
<br>
<br>

## Old_Changements
- v0.3.0: 
    - Clean OS install
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
