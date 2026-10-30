{ lib, pkgs, ... }:
{
  home.packages = [ pkgs.cline ];

  # Cline rewrites this file, so seed it once instead of symlinking into the store.
  home.activation.clineMcpSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -e "$HOME/.cline/data/settings/cline_mcp_settings.json" ]; then
      install -Dm644 ${./cline_mcp_settings.json} "$HOME/.cline/data/settings/cline_mcp_settings.json"
    fi
  '';
}
