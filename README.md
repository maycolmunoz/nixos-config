# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── flake.nix
├── home-manager.nix          — home-manager module config
├── hosts/nixos/              — host-specific (default.nix, hardware.nix)
├── home/mmunoz/              — home-manager (zsh, git, gtk, ghostty, firefox, cli tools)
└── modules/
    ├── desktop/
    │   └── gnome/            — gnome (default.nix, packages.nix, xserver.nix)
    ├── services/             — pipewire, flatpak, docker, libvirtd, printing, fwupd, localsend
    └── system/               — locale, nix-settings, packages, users, boot
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

## Notable packages

| Source | Packages |
|--------|----------|
| stable | tree, wget, fastfetch, corefonts, lazygit, obsidian, obs-studio, onlyoffice, nixfmt |
| unstable | vscode, opencode, brave |
| home-manager | bat, btop, yazi, nerd-fonts.jetbrains-mono, firefox (module), ghostty (module) |

## Services

- GNOME (GDM) desktop
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Flatpak
- Docker, libvirtd (+ Spice USB redirection)
- fwupd
- LocalSend

## System

- **State version:** 26.05
- **Boot:** systemd-boot (EFI)
- **Filesystem:** Btrfs (subvolumes /, /home, /nix)
- **Host:** QEMU/KVM guest
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia)
- **Timezone:** America/Bogota
- **Shell:** Zsh (oh-my-zsh, agnoster)
