# Install and start docker with yum (CentOS's package manager)
sudo yum update
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
sudo service docker start
sudo chkconfig docker on

# Install docker compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
# sudo chmod +x /usr/local/bin/docker-compose