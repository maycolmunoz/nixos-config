# NixOS flake config — /etc/nixos

## Build & apply

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

Home-manager is integrated as a NixOS module (not standalone). Changes to `home/mmunoz/` apply via the same command.

## Structure

| Path | Purpose |
|------|---------|
| `flake.nix` | Entry point; pins nixpkgs (26.05) + home-manager (release-26.05) + nixpkgs-unstable |
| `hosts/nixos/default.nix` | Host config; imports `modules/` + hardware.nix |
| `hosts/nixos/hardware.nix` | Auto-generated, do not edit |
| `home/mmunoz/` | Home-manager: zsh, dconf, gtk |
| `modules/desktop/` | gnome.nix (GDM, GNOME packages, extensions) |
| `modules/services/` | pipewire, printing, flatpak, fwupd, virtualisation (docker, libvirtd) |
| `modules/programs/` | firefox, zsh (system-level enable) |
| `modules/system/` | locale, nix-settings, packages (stable + unstable), users |

## Notable patterns

- **Unstable packages**: imported inline in `modules/system/packages.nix` via `inputs.nixpkgs-unstable`. Add new unstable pkgs there by extending the `unstable` set.
- **Excluded GNOME apps**: listed in `modules/desktop/gnome.nix` under `environment.gnome.excludePackages`.
- **GNOME settings (dconf)**: in `home/mmunoz/dconf.nix`, not system-level.
- **Theme**: GTK/icon/cursor declared in both `home/mmunoz/gtk.nix` (home-manager) and `home/mmunoz/dconf.nix` (dconf). Both must match.
- **New modules**: add to `modules/default.nix` imports. New home modules add to `home/mmunoz/default.nix` imports.

## Commands

- `update` (alias in zsh.nix) → rebuild
- `nix flake update` — update all inputs
- `sudo nix-collect-garbage --delete-older-than 14d` — GC (runs automatically weekly)
- `result/` is gitignored

## Conventions

- All Nix files use `{ ... }: { }` style with trailing semicolons.
- One module per file under `modules/{desktop,programs,services,system}/`.
- Commit via conventional commits: `feat|fix|refactor|chore(scope): message`.
