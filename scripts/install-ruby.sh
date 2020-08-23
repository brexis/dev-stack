# Install Rvm
echo "Installing rvm"

\curl -sSL https://get.rvm.io | bash -s stable --rails

echo -e "source $HOME/.rvm/scripts/rvm" | tee -a "$HOME/.bashrc"

source $HOME/.rvm/scripts/rvm
