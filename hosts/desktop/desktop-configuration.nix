# Desktop-specific configuration
{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "desktop";

   services.xserver.enable = true;  # Keep for xwayland-satellite
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Desktop-specific packages
  environment.systemPackages = with pkgs; [
    # Add any desktop-only packages here
  ];
}
