apt-get -y install make
make -v
apt-get update -qq >/dev/null
curl -fsSL https://get.docker.com | sh; >/dev/null
curl -fsSL https://test.docker.com | sh; >/dev/null
make shellcheck