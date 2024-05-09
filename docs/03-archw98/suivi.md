## Drivers JHRobotics
Les tests sans KVM ne sont pas positifs.

Les tests ont d'abord été réalisés sur la version 0.4 puis sur la version 0.5.

Protocole
- Test cinématique
- Test Jeu
- Test son

Mode DirectX7 => 2D:
- KVM :
  - Starcraft : parfait en HAL
  - Fallout : parfait
  - C&C 95 : !!! PROBLEME !!!
  - Commandos : parfait
- No KVM : 
  - Starcraft : echec
  - Fallout : Lenteur extrême

Mode 3D:
- KVM
  - Starcraft : Erreur VMHAL9x.dll, mettre system dans la base de registre.
  - Fallout : Echec
- No KVM
  - Starcraft : Echec
  - Fallout : Echec
 

Pour faire plus générique:
- Starcraft: Hal : Parfait
- Diablo : Hal : Parfait
- Commandos : Wine: Parfait
- Fallout : Hal : Parfait
- **C&C95** : HAL : Probleme unrecognised direct draw result code, wine autre bug
- Starcraft : HAL : Parfait
- Dungeon Keeper : HAL : Parfait
- Total Annihilation : HAL : Parfait
- Myst : HAL : parfait
- **Half-Life** : HAL ok, Direct3d => stries blanches

