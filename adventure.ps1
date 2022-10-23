# Script d'apprentissage PowerShell
# Par Olivier MICHEL
# Capgemini pour RTE
# v 0.1 - 17 oct 2022
# v 0.2 - 23 oct 2022

$cle = "0"
$pos = "chemin"
while ($true )
{
$choix = Read-Host -Prompt "Que voulez-vous faire ?"

    if ($choix -eq "Aide" -or $choix -eq "Help")
    {
    write-Output ("Marcher|Regarder|Creuser|Ouvrir|Inventaire|Sauvegader|Restaurer")
    }

    if ($choix -eq "Inventaire")
    {
        if ($cle -eq "1")
        {
            Write-Output ("Vous avez une clé")
        }
        else
        {
            Write-Output ("Vous n'avez rien en poche")
        }
    }


    if ($choix -eq "Marcher"){
        $direction = Read-Host -Prompt "Quelle direction [o|e|n|s] ?"
        if ($direction -eq "n")
        {
            Write-Output "Vous allez au nord, vers la forêt"
            $pos = "foret"
        }

        if ($direction -eq "s")
        {
            Write-Output "Vous allez au sud, vers la plage"
            $pos = "plage"
        }

        if ($direction -eq "e")
        {
            Write-Output "Vous allez à l'est, vers la maison"
            $pos = "maison"
        }

        if ($direction -eq "o")
        {
            Write-Output "Vous allez à l'ouest vers la rivière"
            $pos = "riviere"
        }
    }

if ($choix -eq "Regarder") {
        if ($pos -eq "Plage") {
            Write-Output "Vous regardez la grande plage de sable fin"
        }
        elseif ($pos -eq "Foret") {
            Write-Output "Vous regardez une belle forêt"
        }
        elseif ($pos -eq "Riviere") {
            Write-Output "Vous regardez une rivière"
        }   
        elseif ($pos -eq "Plage") {
            Write-Output "Vous regardez une belle plage"
        }
        elseif ($pos -eq "Maison") {
            Write-Output "Vous regardez une grande maison"
        }
        elseif ($pos -eq "maison_entree"){
            Write-Output "Vous êtes dans une grande maison, il y a plusieurs pièces et une cheminée"
        }
        else
        {
            Write-Output "Vous regardez l horizon"
        } 
    }
    if ($choix -eq "creuser")
    {
        if ($pos -eq "plage" -and $cle -eq "0")
        {
            Write-Output "Vous trouvez une clé"
            $cle = "1"
        }
        else {
            Write-Output "Vous ne trouvez rien"
        }
    }

    if ( $choix -eq "ouvrir" -and $pos -eq "maison" )
    {
        if ($cle -eq "1")
        {
            Write-Output ("Vous ouvrez la serrure et vous entrez dans la maison")
            $pos = "maison_entree"
        }
        elseif ($cle -eq "0") {
            Write-Output ("Vous n'avez pas la clé")
        }
            
    }

    if ( $choix -eq "sauver")
    {
        add-content save.txt "$pos;$cle"
        Write-Output "Vous avez sauvegardé la partie"
    }
}

