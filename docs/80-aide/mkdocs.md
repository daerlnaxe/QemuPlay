# MKdocs
## Installation
### Github
Une fois déployé il faut penser à:
- Aller dans settings
- Aller sur pages
- Choisir le fork utilisé pour pusher les fichiers

<br>

## Configuration
### Navigation
!!! warning "Les rubriques sont entre simple quote et les liens relatifs"

```yaml
nav:
  - Home: index.md
  - Aide :
      - 'MkDocs' : aide/mkdocs.md
      - 'Qemu' :
        - 'Paramètres': ./aide/parametres.md
```


<br>
<hr>

## Bases
### Listes

Pour créer une liste, il faut séparer le contenu de la liste du titre qui l'annonce.

!!! warning "Pour le moment je n'ai pas réussi à intégrer dans une balise details."

<details >
<summary>Exemple:</summary>

Exemple de code:  
```
Ma liste:  
- element 1  
- element 2
```

<br>

Rendu:  

Ma liste:  
<ul>
<li>element 1</li>
<li>element 2</li>
</ul>
</details>

<br>
<br>

## Avancé
### Alerter (admonition)

Types:  

- note  
- abstract
- info  
- tip  
- success  
- question  
- warning  
- failure  
- danger  
- bug  
- example  
- quote  

<br>

#### Une ligne
!!! warning "Le contenu est obligatoirement entre `""`"

   
```
!!! note "une note"
```
!!! note "une note"


<br>

#### Blocks
```
!!! note

    Le texte de ma note sur plusieurs lignes
```

!!! note "avec un titre"

    Le texte de ma note sur plusieurs lignes

```
!!! note "avec un titre"

    Le texte de ma note sur plusieurs lignes
```

!!! note

    Le texte de ma note sur plusieurs lignes



Version expandable (avec le + ouvert par défaut)
```
???+ note

    

```

???+ note

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

<br>
<br>
  
#### Exemples
!!! example
!!! note
!!! abstract
!!! info
!!! tip
!!! success
!!! question
!!! warning
!!! failure
!!! danger
!!! bug

<br>
  
!!! quote
