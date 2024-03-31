<#
    Auteur: Alexandre CODOUL aka Daerlnaxe
    Version: 0.4
    Date: 16/03/2024

    Permet de lancer QEMU avec les paramètres nécessaires, en attendant de faire un petit programme.
#>
using namespace System.Collections.Generic #pour utiliser List

class VirtualMachine
{
  [string] $Name
  [string] $Description
  [string] $ImgHDD
  [string] $VideoCard
  [string] $CDRom
  [string] $Monitor
  [int]    $MonitorPort

      VirtualMachine($nametmp) {
        
        $this.Name=$nametmp
    }
}




# Config File
## Config object
<#function VirtualMachine($nom)
{
    $vm = New-Object -TypeName PSCustomObject
    $vm | Add-Member -MemberType NoteProperty -Name "Name" -Value $nom
    $vm | Add-Member -MemberType NoteProperty -Name "Description" -Value ""
    $vm | Add-Member -MemberType NoteProperty -Name "ImgHDD" -Value ""
    $vm | Add-Member -MemberType NoteProperty -Name "VideoCard" -Value ""  
    $vm | Add-Member -MemberType NoteProperty -Name "CDRom" -Value ""
    $vm | Add-Member -MemberType NoteProperty -Name "Monitor" -Value ""
    $vm | Add-Member -MemberType NoteProperty -Name "MonitorPort" -Value ""

    return $vm
}
#>



class ConfigCont
{
    [string] $QemuPath
    [List[VirtualMachine]] $Virtual_Machines = [List[VirtualMachine]]::new()
}

## Creation
function ConfigFileCreation
{
    write-host "Création du fichier de configuration"
    # Création de l'objet config
    $config=[ConfigCont]::new()

    <#$config = New-Object -TypeName PSCustomObject
    $config | Add-Member -MemberType NoteProperty -Name "QemuPath" -Value ""
    #$config | Add-Member -MemberType NoteProperty -Name "Virtual_Machines" -value (New-object System.Collections.Arraylist )
    $config | Add-Member -MemberType NoteProperty -Name "Virtual_Machines" -value ([System.Collections.Generic.List[string]]::new())

    #>
    ConfigFileWriting($config)
    
}



## Config File Writing
function ConfigFileWriting($config)
{
#Conversion + écriture
    $config | ConvertTo-Json | Out-File $configFile
}


function PathIsNull($path){
    try
    {
        $path=$path.trim()        
     }
     catch{}

    if( [string]::IsNullOrWhitespace($path))
    {
        return $true;
    }
    return $false;
}


# Virtual Machine Menu ----------------------------------------------
function VirtualMachineMenu
{
    while($true)
    {        
        Write-Host "`n---- Menu Virtual Machine ----"
        Write-Host "`tC) Création"
        Write-Host "`tL) Liste des machines virtuelles"
        Write-Host "`tD) Suppression"
        Write-Host "`tS) Sauvegarde"
        Write-Host "`tX) Sortie"


        $val=read-host -Prompt "Que choisissez vous ?"

        # Sortie
        if ($val -eq "x")
        {
            Write-Host "Sortie du menu Virtual Machine"
            Write-Host "---------------------------"
            return    
        }
        # Création de la VM
        elseif($val -eq "C")
        {
            Write-Host "`nCréation de vm"
            VirtualMachineCreate($config)
            
        }
        # Liste des machines Virtuelles
        elseif($val -eq "L")
        {
            Write-Host "`nListe des machines virtuelles:"
            VirtualMachineList($config)
        }
        elseif($val -eq "D")
        {

            VirtualMachineDelete($config)

        }
        # Sauvegarde  
        elseif($val -eq "S")
        {
            ConfigFileWriting($config)
            Write-Host "`n>>> Sauvegarde effectuée.`n"
        }
    }
}

function VirtualMachineCreate($config)
{
    do{
        $vmName=Read-Host -Prompt "Entrez un nom de VM"
        
    }until( $vmName -ne "C" -and $vmName -ne "VM")

    $vm=[VirtualMachine]::new($vmName)
    Write-host $vm.gettype()
    write-host $config.Virtual_Machines
    write-host $vm
    #$config.Virtual_Machines=$config.Virtual_Machines + $vm
    
    Write-Host $config.Virtual_Machines.GetType()


    $vm.Description=Read-Host -Prompt "Entrez une description"
    $vm.ImgHDD=AskHDD
    $vm.VideoCard=AskVideoCard
    $vm.CDRom=AskCDrom
    $vm.Monitor=AskMonitor
    
    if($vm.Monitor -ne $null){
        do{
            $vm.MonitorPort=Read-Host -Prompt "Entrez un numéro de port (5000<=p<65535)"
        
        }until( $vm.MonitorPort -gt 5000 -and $vm.MonitorPort -lt 65536 )
    }
    
    
    
    $config.Virtual_Machines.Add($vm)

    Write-Host "`n>>> Machine virtuelle ajoutée, non sauvegardée.`n"
            
}

function VirtualMachineList($config)
{
    $i=0
    ForEach( $elem in $config.Virtual_Machines)
    {
        $i=$($i+1)
        Write-Host "`t$($i)) $($elem.Name) - $($elem.Description)"
        
    }
}


function VirtualMachineDelete($config)
{
     Write-Host "`nListe des machines virtuelles:"
     VirtualMachineList($config)

     

     do{
        $val=read-host -Prompt "Indiquez la machine virtuelle à supprimer ?"
        $data = $( $config.Virtual_Machines[$val-1])
     
     }until(!($data -eq $null) )

     # Assignation sans l'élément à lever
     #$config.Virtual_Machines = $config.Virtual_Machines| Where-Object { $_ –ne $data }
     $config.Virtual_Machines.RemoveAt($val -1 )

     Write-Host "`n>>> Machine virtuelle supprimée; non sauvegardé.`n"

}


