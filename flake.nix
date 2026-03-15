{
  description = "A Flake For Skyrim Accessibility Mod By Dio Kyrie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          system = system;
          config.allowUnfree = true;
          config.microsoftVisualStudioLicenseAccepted = true;
        };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "SkyrimAccessibility";
          version = "0.8.0";
          # Local source code (no external files needed)
          src = ./.;
          buildPhase = ''
            xmake f -p mingw --arch=x86_64 --toolchain=clang-cl --sdk="$(which clang-cl)" --ldflags="-fuse-ld=lld"
            xmake build
          '';
          installPhase = ''
          '';
          nativeBuildInputs = with pkgs; [
          xmake # Build tool.
          windows.sdk #Provides mvsc sdk and windows crt for cross compiling.
          llvmPackages.clang-unwrapped
          llvmPackages.bintools-unwrapped
          ];
        };
        # Development shell with tools for hacking on the package
        # Enter with `nix develop`
        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.default ];
          shellHook = ''
            export PS1="$PS1[nix develop]:"
            echo "Welcome to the dev shell."
            echo "Build the package with: nix build .#"
          '';
        };
      });
}
