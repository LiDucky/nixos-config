{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.nina = {
    initialHashedPassword = "$y$j9T$RyUNOrCi5rGzZhMSj4Veo/$uTRuX7.xxi.cMlyvO8C.xSfkL3m.N1u.ChpvwsN8w1.";
    isNormalUser = true;
    description = "Nina Vroom";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    # openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDSozjLMbQ91RqPOtnO04OFio4PIC6nkgekbTK6e+5JV username@hostname"
    # ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.nina =
    import ../../../home/nina/${config.networking.hostName}.nix;
}