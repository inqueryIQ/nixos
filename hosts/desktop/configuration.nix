# Desktop-specific configuration
{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "desktop";

  # Desktop-specific packages
  environment.systemPackages = with pkgs; [
    # Add any desktop-only packages here
  ];

  # You can add desktop-specific settings here
  # For example, if you have specific monitor configurations, etc.
}
