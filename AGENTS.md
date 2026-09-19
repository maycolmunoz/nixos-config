# NixOS flake config — /etc/nixos

## Build & apply

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

Home-manager is integrated as a NixOS module (not standalone). Changes to `home/mmunoz/` apply via the same command.

## Structure

| Path | Purpose |
|------|---------|
| `config.nix` | **Single source of truth**: username, email, hostname, locale, desktop, flake paths, feature flags |
| `flake.nix` | Entry point; imports `config.nix`, pins nixpkgs (nixos-unstable) + home-manager (master) + firefox-addons + zen-browser |
| `home-manager.nix` | Home-manager module config (`useGlobalPkgs`, user import, `backupFileExtension = "hm-backup"`) |
| `hosts/nixos/default.nix` | Host config; imports `modules/` + hardware.nix |
| `hosts/nixos/hardware.nix` | Auto-generated, do not edit |
| `home/mmunoz/` | Home-manager: `programs/` (zsh, starship, git, zen, ghostty, opencode/, fastfetch/, cli, dev, vscodium, apps), `desktop/` (gnome, gtk, fonts, cosmic) |
| `modules/desktop/` | Desktop selection (`default.nix`) + per-desktop dirs (`gnome/`, `cosmic/`) + shared `xserver.nix` |
| `modules/services/` | pipewire, printing, flatpak, fwupd, virtualisation (docker, libvirtd), ydotool, fstrim |
| `modules/system/` | boot, locale, nix-settings, users, swap, appimage |

## Notable patterns

- **Centralized config**: `config.nix` values reach every module (system + home) as `hostConfig` via `specialArgs`/`extraSpecialArgs`. Read `config.nix` before hardcoding user/host paths.
- **Feature flags**: `config.nix` → `features.*` controls which services are imported in `modules/default.nix`. Toggle services per host without touching module files.
- **Desktop selection**: `modules/desktop/default.nix` imports the active desktop. To switch, change `desktop` in `config.nix` and add the file under `home/mmunoz/desktop/`.
- **Theme**: each `home/mmunoz/desktop/{name}.nix` imports shared `desktop/gtk.nix` (GTK/icon/cursor); `desktop/gnome.nix` dconf only sets desktop-specific keys. `desktop/fonts.nix` stays global.
- **GNOME settings**: declare them in `gnome.nix` `dconf.settings` so home-manager enforces them on rebuild. Quote dashed keys: `"button-layout" = ":close";` (bare `button-layout` parses as subtraction).
- **Prompt**: `home/mmunoz/programs/starship.nix` (`programs.starship.settings` → `starship.toml`). No oh-my-zsh.
- **New modules**: add to `modules/default.nix` imports. New home modules add to `home/mmunoz/default.nix` imports.
- **Home programs** are a single `<name>.nix` file; use `<name>/default.nix` dir only when the program needs multiple files (e.g. `opencode/`). CLI tools with HM modules live in `programs/cli.nix`, GUI apps in `programs/apps.nix`, dev tooling in `programs/dev.nix`.

## Commands

- `update` (alias in zsh.nix) → rebuild + switch. `test` (`nh os test`) → safe trial activation. `diff` (`nh os build`) → build without activating.
- `nix fmt [<file>]` — format all (or one) Nix file(s). Formatter is `nixfmt-tree`.
- `nix flake update` — update all inputs.
- `cleanup` (alias) → `nh clean` GC (also runs weekly automatically).

## Verify

- Fast syntax check after edits: `nix-instantiate --parse <file>`.
- Full check without switching: `nh os build` (or the `diff` alias).

## Gotchas

- **New Nix files must be git-tracked** before rebuild: `git add <file>` — Nix refuses to evaluate untracked files.
- **File ownership**: `/etc/nixos` files must be owned by your user, not root: `sudo chown -R $USER:users /etc/nixos/`.
- **`nix fmt` reindents multiline `''` strings.** For whitespace-sensitive values (e.g. starship `format` with powerline separators), build the string via `+` concatenation instead.
- **Conflicting dotfiles don't fail the rebuild**: home-manager renames them with `.hm-backup` suffix.
- **Electron/Chromium apps (Brave, Obsidian, VSCodium) ignore GNOME `button-layout`** — they need per-app settings (system title bar / `window.titleBarStyle: native`).

## Conventions

- All Nix files use `{ ... }: { }` style with trailing semicolons.
- One module per file under `modules/{desktop,services,system}/`.
- Commit via conventional commits: `feat|fix|refactor|chore(scope): message`.

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
