{
  description = "NixOS configuration with niri, DankMaterialShell and home-manager - Multi-host setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # DankMaterialShell
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, dms, ... }: {
    nixosConfigurations = {
      # Desktop - Full gaming rig with dual 1440p monitors
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/desktop-configuration.nix
          ./hosts/desktop/hardware-configuration.nix
          ./modules/common.nix           # Shared settings
          ./modules/gaming-full.nix      # Full gaming setup


          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.inquery = import ./hosts/desktop/desktop-home.nix;
          }
        ];
      };

      # Laptop - Streaming and light gaming
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/laptop-configuration.nix
          ./hosts/laptop/hardware-configuration.nix
          ./modules/common.nix              # Shared settings
          ./modules/gaming-streaming.nix    # Streaming only
          # ./modules/laptop-power.nix  # Disabled - conflicts with GNOME        # Battery optimization

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.inquery = import ./hosts/laptop/laptop-home.nix;
          }
        ];
      };
    };
  };
}
