# We just want archlinux with an aur helper already included
# Bump for rebuild on 14/08/2023 17:30 UTC +3
FROM archlinux:latest
RUN pacman -S --needed git base-devel --noconfirm
RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay
RUN makepkg -si  --noconfirm
