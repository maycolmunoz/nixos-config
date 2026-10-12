{ hostConfig, lib, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "ssh.github.com";
        User = "git";
        Port = 443;
        IdentityFile = "~/.ssh/id_ed25519_github_personal";
        IdentitiesOnly = true;
      };
    };
  };

  # Generate the personal key only if missing. Idempotent, runs on every activation.
  # The key lives outside the store and never enters the repo.
  home.activation.sshKeygen = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
    [ -f "$HOME/.ssh/id_ed25519_github_personal" ] || \
      ssh-keygen -q -t ed25519 -N "" -C "${hostConfig.email}" \
        -f "$HOME/.ssh/id_ed25519_github_personal"
  '';
}
