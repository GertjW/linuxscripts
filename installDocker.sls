docker-packages:
  pkg.installed:
    - pkgs:
      - transport-https
      - ca-certificates
      - curl
      - software-properties-common

docket_repo:
  cmd.run:
    - name: '-fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'

add_Docker_Repo:
  cmd.run:
    - name: 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"'

install-docker:
  pkg.installed:
    - pkgs:
      - docker-ce


