#! /bin/bash

mkdir -p /etc/apt/sources.list.d

# Clear /etc/apt/sources.list in favor of deb822 formats
tee /etc/apt/sources.list.d/system.sources <<'EOF'
## This file is deprecated in PikaOS.
## See /etc/apt/sources.list.d/system.sources.
EOF

# Add Debian Repos
tee /etc/apt/sources.list.d/system.sources <<'EOF'
X-Repolib-Name: Debian System Sources
Enabled: yes
Types: deb deb-src
URIs: http://deb.debian.org/debian
Suites: sid experimental
Components: main contrib non-free non-free-firmware
X-Repolib-ID: system
X-Repolib-Default-Mirror: http://deb.debian.org/debian
Signed-by: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

# Add Pika Repos
tee /etc/apt/sources.list.d/pika.sources <<'EOF'
X-Repolib-Name: PikaOS Sources
Enabled: yes
Types: deb
URIs: https://ppa.pika-os.com/
Suites: pikauwu
Components: main amdgpu rocm
X-Repolib-Default-Mirror: https://ppa.pika-os.com/
Signed-By: /etc/apt/keyrings/pika-keyring.gpg.key
EOF

# Add DMO Repos
tee /etc/apt/sources.list.d/dmo.sources <<'EOF'
X-Repolib-Name: Multimedia Sources
Enabled: yes
Types: deb
URIs: https://www.deb-multimedia.org
Suites: sid
Components: main non-free
X-Repolib-Default-Mirror: https://www.deb-multimedia.org/
Signed-By: /etc/apt/keyrings/deb-multimedia-keyring.gpg
EOF

# Get keyrings
mkdir -p /etc/apt/keyrings/
wget https://github.com/PikaOS-Linux/pkg-pika-sources/blob/main/pika-sources/usr/share/apt-pika/apt/keyrings/pika-keyring.gpg.key -O /etc/apt/keyrings/pika-keyring.gpg.key
wget https://github.com/CosmicFusion/debian-bleedingedge/raw/main/deb-multimedia-keyring.gpg -O /etc/apt/keyrings/deb-multimedia-keyring.gpg

# Setup apt configration
mkdir -p  /etc/apt/preferences.d/
tee /etc/apt/preferences.d/0-pika-debian-settings <<'EOF'
# Lower Debians's priority under pika's
Package: *
Pin: release a=experimental   
Pin-Priority: 400


Package: *
Pin: release o=Debian
Pin-Priority: 400

Package: *
Pin: release o=Unofficial Multimedia Packages
Pin-Priority: 400

Package: *
Pin: release a=pikauwu,c=main
Pin-Priority: 500
EOF

tee /etc/apt/preferences.d/1-pika-radeon-settings <<'EOF'
Package: libhsa-runtime64*
Pin: release o=Debian
Pin-Priority: 100

Package: hipcc*
Pin: release o=Debian
Pin-Priority: 100

Package: rocm*
Pin: release o=Debian
Pin-Priority: 100

Package: *
Pin: release c=rocm
Pin-Priority: 450

Package: amdgpu-core amdgpu-pro-core amdgpu-dkms amdgpu-pro-lib32
Pin: release a=*
Pin-Priority: -10
EOF
