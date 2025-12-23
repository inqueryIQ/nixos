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
      nrs = "sudo nixos-rebuild switch --flake /home/inquery/nixos-config#desktop";
      nrs-test = "sudo nixos-rebuild test --flake /home/inquery/nixos-config#desktop";
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Ian Querry";
    userEmail = "your.email@example.com";  # Update with your actual email
  };

  # MangoHud configuration for desktop
  programs.mangohud = {
    enable = true;
    settings = {
      fps_limit = 0;
      vsync = 0;
      
      # Display settings
      position = "top-left";
      font_size = 24;
      
      # What to show
      fps = true;
      frametime = true;
      cpu_temp = true;
      gpu_temp = true;
      cpu_stats = true;
      gpu_stats = true;
      ram = true;
      vram = true;
    };
  };

  # Desktop-specific packages
  home.packages = with pkgs; [
    # Add any user-specific desktop packages here
    obs-studio  # Streaming/recording
  ];

  programs.home-manager.enable = true;
}
