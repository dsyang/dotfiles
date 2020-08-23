# Setting up arch linux on chromebook

https://wiki.archlinux.org/index.php/Chrome_OS_devices/Crostini

## packages to install to complete basic setup
`sudo pacman -S base-devel sudo git`

## AUR
create an aur directory in ~/aur
download package from AUR
`makepkg -si`

## For development
`sudo pacman -S python3 postgresql npm`
