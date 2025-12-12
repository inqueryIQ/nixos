{ config, pkgs, ... }:

{
  home.username = "inquery";
  home.homeDirectory = "/home/inquery";
  home.stateVersion = "25.11"; # Match your NixOS version

  # Packages for your user
  home.packages = with pkgs; [
    # Add user packages here
  ];

  # Git configuration example
  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "your.email@example.com";
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}