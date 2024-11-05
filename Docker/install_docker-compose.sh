echo "[1] : install docker and verify installation succesful"

apt-get -y install make
make -v
apt-get update -qq >/dev/null
curl -fsSL https://get.docker.com | sh; >/dev/null
curl -fsSL https://test.docker.com | sh; >/dev/null
make shellcheck

echo "[2] : install docker-compose and check installation succesful"
curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker compose &>/dev/null 

if [ $? -eq 0 ]; then
    echo "INSTALLED"
else
    echo "NOT INSTALLED"
fi