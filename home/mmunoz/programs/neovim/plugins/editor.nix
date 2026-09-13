{ config, ... }:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      lua
      nix
      javascript
      typescript
      tsx
      vue
      php
      html
      css
      json
      blade
    ];
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings.select = {
      enable = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
      };
    };
  };

  plugins.ts-autotag.enable = true;

  plugins.nvim-autopairs = {
    enable = true;
    settings.check_ts = true;
  };
}
