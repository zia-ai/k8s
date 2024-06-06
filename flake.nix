{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [
            (self: super: {
              # some-package = super.callPackage ./packages/some-package.nix { };
            })
          ];
        };
      in
      { 

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ 
            go
            go-jsonnet
          ];
        };
      });
}
