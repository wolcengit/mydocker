#!/bash/bin

#install openssh server
yum install -y openssh openssh-server

#generate ssh key
ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
mkdir -p /root/.ssh && chown root.root /root && chmod 700 /root/.ssh

#change root password to password.maint
echo 'root:password.maint' | chpasswd

#install go env
yum install -y git make gcc tar wget
wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
#tar zxf go1.8.3.linux-amd64.tar.gz -C /usr/local/

mkdir -p /go

echo 'export GOROOT=/usr/local/go' >>/etc/profile
echo 'export GOPATH=/go' >>/etc/profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >>/etc/profile

source /etc/profile

#install go workspace
sh instgo.sh
#tar -zxf go-workspace.tar.gz -C /

# install vim
yum install -y vim
tar -zxf vimgo.tar.gz -C ~
