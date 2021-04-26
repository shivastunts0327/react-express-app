Type 1:-

echo "#!/bin/bash
echo Add Node.js APT Repository
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
echo Install Node.js 12 on Ubuntu / Debian / Linux Mint
sudo apt -y install nodejs
sudo apt -y  install gcc g++ make
echo Confirm Node.js 12 installation by checking the version installed.
sudo node --version
sudo npm --version
cd /opt
git clone https://github.com/city-mall/react-express-app
cd react-express-app
yarn
yarn run build
yarn run start >/dev/null  2>&1  &
cd frontend
yarn
yarn run build
yarn run start >/dev/null  2>&1  & >> /opt/citymall.sh


Docker file:-

FROM ubuntu
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install sudo -y
COPY ./citymall.sh /opt/
RUN chmod +x /opt/citymall.sh # optional(if you want run in bash shell means uncomment the line)
EXPOSE 3000
WORKDIR /opt
ENTRYPOINT ["sh", "citymall", "sh]'



Type 2:-

echo "#!/bin/bash
echo Add Node.js APT Repository
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
echo Install Node.js 12 on Ubuntu / Debian / Linux Mint
sudo apt -y install nodejs
sudo apt -y  install gcc g++ make
echo Confirm Node.js 12 installation by checking the version installed.
sudo node --version
sudo npm --version
cd /opt
git clone https://github.com/city-mall/react-express-app
cd react-express-app
yarn
yarn run start >/dev/null  2>&1  &
cd frontend
yarn >> /opt/citymall.sh

Docker file:-

FROM ubuntu
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install sudo -y
COPY ./citymall.sh /opt/
RUN chmod +x /opt/citymall.sh # optional(if you want run in bash shell means uncomment the line)
EXPOSE 3000
WORKDIR /opt/react-express-app/frontend
ENTRYPOINT ["yarn", "run", "start]'
