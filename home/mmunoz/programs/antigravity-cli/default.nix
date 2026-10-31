{ ... }:
{
  programs.antigravity-cli = {
    enable = true;

    mcpServers.nixos = {
      command = "mcp-nixos";
    };
  };
}
