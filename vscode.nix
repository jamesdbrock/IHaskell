{nixpkgs ? import <nixpkgs> {}}:

  # nixpkgs-2105 = import (builtins.fetchTarball {
  #   name = "nixpkgs-21.05";
  #   url = "https://github.com/NixOS/nixpkgs/archive/7e9b0dff974c89e070da1ad85713ff3c20b0ca97.tar.gz";
  # }) {};

  # nixpkgs-2009 = import (builtins.fetchTarball {
  #   name = "nixpkgs-20.09";
  #   url = "https://github.com/NixOS/nixpkgs/archive/cd63096d6d887d689543a0b97743d28995bc9bc3.tar.gz";
  # }) {};


nixpkgs.mkShell {
  # buildInputs = [
  nativeBuildInputs = [
    # nixpkgs.cabal-install # for cabal-install
    # nixpkgs.haskell.compiler.ghc8104
    # nixpkgs.haskell.compiler.ghc884
    # nixpkgs.haskell.compiler.ghc901
    # nixpkgs.haskell-language-server

    nixpkgs.blas
    nixpkgs.cairo
    nixpkgs.file
    nixpkgs.gcc
    nixpkgs.gfortran.cc.lib
    nixpkgs.liblapack
    nixpkgs.ncurses
    nixpkgs.pango
    nixpkgs.pkgconfig
    nixpkgs.zeromq
    nixpkgs.zlib
    nixpkgs.graphviz
    nixpkgs.gmp

  ];
  # shellHook = ''
  #   source ${nixpkgs.cabal-install}/share/bash-completion/completions/cabal
  # '';
}

# let
#   release = import ./release.nix { compiler = "ghc8104";
#     # packages = haskellPackages: with haskellPackages; [
#     #   ihaskell-widgets
#     #   ihaskell-charts
#     # ];
#     # # systemPackages = pkgs: with pkgs; [cabal-install];
#     # pythonPackages = pkgs: with pkgs; [ipywidgets];
#     };
# 
# in
# 
#   release.nixpkgs.mkShell {
#     buildInputs = [
#       # release # for ihaskell-lab, et cetera
#       # release.passthru.ihaskellEnv # for ghc
#       release.passthru.nixpkgs.cabal-install # for cabal-install
#       release.passthru.nixpkgs.haskell.compiler.ghc8104
#       release.passthru.nixpkgs.haskell-language-server
# 
# 
#     ];
#   }
