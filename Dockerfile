# We just want archlinux with an aur helper already included
# Bump for rebuild on 14/08/2023 17:30 UTC +3
FROM archlinux:latest
pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si  --noconfirm
