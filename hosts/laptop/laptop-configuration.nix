# Laptop-specific configuration with MangoWC, Niri, and GNOME (safer testing setup)
{ config, pkgs, ... }:
{
  # Hostname
  networking.hostName = "laptop";

  # Enable MangoWC, Niri, AND keep GNOME for fallback
  programs.niri.enable = true;

  # Keep GDM and GNOME enabled as fallback
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;

  # Laptop-specific settings
  services.libinput.enable = true;  # Touchpad support (renamed option)

  # Laptop-specific packages
  environment.systemPackages = with pkgs; [
  ];
}
