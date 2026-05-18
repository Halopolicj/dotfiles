{
  inputs = {
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ...}@inputs: {
    nixosConfigurations.Halopolicj = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
	inputs.stylix.nixosMoules.stylix
      ];
    };
  };
}
