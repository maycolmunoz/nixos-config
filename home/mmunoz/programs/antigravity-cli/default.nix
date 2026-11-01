{ ... }:
{
  programs.antigravity-cli = {
    enable = true;
    mutableSettings = true;

    mcpServers.nixos = {
      command = "mcp-nixos";
    };
  };
}
