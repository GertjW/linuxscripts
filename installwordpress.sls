Inspiratie: https://gist.github.com/hbokh/944987bb7f34dc38767830b882364e3e
wordpress-packages:
  pkg.installed:
    - pkgs:
      - nginx
      - nginx-common
      - nginx-full
      - mariadb-client
      - mariadb-server
      - python3-mysqldb
      - python3-pip
      - php7.4-fpm
      - php7.4-mysql
      - php7.4-common
      - php7.4-curl
      - php7.4-gmp
      - php7.4-intl
      - php7.4-mbstring
      - php7.4-xmlrpc
      - php7.4-gd
      - php7.4-xml
      - php7.4-cli
      - php7.4-zip
Wordpress_database:
  pip.installed:
    - name: mysql
  mysql_database.present:
    - name: wordpress
  mysql_user.present:
    - name: gertjan
    - password: Durkdurk123!
  mysql_grants.present:
    - database: wordpress.*
    - grant: ALL PRIVILEGES
    - user: gertjan
    - host: 'localhost'

get_wordpress:
  cmd.run:
    - name: 'wget -q -O - http://wordpress.org/latest.tar.gz | tar zxf - '
    - cwd: /var/www/
    - creates: /var/www/wordpress/index.php
    - runas: root

/var/www/wordpress:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: 775
    - file_mode: 664
    - recurse:
    - user
    - group
    - mode

/etc/nginx/sites-available/wordpress:
  file.managed:
    - source: salt://wordpress
    - user: root
    - mode: 644


/etc/nginx/sites-enabled/wordpress:
  file.symlink:
    - target: /etc/nginx/sites-available/wordpress

nginx:
  service.running:
    - watch:
    - file: /etc/nginx/sites-enabled/wordpress

