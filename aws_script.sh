assignment:

echo "#!/bin/bash
sudo -u ubuntu bash -c whoami;PATH=$PATH:/usr/local/bin
echo Add Node.js APT Repository
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
echo Install Node.js 12 on Ubuntu / Debian / Linux Mint
sudo apt -y install nodejs
sudo apt -y  install gcc g++ make
echo Confirm Node.js 12 installation by checking the version installed.
export citymall=/tmp/citymall
sudo node --version
sudo npm --version" >> /tmp/citymall
echo "Downloading the aws package"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
echo "extracting the package"
unzip awscliv2.zip
echo "installing package"
sudo ./aws/install
echo "configuring aws cli"
echo "aws_access_key_id=xxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxx >> ~/.aws/credentials
echo "creating the sg name"
aws ec2 create-security-group --group-name citymall-pfa --description "city mall dev" --vpc-id vpc-xxxxxx
aws ec2 describe-security-groups --group-names citymall-pfa
echo "assiging the protocols"
aws ec2 authorize-security-group-ingress --group-id sg-xxxx --protocol tcp --port 22  --port 80 --port 443 --port 3000 --cidr x.x.x.x
echo "starting the instance with userdata script"
aws ec2 run-instances --image-id ami-0b44050b2d893d5f7 --count 1 --instance-type t2.large --associate-public-ip-address --key-name xxxx --security-group-ids xxxxx --subnet-id subnet-xxxxx --user-data file://$citymall
echo instances was launched" >> /tmp/citymallaws.sh


