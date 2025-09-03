#!/bin/bash

if nmcli connection show --active | grep -q "wg0"; then
    nmcli connection down wg0
else
    nmcli connection up wg0
fi
