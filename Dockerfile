# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 07/01/2024 18:17 UTC +3
FROM debian:sid
RUN apt update
RUN apt install -y wget curl vim sudo systemd ifupdown rsyslog logrotate less bash-completion ca-certificates netbase lsb-release apt-utils gnupg2 apt-transport-https
RUN wget https://github.com/Jguer/yay/releases/download/v12.2.0/yay_12.2.0_x86_64.tar.gz
RUN ./setup.sh
