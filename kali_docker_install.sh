cat > install_docker.sh << 'EOF'
#!/bin/bash
echo "========================================"
echo "      Kali Docker 一键安装脚本"
echo "========================================"

echo "[+] 更新软件源..."
sudo apt update -y

echo "[+] 安装 Docker 和 Docker Compose..."
sudo apt install -y docker.io docker-compose

echo "[+] 启动 Docker 并设置开机自启..."
sudo systemctl start docker
sudo systemctl enable docker

echo "[+] 将当前用户加入 Docker 组..."
sudo usermod -aG docker $USER
newgrp docker

echo "========================================"
echo "           安装完成！"
echo "  测试：docker --version && docker-compose --version"
echo "========================================"
EOF

chmod +x install_docker.sh
bash install_docker.sh