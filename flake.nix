{
	description = "NixOS Machine Configuration";

	inputs = {
		nix-flake-tests.url = "github:antifuchs/nix-flake-tests";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = {
 		self,
		nixpkgs,
		flake-utils,
		nix-flake-tests,
	}: flake-utils.lib.eachDefaultSystem (system: let
		pkgs = nixpkgs.legacyPackages.${system};
	in {

 		# TODO: nixos system

   		# TODO: home-manager

  		# TODO: system-manager (probably need to ditch flake-utils)

 		# Flake tests.
		checks = {
			unit = nix-flake-tests.lib.check {
				inherit pkgs;
				tests = {
					placeholder = { expected = 1; expr = 1; };
				};
			};
		};
  
	});
}
