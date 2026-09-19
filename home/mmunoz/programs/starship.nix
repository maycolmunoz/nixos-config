{ ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Segmentos concatenados (el preset usa `\` + salto de línea, que TOML
      # elimina; aquí el equivalente sin saltos para que `nix fmt` no lo rompa)
      format =
        "[](#9A348E)"
        + "$username"
        + "[](bg:#DA627D fg:#9A348E)"
        + "$directory"
        + "[](fg:#DA627D bg:#FCA17D)"
        + "$git_branch"
        + "$git_status"
        + "[](fg:#FCA17D bg:#B8E0D2)"
        + "$nix_shell"
        + "[](fg:#B8E0D2 bg:#86BBD8)"
        + "$nodejs"
        + "$php"
        + "$python"
        + "[](fg:#86BBD8 bg:#06969A)"
        + "$docker_context"
        + "[](fg:#06969A bg:#33658A)"
        + "$time"
        + "[ ](fg:#33658A)";
      right_format = "$cmd_duration";
      username = {
        show_always = true;
        style_user = "bg:#9A348E";
        style_root = "bg:#9A348E";
        format = "[$user ]($style)";
        disabled = false;
      };
      os = {
        style = "bg:#9A348E";
        disabled = true;
      };
      directory = {
        style = "bg:#DA627D";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };
      };
      git_branch = {
        symbol = "";
        style = "bg:#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "bg:#FCA17D";
        format = "[$all_status$ahead_behind ]($style)";
      };
      nix_shell = {
        symbol = "❄️ ";
        impure_msg = "impure";
        pure_msg = "pure";
        style = "bg:#B8E0D2";
        format = "[ $symbol$state ]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      php = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      python = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#33658A";
        format = "[ ♥ $time ]($style)";
      };
      cmd_duration = {
        min_time = 2000;
        style = "bold yellow";
        format = "took [$duration]($style)";
      };
    };
  };
}
