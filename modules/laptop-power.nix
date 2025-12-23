# Power management and battery optimization for laptop
{ config, pkgs, ... }:

{
  # Disable GNOME's power-profiles-daemon (conflicts with TLP and auto-cpufreq)
  services.power-profiles-daemon.enable = false;

  # Auto CPU frequency management
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "powersave";
        turbo = "auto";
        scaling_min_freq = 1400000;  # Adjust based on your CPU
        scaling_max_freq = 3500000;  # Adjust based on your CPU
      };
    };
  };

  # Thermal management
  services.thermald.enable = true;

  # TLP for advanced power management
  services.tlp = {
    enable = true;
    settings = {
      # CPU settings
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      
      # Platform profile
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      
      # USB autosuspend
      USB_AUTOSUSPEND = 1;
      
      # Runtime power management
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
    };
  };

  # Power management packages
  environment.systemPackages = with pkgs; [
    powertop
    acpi
  ];
}
