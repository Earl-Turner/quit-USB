#   Copyright (C) 2021 Earl Turner
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>
#

#!/bin/bash

cat << EOF
//----------------------------------------
//              USB QUIT 3.0             |
//----------------------------------------
EOF

if ! [ $(id -u) = 0 ]; then
    echo "Este script debe ejecutarse como superusuario."
    exit 1
fi

lsblk | grep -v "lo" | grep -v "sda" | grep -v "sr0"

cat << EOF
que unidad o unidades de disco deseas desmontar?
Ejemplo:
sdb1 - particion individual.
sdb - disco completo.
EOF
read usb
particion='^[a-z]+[a-z]+[a-z]+[0-9]'
swap=$(swapon --show=NAME | grep /)
if ! [[ $usb =~ $particion ]] ; then
    echo "Demostando y apagando disco completo."
    ls /dev/$usb | xargs -n1 umount -v
    udisksctl power-off -b /dev/$usb
    else
    echo "Desmontando particion individual."
    umount /dev/$usb
fi
