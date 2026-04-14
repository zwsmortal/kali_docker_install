#!/bin/bash

# 自动安装 Docker 并配置权限的 Kali 自动化脚本
echo "========================================"
echo "      Kali Docker 一键安装脚本"
echo "========================================"
echo ""

# 1. 更新软件源索引
echo "[+] 正在更新软件源索引..."
sudo apt update -y

# 2. 安装 docker.io 和 docker-compose
echo "[+] 正在安装 Docker 和 Docker Compose..."
sudo apt install -y docker.io docker-compose

# 3. 启动 Docker 并设置开机自启
echo "[+] 启动 Docker 服务并设置开机自启..."
sudo systemctl start docker
sudo systemctl enable docker

# 4. 将当前用户加入 docker 组，免 sudo 使用 docker
echo "[+] 将当前用户加入 Docker 组..."
sudo usermod -aG docker $USER

# 5. 立即生效用户组（无需重启终端）
echo "[+] 立即生效 Docker 组权限..."
newgrp docker

echo ""
echo "========================================"
echo "        Docker 安装配置完成！"
echo "  测试命令：docker --version && docker-compose --version"
echo "========================================"