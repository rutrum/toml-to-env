{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    packages.x86_64-linux.default = self.packages.x86_64-linux.toml-to-env;

    packages.x86_64-linux.toml-to-env = pkgs.stdenv.mkDerivation {
      pname = "toml-to-env";
      version = "0.0.1";
      dontUnpack = true;
      buildInputs = with pkgs; [
        (python310.withPackages (ps: with ps; [ python310Packages.toml ]))
      ];
      installPhase = "install -D ${./toml-to-env.py} $out/bin/toml-to-env";
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        just
        (python310.withPackages (ps: with ps; [ python310Packages.toml ]))
      ];
    };
  };
}
