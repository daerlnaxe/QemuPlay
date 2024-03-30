<#
    Auteur: Alexandre CODOUL aka Daerlnaxe
    Version: 0.4
    Date: 16/03/2024

    Permet de lancer QEMU avec les paramètres nécessaires, en attendant de faire un petit programme.
#>


# Config File
## Creation
function ConfigFileCreation
{
    write-host "Création du fichier de configuration"
    # Création de l'objet config
    $config = New-Object -TypeName PSCustomObject
    $config | Add-Member -MemberType NoteProperty -Name "QemuPath"
    $config | Add-Member -MemberType NoteProperty -Name "VideoCard"
    $config | Add-Member -MemberType NoteProperty -Name "CDRom"
    
    ConfigFileWriting($config)
    
}

## Config File Writing
function ConfigFileWriting($config)
{
#Conversion + écriture
    $config | ConvertTo-Json | Out-File $configFile
}



# Asks
## Ask for the install path
function AskInstpath{
  # Chemin de Qemu
    while($true)
    {
        $qemuInstFolder=read-host -Prompt "Entrez le chemin d'installation de QEMU"

        if (Test-Path $(Join-Path $qemuInstFolder -childpath $qemuComm))
        {
            return $qemuInstFolder
        }
        
        write-Host "Le chemin n'inclus pas le fichier qemu-system-x86_64.exe"        
        
    }
    
}

## Ask for VideoCard
function AskVideoCard()
{
 # Video Card
    while($true)
    {
        Write-Host "Select a Video Card:"
        Write-Host "`t1) none   : no graphic card"
        Write-Host "`t2) std    : standard VGA (default) - can work with JHL project"
        Write-Host "`t3) cirrus : Cirrus VGA (5446, a classic) - problems ?"
        Write-Host "`t4) vmware : VMWare SVGA"
        Write-Host "`t5) qxl    : QXL VGA"
        Write-Host "`t6) virtio : Virtio VGA"

        $videoC=read-host -Prompt "Enter your choice"

        switch($videoC)
        {
            "1"{return "none"}
            "2"{return "std"}
            "3"{return "cirrus"}
            "4"{return "vmware"}
            "5"{return "qxl"}
            "6"{return "virtio"}
        
        }
        
        write-Host "This video card doesn't exist"        
        
    }
}


## Ask for CDROM
function AskCDrom{

    # CD Rom Path
    while($true)
    {
        $cdromLetter=read-host -Prompt "Entrez une lettre pour le lecteur de CDRom (physique, ajoutez ':')"
        
        if (Test-Path $cdromLetter)
        { 
            return $cdromLetter
        }
        
        write-Host "Cette lettre de lecteur n'existe pas: '$cdromLetter'"        
        
    }
}


# Verifications
## VideoCard
function VideoCardVerification($videocard)
{
    switch($videocard)
    {
        "none"   {return $true}
        "std"    {return $true}  
        "cirrus" {return $true}
        "vmware" {return $true}
        "qxl"    {return $true}
        "virtio" {return $true}
    }

    return $false
}


# Main
## Paramétrage
$qemuComm="qemu-system-x86_64.exe"
#$qemuComm="qemu-system-i386.exe"



# Récupération du chemin actuel
$folderPath=Split-Path $MyInvocation.MyCommand.Path -Parent
write-host "Programme lancé depuis '$folderPath'"

# Chemin du fichier de configuration
$configFile= join-path $folderPath -childpath "Qemu2D.json"

# Initialisation de l'objet config
$config=$null


# Create config file if necessary
if  (-not $( Test-Path -Path $configFile))
{
    ConfigFileCreation
}




# Chargement de la configuration
$config=Get-Content -Raw -Path $configFile | ConvertFrom-Json 

# Config Verifications

### Chemin de l'éxécutable
Write-Host $config.QemuPath
if (-Not (Test-Path $(Join-Path $config.QemuPath -childpath $qemuComm)))
{
    write-Host "Le chemin '$($config.QemuPath)' n'inclus pas le fichier qemu-system-x86_64.exe"        
    $config.QemuPath=AskInstpath
    ConfigFileWriting($config)
}



### VideoCard
if (-Not(VideoCardVerification $config.VideoCard))
{
   write-Host "This Video Cards doesn't exist: '$($config.VideoCard)'"
   $config.VideoCard=AskVideoCard
    ConfigFileWriting($config)
}

### CD-Rom
if (-Not( Test-Path $config.CDRom))
{
   write-Host "Cette lettre de lecteur n'existe pas: '$($config.CDRom)'" 
   $config.CDRom=AskVideoCard
   ConfigFileWriting($config)
}
      
       

<#
  
     -Value "$qemuInstFolder"

}
#>



## Vérifications

$config.QemuPath="D:\Programmes\x64\Programmation\MSYS2\ucrt64\bin"
# chemin de l'éxécutable qemu
$exePath=join-path $config.QemuPath -childpath $qemuComm


# Paramétrage
$args=$null
Write-Host "Choix de lancement:"
Write-Host "`t1) Sans réseau"
Write-Host "`t2) Réseau mode bridge"
<#Write-Host "`t3) Bridge NoSDL"#>
Write-Host "`t4) Bridge VNC"
Write-Host "`t5) Bridge Spice"
While ($true)
{
    $val=Read-Host -Prompt "Entrez votre choix (x: sortie)"


   
    #write-host $hddPath
   


    if ($val -eq "x")
    {
        Write-Host "Sortie du script Qemu2D"
        exit
    }
    elseif ($val -eq "1" -or $val -eq "2" -or $val -eq "3" -or $val -eq "4" -or $val -eq "5")
    {
        $hddPath=join-path $folderPath -childpath "win98fr.raw"
        $cdromPath=$config.CDRom
    }


    if ($val -eq "1")
    {

        # Ne pas oublier le caractère d'échappement ` si utilisation de "-device sb16 -vga $($config.VideoCard) | usb enlevé
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -nic none -machine acpi=off -k fr-fr -no-reboot -display sdl -boot menu=on"
        break
    }
    elseif($val -eq "2")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -k fr-fr -no-reboot -display sdl -boot menu=on"
        break
    }
    <#elseif($val -eq "3")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -k fr-fr -no-reboot -boot menu=on"
        break
    }#>
        elseif($val -eq "4")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -audio pa,model=sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -no-reboot -boot menu=on -display none -vnc :0 -usbdevice tablet -monitor telnet:127.0.0.1:7777,server,nowait"
        break
    }
    elseif($val -eq "5")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -boot menu=on -display none -spice port=5930,disable-ticketing=on -monitor telnet:127.0.0.1:7777,server,nowait"
        break
    }
}


# lancement
try
{
    # Lancement de QEMU    
    $process=Start-Process $exePath -ArgumentList $args -PassThru 
    # Changement de priorité (256:real time,)
    $process.PriorityClass=128
    Write-Host "Lancement de: '$exePath $args' avec la priorité $($process.PriorityClass)"
    $Process.Id
    


    # Lancement de ShaderGlass
    if(Test-Path .\ShaderGlass.exe)
    {
        Start-Sleep -Seconds 10
        Write-Host "Lancement de ShaderGlass"
        Start-Process .\ShaderGlass.exe .\Qemu2D_Default.sgp
    }
}
catch [System.Net.WebException],[System.IO.IOException] {
  Write-Host $_

}
Write-Host "Fin de script Qemu2D"

