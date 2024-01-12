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

# Get keys
