{ ... }:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      "fzf-native".enable = true;
      "ui-select".enable = true;
    };
    settings.defaults.file_ignore_patterns = [
      "node_modules"
      "^.git/"
    ];
  };
}
