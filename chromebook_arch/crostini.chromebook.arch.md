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

## setting up postgresql
https://wiki.archlinux.org/index.php/PostgreSQL#Initial_configuration

- become the postgres user: `sudo -iu postgres`
- `[postgres]$ initdb -D /var/lib/postgres/data`
- become the normal user and start the service: `systemctl start postgresql.service`
- become the postgres user.
- `[postgres]$ createuser --interactive` use your default users username 
- `[postgres]$ createdb <username>`
