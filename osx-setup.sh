echo '******** Welcome to the OSX Setup **********
--------------------------------------------------'

echo 'This will install Brew, Nodejs(latest), Postgres(latest), Redis for your beautiful Mac for now and later project
---------------------------------------------------'

echo 'Installing Brew for you
---------------------------------------------------'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" -y
echo 'Lets update your Brew now
---------------------------------------------------'
brew update -y
echo 'Is your brew need doctor so lets take him
---------------------------------------------------'
brew doctor -y
echo '******** Brew installed successfully *********'

echo 'Installing Node now
---------------------------------------------------'
brew install node -y
brew update -y
brew doctor -y
echo '******** Node in your service ********'

echo 'Installing Postgres now
---------------------------------------------------'
brew install postgresql -y
initdb /usr/local/var/postgres -E utf8
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.2.1/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
createdb dev
echo '******** Postgres installed successfully and a db dev is created *********'

echo 'Installing Redis now
---------------------------------------------------'
brew install redis -y
brew update -y
brew doctor -y
echo '******** Redis installed ********'