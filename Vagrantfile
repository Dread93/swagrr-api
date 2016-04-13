# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "33.33.33.32"

  config.vm.synced_folder ".", "/srv/swagrr-api"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.provision :shell, inline: $script, keep_color: true

end

$script = <<SCRIPT
  function install {
      echo installing $1
      shift
      apt-get -y install "$@" >/dev/null 2>&1
  }

  echo updating package information
  apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
  apt-get -y update >/dev/null 2>&1

  install 'development tools' build-essential

  install Ruby ruby2.3 ruby2.3-dev
  update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
  update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1

  echo installing Bundler
  gem install bundler -N >/dev/null 2>&1

  install Git git
  install Redis redis-server

  install PostgreSQL postgresql postgresql-contrib libpq-dev
  sudo -u postgres createuser --superuser vagrant
  sudo -u postgres createdb -O vagrant activerecord_unittest
  sudo -u postgres createdb -O vagrant activerecord_unittest2

  sudo touch /etc/init.d/port_swap
  sudo chmod 777 /etc/init.d/port_swap
  sudo echo "sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000" >> /etc/init.d/port_swap
  sudo ln -s /etc/init.d/port_swap /etc/rcS.d/S99port_swap

  install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
  install 'ExecJS runtime' nodejs
  install 'Node Package Manager' npm

  update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

  echo 'bootstrapped that shizz'
SCRIPT
