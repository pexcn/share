#!/bin/bash

curl -sSL https://github.com/pexcn/share/raw/master/fix/nvidia/nvidia-card-disabler.service > /lib/systemd/system/nvidia-card-disabler.service
curl -sSL https://github.com/pexcn/share/raw/master/fix/nvidia/nvidia-card-enabler.service > /lib/systemd/system/nvidia-card-enabler.service

systemctl enable nvidia-card-disabler.service
