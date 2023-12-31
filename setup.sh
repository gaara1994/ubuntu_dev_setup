#!/bin/bash  
  
# 更新软件包列表  
sudo -E apt update  
# 安装基本开发工具
sudo -E apt install -y build-essential
# 安装其他常用的工具  
sudo -E apt install -y curl wget vim  git tree terminator

# 安装golang开发环境
wget -O go.tar.gz  https://golang.google.cn/dl/go1.21.5.linux-amd64.tar.gz 
sudo -E rm -rf /usr/local/go && sudo tar -zxvf go.tar.gz -C /usr/local
cd && mkdir -p go/{bin,pkg,src}
# 设置go环境变量
sudo -E sh -c 'echo "export GO111MODULE=on" >> /etc/profile'
sudo -E sh -c 'echo "export GOROOT=/usr/local/go" >> /etc/profile'
sudo -E sh -c 'echo "export GOPATH=\$HOME/go" >> /etc/profile'
sudo -E sh -c 'echo "export GOBIN=\$GOPATH/bin" >> /etc/profile'
sudo -E sh -c 'echo "export GOPROXY=https://goproxy.cn,direct" >> /etc/profile'
# 添加path
sudo -E sh -c 'echo "export PATH=\$PATH:\$GOROOT/bin" >> /etc/profile'
sudo -E sh -c 'echo "export PATH=\$PATH:\$GOBIN" >> /etc/profile'

# 安装dk11
sudo -E apt install -y openjdk-11-jdk

echo "安装完毕！"