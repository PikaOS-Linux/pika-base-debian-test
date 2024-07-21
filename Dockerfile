# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 07/01/2024 18:18 UTC +3
FROM debian:sid
RUN apt update
RUN apt install -y wget ca-certificates 
RUN wget https://github.com/PikaOS-Linux/pika-base-debian-test/raw/main/setup.sh
RUN chmod +x ./setup.sh
RUN ./setup.sh
# Standard stuff
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl vim  gnupg2 apt-transport-https netbase lsb-release apt-utils  debian-keyring debian-archive-keyring sudo systemd ifupdown rsyslog logrotate less bash-completion sudo devscripts git eatmydata bc cowbuilder gpg gpg-agent bison build-essential ccache cmake cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev lz4 qtbase5-dev rsync schedtool wget zstd tar aptly devscripts dh-make rpm2cpio -o Dpkg::Options::="--force-confnew"
# Test KDE
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y kde-full -o Dpkg::Options::="--force-confnew"
# Debug start
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libkirigamiprivate6 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-settings-daemon -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-control-center -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libpipewire-0.3-0t64 -o Dpkg::Options::="--force-confnew" || true
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libspa-0.2-bluetooth -o Dpkg::Options::="--force-confnew" || true
exit 1
# Debug END
# Test GNOME
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnome-core -o Dpkg::Options::="--force-confnew"
# Test after upgrade
RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt full-upgrade -y -o Dpkg::Options::="--force-confnew"
