Apache2=$(apt list --installed | grep Apache2)
  

    if [ -z "$Apache2" ];
        then
            echo "not installed"  
            sudo apt-get update
			sudo apt-get install -y apache2 apache2-utils	
			sudo apt-get install -y libcgi-fast-perl libapache2-mod-fcgid
			sudo a2enmod fcgid
			
		else
			echo "Apache2 is installed"
		fi

Munin=$(apt list --installed | grep munin)
  

    if [ -z "$Munin" ];
        then
            echo "not installed"
			sudo apt-get update
            sudo apt-get install -y smunin munin-node munin-plugins-extra
		else
			echo "Munin is installed"
		fi

sudo cp muninNew.conf /etc/munin/munin.conf
sudo chown munin:munin /var/cache/www/munin
sudo chown root:root /var/cache/www/munin
sudo service apache2 restart
sudo service munin-node restart
sudo service munin-node restart
