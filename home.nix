{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/inquery/nixos-config#";
    };
  };

  home.username = "inquery";
  home.homeDirectory = "/home/inquery";
  home.stateVersion = "25.11";

  # Enable DankMaterialShell
  programs.dankMaterialShell = {
    enable = true;
    # Optional: customize settings
    # settings = {
    #   # Your custom settings here
    # };
  };

  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "your.email@example.com";
  };

  programs.home-manager.enable = true;
}
