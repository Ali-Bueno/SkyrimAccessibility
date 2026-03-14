{
  description = "A Flake For Skyrim Accessibility Mod By Dio Kyrie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # The package built with mkDerivation
        packages.default = pkgs.stdenv.mkDerivation {
          name = "hello-from-flake";
          version = "0.1.0";

          # Inline the source code (no external files needed)
          #src =

          buildPhase = ''
            xmake build
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp hello $out/bin/
          '';

          # Build dependencies
          nativeBuildInputs = with pkgs; [ xmake git];
        };

        # Development shell with tools for hacking on the package
        # Enter with `nix develop`
        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.default ];

          # Additional development tools
          packages = with pkgs; [

          ];

          shellHook = ''
            export PS1="$PS1[nix develop]:"
            echo "Welcome to the dev shell."
            echo "Build the package with: nix build .#"
          '';
        };
      });
}
