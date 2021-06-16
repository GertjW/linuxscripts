    software=$(apt list --installed | grep salt-minion) #kijken of salt-minion al geinstalleerd is
  

    if [ -z "$software" ]; #Wanneer dit niet geinstalleerd is zal dit worden gedownload en geinstalleerd.
        then
            echo "not installed"  
            curl -fsSL https://bootstrap.saltproject.io -o install_salt.sh
			sudo sh install_salt.sh -P -M -x python3
			sudo cp saltMinion /etc/salt/minion #In dit bestand is het ip-address en de salt master key toegevoegd. Wanneer deze key onjuist dit terugkomen in een foutmelding. Hierdoor is de salt minion alleen maar installeerbaar als de salt-master aanwezig is.
			sudo salt-minion
			echo "herstart de machine en accepteer de sleutel op de salt Master"
		else
			echo "Salt-minion is installed"
		fi