# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── flake.nix
├── home-manager.nix      — home-manager module config
├── hosts/nixos/          — host-specific (default.nix, hardware.nix)
├── home/mmunoz/          — home-manager (zsh, gtk, dconf, cli tools)
└── modules/
    ├── desktop/          — GNOME
    ├── services/         — pipewire, flatpak, docker, libvirtd, printing, fwupd
    └── system/           — locale, nix-settings, packages, users
```

## Usage

```bash
# Rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Update inputs
nix flake update

# Garbage collect (automatic: weekly, >14 days)
sudo nix-collect-garbage --delete-older-than 14d
```

## Notable packages

| Source | Packages |
|--------|----------|
| stable | tree, wget, fastfetch, corefonts, lazygit, obsidian, obs-studio, onlyoffice |
| unstable | vscode, opencode, brave |
| home-manager | bat, btop, yazi, firefox, editorconfig, direnv |

## Services

- GNOME (GDM) desktop
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Flatpak
- Docker, libvirtd
- fwupd

## System

- **State version:** 26.05
- **Boot:** systemd-boot (EFI)
- **Filesystem:** Btrfs (subvolumes /, /home, /nix)
- **Host:** QEMU/KVM guest
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia)
- **Timezone:** America/Bogota
- **Shell:** Zsh (oh-my-zsh, agnoster)
