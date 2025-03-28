 {
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = { self, nixpkgs, nixos-hardware } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
	./configuration.nix 
 	nixos-hardware.nixosModules.framework-13-7040-amd
        #home-manager.nixosModules.home-manager
	#{
        #  home-manager.useGlobalPkgs = true;
        #  home-manager.useUserPackages = true;
        #  home-manager.users.jc = import ./home.nix;
        #} 
      ];
    };
  };
}
