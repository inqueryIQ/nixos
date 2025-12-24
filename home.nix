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
    userName = "Ian";
    userEmail = "inquery@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
  };
};

programs.ssh = {
  enable = true;
};

  programs.home-manager.enable = true;
}
