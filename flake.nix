{
  description = "Some simpe development shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux = {
        C = pkgs.mkShell {
          packages = with pkgs; [gcc gdb valgrind];
        };
        jaculus = pkgs.mkShell {
          packages = [
            (pkgs.callPackage ./jaculus-tools.nix {})
          ];
        };
        rust = pkgs.mkShell {
          packages = [
            pkgs.cmake
            pkgs.rustc
            pkgs.cargo
          ];
        };
      };
    };
}
