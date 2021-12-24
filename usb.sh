#Copyright (C) <2021>  <Earl Turner>
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>
#
#!/bin/bash

echo "\n.........................\n			 \.............\n                          ·     ▨      ·\nUSB QUIT 2.0               .	        .\n			    .	  ▨	 .\n............................··············\n|||||||||||||||||||||||||||||            :\n|||||||||||||||||||||||||||||............:\n|||||||||||||||||||||||||||||\n·····························
"


lsblk |grep -v "lo" |grep -v "sda" |grep -v "sr0"

echo  "\nque unidad/es de disco desea retirar? ejemplo (sdb1) "
read usb
umount /dev/$usb
udisksctl power-off -b /dev/$usb
