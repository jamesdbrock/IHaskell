# { compiler ? "ghc8104"
# , jupyterlabAppDir ? null
# , nixpkgs ? import <nixpkgs> {}
# , packages ? (_: [])
# , pythonPackages ? (_: [])
# , rtsopts ? "-M3g -N2"
# , systemPackages ? (_: [])
# }:

# (
#   import ./release-8.10.nix
# { packages = (
#   pkgs: with pkgs;
#   [ cairo
#     diagrams-cairo
#     diagrams-contrib
#     static-canvas
#   ]
#   );
# 
# }
# ).passthru.shell

let

  nixpkgs-2105 = import (builtins.fetchTarball {
    name = "nixpkgs-21.05";
    url = "https://github.com/NixOS/nixpkgs/archive/7e9b0dff974c89e070da1ad85713ff3c20b0ca97.tar.gz";
  }) {};

  nixpkgs-2009 = import (builtins.fetchTarball {
    name = "nixpkgs-20.09";
    url = "https://github.com/NixOS/nixpkgs/archive/cd63096d6d887d689543a0b97743d28995bc9bc3.tar.gz";
  }) {};

  nixpkgs = nixpkgs-2105;

  systemPackages = (pkgs: with pkgs;
    [ file
      blas
      lapack
    ]);

  release = import ./release-8.10.nix
    { inherit nixpkgs;
      packages = ( pkgs: with pkgs;
        [ cabal-install
          haskell-language-server
          cairo
          diagrams-cairo
          diagrams-contrib
          static-canvas
          singletons
        ]);
      inherit systemPackages;
    };
in
nixpkgs.mkShell {
  #NIXPKGS_ALLOW_BROKEN=1;
  # allowBroken = true;
  # buildInputs = [ihaskellEnv jupyterlab];
  buildInputs = with release.passthru;
    [ ihaskellEnv
      jupyterlab
      # haskellPackages.ihaskell
    ] ++ (systemPackages nixpkgs);
}

# NIXPKGS_ALLOW_BROKEN=1 nix-shell shell-8.10.nix
# static-canvas 0.2.0.3 is marked broken in nixpkgs-21.05

# hie.yaml cradle not working for:
# * ihaskell-display/ihaskell-graphviz
# * ihaskell-display/ihaskell-rlangqq

# why systemPackages required here?

# needs to build all of ihaskell to enter the shell, that's bad.

# cabal v2-run ihaskell -- install

# cabal v2-build ihaskell-widgets
# But then there is no way to provide ihaskell-widgets to the package database
# of the running ihaskell Kernel.
