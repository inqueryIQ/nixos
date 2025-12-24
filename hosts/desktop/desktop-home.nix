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
      nrs = "sudo nixos-rebuild switch --flake /home/inquery/nixos-config#$(hostname)";
      nrs-test = "sudo nixos-rebuild test --flake /home/inquery/nixos-config#$(hostname)";
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Ian Querry";
    userEmail = "your.email@example.com";  # Update with your actual email
  };

  # Full MangoHud configuration for desktop gaming
  programs.mangohud = {
    enable = true;
    settings = {
      # Full overlay for gaming
      fps = true;
      frametime = true;
      cpu_stats = true;
      cpu_temp = true;
      gpu_stats = true;
      gpu_temp = true;
      ram = true;
      vram = true;
      position = "top-left";
      font_size = 24;

      # FPS limit options
      fps_limit = "0,144";  # Unlimited and 144 FPS cap toggle
      toggle_fps_limit = "Shift_R+F1";
    };
  };

  # Desktop-specific packages
  home.packages = with pkgs; [
    # Add any user-specific desktop packages here
  ];

  programs.home-manager.enable = true;
}
