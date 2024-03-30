[Toc]

# TODO
- [ ] Include parameter for ShaderGlass in JSon  
- [x] Functions  
- [x] Adding VGA Card choice 
- [x] deported display

<br>

# Etude
## Get install path of Qemu on Windows

```Powershell
Get-ChildItem -Path $env:ProgramFiles -Recurse -Filter '*.exe' -ErrorAction SilentlyContinue | Where-Object {$_.FullName -like '*qemu*'} | Select-Object FullName
```

<br>

!!! warning
    Too much time