#!/bin/bash

if nmcli connection show --active | grep -q "wg0"; then
    echo '{"text": " VPN", "class": "connected"}'
else
    echo '{"text": " VPN", "class": "disconnected"}'
fi
