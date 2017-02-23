cd $HOME
sudo apt-get update -y
sudo apt-get install git -y
sudo apt-get install build-essential -y
sudo apt-get install -y redis-server

if [ -d "$HOME/node" ]; then
  rm -rf $HOME/node
fi

cd $HOME
wget https://nodejs.org/dist/v6.5.0/node-v6.5.0-linux-x64.tar.gz -O node.tar.gz
tar -xzvf node.tar.gz
echo "now moving path"
mv node-v6.5.0-linux-x64 node
rm node.tar.gz
echo "PATH=\"\$HOME/node/bin:\$PATH\"" | tee -a .profile

cd $HOME
sudo rm /usr/bin/{node,npm}
sudo ln -s $HOME/node/bin/node /usr/bin/node
sudo ln -s $HOME/node/bin/npm /usr/bin/npm

#################################################
# postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
sudo -i -u postgres createdb dev
# sudo su postgres
# psql
# CREATE USER dev WITH SUPERUSER PASSWORD 'dev';
# \q
# exit
sudo service postgresql restart
#################################################
# redis
sudo service redis-server restart
