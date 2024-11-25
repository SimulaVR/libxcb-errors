{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem =
        { pkgs, ... }:
        let
          libxcb-errors = pkgs.callPackage ./. { };
        in
        {
          checks = {
            inherit libxcb-errors;
          };

          packages = {
            inherit libxcb-errors;
            default = libxcb-errors;
          };
        };
    };
}
