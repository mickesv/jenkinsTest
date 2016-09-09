Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.provision "shell", inline: <<-SHELL
sudo apt-get -qq update > aglog.log
sudo apt-get -qy install python-software-properties
sudo add-apt-repository -y ppa:ubuntu-elisp
sudo apt-get -qq update >> aglog.log
sudo apt-get -qy install emacs-snapshot
emacs -nw --batch -l /vagrant/emacsbuild.el
  SHELL
end
