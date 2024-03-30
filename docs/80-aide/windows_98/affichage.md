## Debug
apparemment en utilisant la commande suivante on peut contourner  l'erreur dll du `display settings`:
```
RUNDLL DESKCP16.DLL,QUICKRES_RUNDLLENTRY <hres>x<vres>x<bpp>
```

<br>

Explications:

- bpp : in byte, ~~4,~~8,16,24,32  ~

Tried:

- 640x480
- 800x600
- 1024x768
- 1280x960


!!! Success Testé avec succès avec le driver 2d de JH Robotics.

<br>

On peut réafficher l'icone dans le systray, à partir de là en cliquant sur l'icone on contourne l'erreur, on peut relancer le panneau sans problème.


!!! note "Rappel"
    J'avais fait avant un msconfig en rédiusant le vga a 640x480 sans succès. J'ai également enlevé tout le matos en double via le mode sans échec.