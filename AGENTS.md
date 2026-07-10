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
| `home/mmunoz/` | Home-manager: zsh, git, gnome (dconf + gtk) |
| `modules/desktop/` | Desktop selection (`default.nix`) + per-desktop dirs (`gnome/`) with system configs |
| `modules/services/` | pipewire, printing, flatpak, fwupd, virtualisation (docker, libvirtd) |
| `modules/programs/` | firefox |
| `modules/system/` | boot, locale, nix-settings, packages (stable + unstable), users |

## Notable patterns

- **Desktop selection**: `modules/desktop/default.nix` imports the active desktop. To switch desktops, change the import there and in `home/mmunoz/default.nix`.
- **Desktop structure**: Each desktop has its own dir under `modules/desktop/` with `default.nix` (system) and its home-manager config in `home/mmunoz/{name}.nix`.
- **Unstable packages**: imported inline in `modules/system/packages.nix` via `inputs.nixpkgs-unstable`. Add new unstable pkgs there by extending the `unstable` set.
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
