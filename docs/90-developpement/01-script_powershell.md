# TODO
- [ ] Include parameter for ShaderGlass in JSon  
- [x] Functions  
- [x] Adding VGA Card choice  

<br>

# Etude
Récupérer le chemin d'installation de qemu
```Powershell
Get-ChildItem -Path $env:ProgramFiles -Recurse -Filter '*.exe' -ErrorAction SilentlyContinue | Where-Object {$_.FullName -like '*qemu*'} | Select-Object FullName
```

<br>

!!! warning
    Prends trop de temps sur la réponse