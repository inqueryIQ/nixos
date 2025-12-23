# Laptop-specific configuration
{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "laptop";

  # Laptop-specific settings
  services.xserver.libinput.enable = true;  # Touchpad support

  # Laptop-specific packages
  environment.systemPackages = with pkgs; [
    # Add any laptop-only packages here
  ];

  # You can add laptop-specific settings here
}
