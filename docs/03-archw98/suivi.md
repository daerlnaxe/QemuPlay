## Drivers JHRobotics
Les tests sans KVM ne sont pas positifs.

Les tests ont d'abord été réalisés sur la version 0.4 puis sur la version 0.5.

Protocole
- Test cinématique
- Test Jeu
- Test son

Mode DirectX7 => 2D:
- KVM :
  - Starcraft : parfait en HAL, 
  - Fallout : parfait
  - C&C 95 : parfait
- No KVM : 
  - Starcraft : Erreur VMHAL9x.dll, mettre system dans la base de registre.
  - Fallout : Lenteur extrême

Mode 3D:
- KVM
  - Starcraft : Echec
  - Fallout : Echec
- No KVM
  - Starcraft : Echec
  - Fallout : Echec
