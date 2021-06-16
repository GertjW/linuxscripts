 
    software=$(apt list --installed | grep salt-master)
  

    if [ -z "$software" ];
        then
            echo "not installed"  
            curl -fsSL https://bootstrap.saltproject.io -o install_salt.sh
			sudo sh install_salt.sh -P -M -x python3
			sudo cp saltMaster.conf /etc/salt/master
			salt-key -F master
			salt-key -L
			
		else
			echo "Salt-master is installed"
		fa