# Asks --------------------------------------------------------------
## Ask for the install path
function AskInstpath{
  # Chemin de Qemu
    while($true)
    {
        $qemuInstFolder=read-host -Prompt "Entrez le chemin d'installation de QEMU" 
        $qemuInstFolder=$qemuInstFolder.Replace("\\","\")

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


## Ask for HDD
function AskHDD{

    # HDD Path
    while($true)
    {        
        $imgPath=read-host -Prompt "Entrez un chemin d'image pour le disque dur (raw, qcow2)"
        $imgPath = $imgPath.Replace("\\","\")

        $ext=[IO.Path]::GetExtension($imgPath)   
        if ((Test-Path $imgPath)-and (($ext -eq ".raw") -or ($ext -eq ".qcow2") ))
        { 
            return $imgPath
        }
        
        write-Host "Ce chemin d'image n'est pas valable: '$imgPath'"        
        
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


## Ask for Monitor
function AskMonitor{
    while($true)
    {
        Write-Host "Select a Monitor mode to command the VM:"
        Write-Host "`t1) none       : defaut mode"
        Write-Host "`t2) stdio      : Use current cli"
        Write-Host "`t3) LocalTelnet: Telnet on localhost"
        Write-Host "`t4) LanTelnet : Telnet on Lan IP"

        $monitorC=read-host -Prompt "Enter your choice"

        switch($monitorC)
        {
            "1"{return ""}
            "2"{return "stdio"}
            "3"{return "LocalTelnet"}
            "4"{return "LanTelnet"}        
        }
        
        write-Host "This choix is unavailable"        
    }
}


# Verifications -----------------------------------------------------
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



# Main --------------------------------------------------------------
## Paramétrage
$ErrorActionPreference = 'Stop'
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete



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
$config=[ConfigCont]$config
#Write-Host $config.Virtual_Machines.GetType()



# Config Verifications
### Chemin de l'éxécutable
Write-Host $config.QemuPath

if ( (PathIsNull($config.QemuPath)) -or  !( Test-Path $(Join-Path $config.QemuPath -childpath $qemuComm)))
{
    write-Host "Le chemin '$($config.QemuPath)' n'inclus pas le fichier qemu-system-x86_64.exe"        
    $config.QemuPath=AskInstpath
    ConfigFileWriting($config)
}


<#
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
   $config.CDRom=
   ConfigFileWriting($config)
}
      
       
#>
<#
  
     -Value "$qemuInstFolder"

}
#>



## Vérifications

#$config.QemuPath="D:\Programmes\x64\Programmation\MSYS2\ucrt64\bin"
# chemin de l'éxécutable qemu
$exePath=join-path $config.QemuPath -childpath $qemuComm





# Paramétrage
$args=$null

While($true)
{  
    Write-Host "`nChoix de lancement:"
    VirtualMachineList($config)
    Write-Host "`tVM) Menu Virtual Machine"
    Write-Host "`tX) Sortie"
<#
Write-Host "`t1) Sans réseau"
Write-Host "`t2) Réseau mode bridge"
<#Write-Host "`t3) Bridge NoSDL"#>
<#
Write-Host "`t4) Bridge VNC"
Write-Host "`t5) Bridge Spice"


#>


    $val=Read-Host -Prompt "Entrez votre choix: "


   
    #write-host $hddPath
   


    if ($val -eq "x")
    {
        Write-Host "Sortie du script Qemu2D"
        exit
    }
    elseif($val -eq "VM")
    {
        VirtualMachineMenu
        continue;
    }
    



    try{
        # intéressant mais plus utilisé
    #"$data=$config.Virtual_Machines | Where-Object {$_.Name -eq $val}"
    $data = $( $config.Virtual_Machines[$val-1])
    }
    catch{}

    
    

    if(!($data -eq $null))
    {
        Write-Host "Trouvé"
        break
    }
    
    
 }
 exit
 if($true)
 {}

    elseif ( $val -eq "2" -or $val -eq "3" -or $val -eq "4" -or $val -eq "5")
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
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01  -machine acpi=off -k fr-fr -no-reboot -display sdl -boot menu=on"
        break
    }
    <#elseif($val -eq "3")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -k fr-fr -no-reboot -boot menu=on"
        break
    }#>
        elseif($val -eq "4")
    {
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -no-reboot -boot menu=on -display none -vnc :0 -usbdevice tablet -monitor stdio"
        "-monitor telnet:127.0.0.1:7777,server,nowait"
        break
    }
    elseif($val -eq "5")
    {
        $secret= join-path $folderPath -childpath "spice-password.txt"
        # Creating secret if doesn't exists
        if(-NOT(Test-Path($secret)))
        {
            $password = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 16 | ForEach-Object {[char]$_}) 
            Set-Content -Path $secret -Value $password -Encoding utf8nobom -NoNewline
            Write-Host "Ecriture du secret dans '$secret'"            
        }
        Write-Host $secret
        Write-Host $(Get-Content -Path $secret)
                
        $args= "-cpu pentium2 -m 256 -vga cirrus -drive format=raw,file=`"$hddPath`" -cdrom $cdromPath -device sb16 -netdev tap,id=netw0,ifname=OpenVPN_TAP,script=no,downscript=no -device rtl8139,netdev=netw0,mac=52:55:00:d1:55:01 -machine acpi=off -no-reboot -boot menu=on -display none -object secret,id=test,file=`"$secret`" -spice port=5930,password-secret=test -monitor telnet:127.0.0.1:7777,server,nowait"
        break
    }


exit
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

