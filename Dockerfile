# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 07/01/2024 18:17 UTC +3
FROM debian:sid
RUN apt update
RUN apt install -y wget curl vim sudo systemd ifupdown rsyslog logrotate less bash-completion ca-certificates netbase lsb-release apt-utils gnupg2 apt-transport-https debian-keyring debian-archive-keyring
RUN wget https://github.com/CosmicFusion/debian-bleedingedge/raw/main/setup.sh
RUN chmod +x ./setup.sh
RUN ./setup.sh
RUN apt update
RUN apt full-upgrade -y
