# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── config.nix                — single source of truth (user, host, locale, desktop, features, stateVersion)
├── flake.nix
├── home-manager.nix          — home-manager module config
├── hosts/nixos/              — host-specific (default.nix, hardware.nix)
├── home/mmunoz/              — home-manager
│   ├── programs/             — program dirs (zsh/, git/, ssh/, ghostty/, vscodium/, opencode/, fastfetch/) + package bundles (cli.nix, dev.nix, apps.nix)
│   └── desktop/              — gnome, gtk, fonts
└── modules/
    ├── default.nix           — central importer (uses feature flags)
    ├── desktop/              — desktop selection + per-desktop dirs (gnome/)
    ├── services/             — pipewire, ydotool, printing, flatpak, fwupd, virtualisation, fstrim
    └── system/               — boot, locale, nix-settings, users, swap, appimage
```

## Usage

All shell aliases live in `home/mmunoz/programs/zsh/default.nix`:

| Alias | Action |
|---|---|
| `update` | `nh os switch` — rebuild + activate |
| `test` | `nh os test` — trial activation |
| `diff` | `nh os build` — build without activating |
| `nix-gc` | `nh clean all --keep 5` (also automatic: weekly, >14d) |
| `nix-history` | list system generations |
| `nix-edit` | open the flake in Codium |
| `nix-update` | `nix flake update` then `update` |
| `fmt` | `nix fmt /etc/nixos` |

Manual equivalents:

```bash
# Rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Update flake inputs
nix flake update

# Garbage collect
nh clean all --keep 5
```

## Services

- GNOME (GDM) desktop
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Virtualisation (Docker + libvirtd + Spice USB)
- fwupd
- fstrim, zram, ydotool

## System

- **State version:** see `config.nix` (`stateVersion`)
- **Boot:** systemd-boot (EFI)
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia)
- **Timezone:** America/Bogota
- **Shell:** Zsh + oh-my-zsh (robbyrussell)