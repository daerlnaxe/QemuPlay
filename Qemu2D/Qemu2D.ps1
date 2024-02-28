<#
    Auteur: Alexandre CODOUL aka Daerlnaxe
    Version: 0.1
    Date: 28/02/2024

    Permet de lancer QEMU avec les paramètres nécessaires, en attendant de faire un petit programme.
#>


# Récupération du chemin actuel
$folderPath=Split-Path $MyInvocation.MyCommand.Path -Parent
write-host "Programme lancé depuis '$folderPath'"

# 
$qemuComm="qemu-system-x86_64.exe"

# Chemin du fichier de configuration
$configFile= join-path $folderPath -childpath "Qemu2D.json"

# Initialisation de l'objet config
$config=$null

##
if  (-not $( Test-Path -Path $configFile))
{
    write-host "Création du fichier de configuration"
    
    # Chemin de Qemu
    while($true)
    {
        $qemuInstFolder=read-host -Prompt "Entrez le chemin d'installation de QEMU"

        if (Test-Path $(Join-Path $qemuInstFolder -childpath $qemuComm))
        {
            break
        }
        
        write-Host "Le chemin n'inclus pas le fichier qemu-system-x86_64.exe"        
        
    }

    while($true)
    {
        $cdromLetter=read-host -Prompt "Entrez une lettre pour le lecteur de CDRom (physique, ajoutez ':')"
        
        if (Test-Path $cdromLetter)
        {
            break
        }
        
        write-Host "Cette lettre de lecteur n'existe pas: '$cdromLetter'"        
        
    }

       
    # Création de l'objet config
    $config = New-Object -TypeName PSCustomObject
    $config | Add-Member -MemberType NoteProperty -Name "QemuPath" -Value "$qemuInstFolder"
    $config | Add-Member -MemberType NoteProperty -Name "CDRom" -Value "f:"

    #Conversion + écriture
    $config | ConvertTo-Json | Out-File $configFile


}

# Chargement de la configuration
$config=Get-Content -Raw -Path $configFile | ConvertFrom-Json 

## Vérifications
### Chemin de l'éxécutable
if (-Not (Test-Path $(Join-Path $config.QemuPath -childpath $qemuComm)))
{
    write-Host "Le chemin n'inclus pas le fichier qemu-system-x86_64.exe"
    exit
}

### CD-Rom
$tmp=$config.CDRom
if (-Not( Test-Path $tmp))
{
   write-Host "Cette lettre de lecteur n'existe pas: '$tmp'" 
   exit
}
      
       

# chemin de l'éxécutable qemu
$exePath=join-path $config.QemuPath -childpath $qemuComm



# Paramétrage
$args=$null
Write-Host "Choix de lancement:"
Write-Host "`t1) Sans réseau"
Write-Host "`t2) Réseau mode bridge"
While ($true)
{
    $val=Read-Host -Prompt "Entrez votre choix (x: sortie)"


   
    #write-host $hddPath
   


    if ($val -eq "x")
    {
        Write-Host "Sortie du script Qemu2D"
        exit
    }
    elseif ($val -eq "1" -or $val -eq "2")
    {
        $hddPath=join-path $folderPath -childpath "win98fr.raw"
        $cdromPath=$config.CDRom
    }

    if ($val -eq "1")
    {

        # Ne pas oublier le caractère d'échappement ` si utilisation de "
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -nic none -usb -machine acpi=off -k fr-fr -no-reboot -display sdl "
        break
    }
    elseif($val -eq "2")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -usb -no-acpi -k fr-fr -no-reboot -sdl"
        break
    }
}


# lancement
try
{

    


    Write-Host "Lancement de: '$exePath $args'"

    $process=Start-Process $exePath -ArgumentList $args
}
catch [System.Net.WebException],[System.IO.IOException] {
  Write-Host $_

}
Write-Host "Fin de script Qemu2D"

