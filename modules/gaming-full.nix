# Full gaming configuration for desktop
{ config, pkgs, ... }:

{
  # Enable Steam with all features
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    # Additional Proton compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # GameMode configuration (full performance)
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";  # For AMD GPUs
      };
      cpu = {
        park_cores = "no";
        pin_policy = "prefer-physical";
      };
    };
  };

  # Full gaming packages for desktop
  environment.systemPackages = with pkgs; [
    # Gaming
    steam
    heroic
    mangohud
    gamescope
    protonup-qt
    
    # Wine
    wineWowPackages.staging
    winetricks
    protontricks
    
    # Vulkan support
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vkbasalt  # Post-processing layer
  ];
}
