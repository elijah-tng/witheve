{
  description = "Nix flake for the Eve programming language";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        eve = import ./eve.nix { inherit pkgs; };
      in {
        packages.eve = eve;
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.nodejs pkgs.yarn ];
        };
      }
    );
}
