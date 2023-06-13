#!/bin/bash

cat << 'EOF' >> /etc/udev/rules.d/21-cypherock.rules
SUBSYSTEM=="input", GROUP="input", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0103", MODE:="666", GROUP="plugdev"
KERNEL=="hidraw*", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0103", MODE="0666", GROUP="plugdev"
EOF

udevadm trigger
udevadm control --reload
usermod -a -G dialout $USER
