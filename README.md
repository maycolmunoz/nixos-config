# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── config.nix                — single source of truth (user, host, locale, desktop, features, stateVersion)
├── flake.nix
├── home-manager.nix          — home-manager module config
├── hosts/nixos/              — host-specific (default.nix, hardware.nix)
├── home/mmunoz/              — home-manager
│   ├── default.nix           — user-level settings (xdg.mimeApps) + all home imports
│   ├── programs/             — program dirs (zsh/, git/, ghostty/, opencode/, fastfetch/, antigravity-cli/, cline/) + package bundles (cli.nix, dev.nix, apps.nix)
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
| `nix-edit` | open the flake in VS Code |
| `nix-update` | `nix flake update` then `update` |
| `fmt` | `nix fmt /etc/nixos` |
| `search` | `nix search nixpkgs` |
| `nix-unfree` | install a package allowing unfree (`NIXPKGS_ALLOW_UNFREE=1 nix profile add --impure`) |
| `sail` | run Laravel Sail (`./sail` or `vendor/bin/sail`) |

Manual equivalents:

```bash
# Rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Update flake inputs
nix flake update

# Garbage collect
nh clean all --keep 5
```

## Default applications

Declared with `xdg.mimeApps` in `home/mmunoz/default.nix`, which generates `~/.config/mimeapps.list` as a read-only symlink:

- `text/html`, `http`, `https`, `about`, `unknown` → Brave
- `application/pdf` → OnlyOffice

Changing defaults from GNOME Settings or from a browser does not persist; edit the config and rebuild. The terminal default comes from `xdg.terminal-exec` in `home/mmunoz/programs/ghostty/`.

## Services

- GNOME (GDM) desktop, with Shell extensions: clipboard-indicator, caffeine, tiling-shell, focus-timer, user-themes, workspaces-indicator
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Virtualisation (Docker + libvirtd + Spice USB)
- fwupd
- fstrim, ydotool, AppImage (binfmt)
- Flatpak: module exists (`modules/services/flatpak.nix`) but is disabled (`features.flatpak = false`)

## System

- **State version:** see `config.nix` (`stateVersion`)
- **Boot:** systemd-boot (EFI), 10-generation limit, `/tmp` cleaned on boot
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia), console keymap `la-latin1`, XKB `latam`
- **Timezone:** America/Bogota
- **Shell:** Zsh + oh-my-zsh (robbyrussell), autosuggestions, syntax highlighting
- **Network:** NetworkManager
- **Nix:** flakes + nix-command, unfree allowed, auto-optimise-store, weekly GC (`--delete-older-than 14d`)
- **Memory:** zram (zstd, 50%), no swap devices, swappiness 100, page-cluster 0