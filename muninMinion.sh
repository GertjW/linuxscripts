Munin=$(apt list --installed | grep munin-node)
  

    if [ -z "$Munin" ];
        then
            echo "not installed"
			sudo apt-get update
            sudo apt-get install -y munin-node
		else
			echo "Muninminion is installed"
		fi
		
sudo cp muninNodeNew.conf /etc/munin-node.conf
sudo service munin-node restart
