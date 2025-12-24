# Gaming configuration for streaming (lighter for laptop)
{ config, pkgs, ... }:

{
  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    # Additional Proton compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # GameMode configuration (lighter for laptop)
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
      };
    };
  };

  # Streaming and gaming packages (lighter selection for laptop)
  environment.systemPackages = with pkgs; [
    # Gaming
    steam
    heroic
    mangohud
    gamescope
    
    # Wine
    wineWowPackages.staging
    winetricks
    protontricks
    
    # Vulkan support
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];
}
