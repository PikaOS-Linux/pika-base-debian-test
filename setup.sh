#! /bin/bash

mkdir -p /etc/apt/sources.list.d

rm -rf /etc/apt/sources.list.d/*

# Clear /etc/apt/sources.list in favor of deb822 formats
tee /etc/apt/sources.list <<'EOF'
## This file is deprecated in PikaOS.
## See /etc/apt/sources.list.d/system.sources.
EOF

# Add Pika Repos
tee /etc/apt/sources.list.d/system.sources <<'EOF'
X-Repolib-Name: PikaOS System Sources
Enabled: yes
Types: deb
URIs: https://ppa.pika-os.com/
Suites: pika
Components: canary
X-Repolib-ID: system
X-Repolib-Default-Mirror: https://ppa.pika-os.com/
Signed-By: /etc/apt/keyrings/pika-keyring.gpg.key
Allow-Insecure: yes
Allow-Weak: yes
Allow-Downgrade-To-Insecure: yes
Trusted: yes
EOF

apt update
DEBIAN_FRONTEND=noninteractive apt full-upgrade -y -o Dpkg::Options::="--force-confnew"
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
# Reinstall all packages from canary
dpkg --get-selections > selections
dpkg --clear-selections
dpkg --set-selections < selections
DEBIAN_FRONTEND=noninteractive apt-get install --reinstall wget -y -o Dpkg::Options::="--force-confnew"
