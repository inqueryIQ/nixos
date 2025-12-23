# Light gaming and streaming setup for laptop
{ config, pkgs, ... }:

{
  # Steam with remote play only
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  # Just streaming
  };

  # Basic graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Streaming and light gaming packages
  environment.systemPackages = with pkgs; [
    # Streaming clients
    moonlight-qt  # NVIDIA GameStream / Sunshine client
    
    # Light gaming tools
    steam
    mangohud  # For monitoring when playing locally
    
    # Basic Vulkan support
    vulkan-tools
    vulkan-loader
  ];
}
