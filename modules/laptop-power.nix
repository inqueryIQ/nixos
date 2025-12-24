# Laptop power management and battery optimization
{ config, pkgs, ... }:

{
  # Enable TLP for better battery life
  services.tlp = {
    enable = true;
    settings = {
      # CPU settings
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      
      # CPU frequency scaling
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      
      # CPU boost
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      
      # Platform profiles
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      
      # USB autosuspend
      USB_AUTOSUSPEND = 1;
      
      # Battery charge thresholds (if supported)
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Enable powertop for power monitoring
  powerManagement.powertop.enable = true;

  # Enable thermald for thermal management
  services.thermald.enable = true;

  # Additional power-saving packages
  environment.systemPackages = with pkgs; [
    powertop
    acpi
  ];
}
