# Full gaming setup for desktop
{ config, pkgs, ... }:

{
  # Steam with full features
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    
    # Additional Proton compatibility
    extraCompatPackages = with pkgs; [
      proton-ge-bin  # Community-enhanced Proton
    ];
  };

  # GameMode for performance optimization
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;  # Priority boost for games
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

  # Graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # Required for 32-bit games
  };

  # Performance-oriented CPU governor
  powerManagement.cpuFreqGovernor = "performance";

  # Gaming-specific packages
  environment.systemPackages = with pkgs; [
    # Game launchers
    heroic
    steam
    
    # Gaming tools
    gamescope
    mangohud
    
    # Wine and compatibility
    wineWowPackages.staging
    winetricks
    protontricks
    protonup-qt
    
    # Vulkan
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vkBasalt
  ];
}
