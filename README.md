# dotfiles

           .-------------------------:                    riber@cachyos
          .+=========================.                    -------------
         :++===++==================-       :++-           OS: CachyOS x86_64
        :*++====+++++=============-        .==:           Host: HP EliteBook 840
       -*+++=====+***++==========:                        Kernel: Linux 6.16.4-2-cachyos
      =*++++========------------:                         Uptime: 9 hours, 27 mins
     =*+++++=====-                     ...                Packages: 938 (pacman)
   .+*+++++=-===:                    .=+++=:              Shell: fish 4.0.2
  :++++=====-==:                     -*****+              Display (LGD0791): 1920x1200 @ 60 Hz in 14" [Built-in]
 :++========-=.                      .=+**+.              Display (DELL S2722QC): 3840x2160 @ 60 Hz (as 2560x1440) in 27" [External]
.+==========-.                          .                 WM: niri (Wayland)
 :+++++++====-                                .--==-.     Theme: Nordic-Darker-Solid [Qt], cachyos-nord [GTK3/4]
  :++==========.                             :+++++++:    Font: Fira Sans (10pt) [GTK3/4]
   .-===========.                            =*****+*+    Cursor: capitaine (24px)
    .-===========:                           .+*****+:    Terminal: alacritty 0.15.1
      -=======++++:::::::::::::::::::::::::-:  .---:      Terminal Font: monospace (12pt)
       :======++++====+++******************=.             CPU: Intel(R) Core(TM) Ultra 7 155H (22) @ 4.80 GHz
        :=====+++==========++++++++++++++*-               GPU: Intel Arc Graphics @ 2.25 GHz [Integrated]
         .====++==============++++++++++*-                Memory: 4.64 GiB / 30.80 GiB (15%)
          .===+==================+++++++:                 Swap: 0 B / 30.80 GiB (0%)
           .-=======================+++:                  Disk (/): 18.57 GiB / 244.61 GiB (8%) - btrfs
             ..........................                   Disk (/mnt/ubuntu): 180.17 GiB / 226.59 GiB (80%) - ext4
                                                          Local IP (wlan0): ***
                                                          Battery (Primary): 98% [AC Connected]
                                                          Locale: en_US.UTF-8

My notes and dotfiles for setting up my working computer as a developer.

## OS install
CachyOS with Niri selected as DE. GRUB bootloader. BTRFS partition for backups.

If there is problems with WiFi in the live installer, try to use `iwctl` to connect.

If you do dual boot with GRUB, do this to detect your old os:
1. Edit `/etc/default/grub` -> uncomment `GRUB_DISABLE_OS_PROBER=false`
2. Use the grub-mkconfig tool to generate config: `grub-mkconfig -o /boot/grub/grub.cfg`


## List of stuff to install for customization
* wireguard-tools (paru)
* gsimplecal (paru)

## VPN - Wireguard

1. Place the wg0.conf file in `/etc/wireguard/wg0.conf`
2. Test it:  
```
sudo wg-quick down wg0   # in case it’s already “up”
sudo wg-quick up /etc/wireguard/wg0.conf
sudo wg
ping 1.1.1.1
ping google.com
```
3. If it works, add it to `NetworkManager`: `nmcli connection import type wireguard file /etc/wireguard/wg0.conf`
4. Start it via `nmcli`

The waybar config includes module for toggling VPN on/off. See `.config/waybar/config`

## Waybar
To restart waybar do
```
pkill waybar
waybar &
```
