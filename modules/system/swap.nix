{ ... }: {
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
      priority = -2;
    }
  ];

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  systemd.oomd.enable = true;
}
