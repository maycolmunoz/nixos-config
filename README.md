# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── config.nix                — single source of truth (user, host, locale, desktop, features, stateVersion)
├── flake.nix
├── home-manager.nix          — home-manager module config
├── hosts/nixos/              — host-specific (default.nix, hardware.nix)
├── home/mmunoz/              — home-manager
│   ├── programs/             — zsh, git, firefox, ghostty, neovim, vscodium, opencode, fastfetch, cli, dev
│   ├── desktop/              — gnome, gtk, fonts, cosmic
│   └── apps/                 — gui apps
└── modules/
    ├── default.nix           — central importer (uses feature flags)
    ├── desktop/              — desktop selection + per-desktop dirs (gnome/, cosmic/)
    ├── services/             — pipewire, ydotool, printing, flatpak, fwupd, virtualisation
    └── system/               — boot, locale, nix-settings, users, swap, appimage
```

## Usage

```bash
# Rebuild
update

# Update inputs
nix flake update && update

# Garbage collect (automatic: weekly, >14 days)
cleanup
```

## Services

- GNOME (GDM) desktop
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Flatpak
- Virtualisation (Docker + libvirtd + Spice USB)
- fwupd

## System

- **State version:** see `config.nix` (`stateVersion`)
- **Boot:** systemd-boot (EFI)
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia)
- **Timezone:** America/Bogota
- **Shell:** Zsh (oh-my-zsh, agnoster)