# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 07/01/2024 18:18 UTC +3
FROM ghcr.io/pikaos-linux/pikaos-builder:canary
RUN apt update
# Test KDE
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y kde-full -o Dpkg::Options::="--force-confnew"
# Debug start
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libjavascriptcoregtk-6.0-1 libwebkitgtk-6.0-4 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y plasma-desktop -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y kde-standard -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y accountwizard -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y kde-full -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libqt5quick5 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libkirigamiprivate6 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-settings-daemon -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-control-center -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libpipewire-0.3-0t64 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libspa-0.2-bluetooth -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-core -o Dpkg::Options::="--force-confnew" || true
RUN exit 1
# Debug END
# Test GNOME
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-core -o Dpkg::Options::="--force-confnew"
# Test after upgrade
RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt full-upgrade -y -o Dpkg::Options::="--force-confnew"
