{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  home.username = "inquery";
  home.homeDirectory = "/home/inquery";
  home.stateVersion = "25.11";

  # Enable DankMaterialShell
  programs.dankMaterialShell = {
    enable = true;
  };

  # Bash configuration with aliases
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/inquery/nixos-config#laptop";
      nrs-test = "sudo nixos-rebuild test --flake /home/inquery/nixos-config#laptop";
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Ian Querry";
    userEmail = "your.email@example.com";  # Update with your actual email
  };

  # Minimal MangoHud for laptop (if needed)
  programs.mangohud = {
    enable = true;
    settings = {
      # Minimal overlay for battery life
      fps = true;
      cpu_temp = true;
      gpu_temp = true;
      position = "top-right";
      font_size = 20;
    };
  };

  # Laptop-specific packages (lighter)
  home.packages = with pkgs; [
    # Add any user-specific laptop packages here
  ];

  programs.home-manager.enable = true;
}
