let
  release = import ./release.nix { compiler = "ghc8104";
    packages = haskellPackages: with haskellPackages; [
      ihaskell-widgets
      ihaskell-charts
    ];
    # systemPackages = pkgs: with pkgs; [cabal-install];
    pythonPackages = pkgs: with pkgs; [ipywidgets];
    };

in

  release.nixpkgs.mkShell {
    buildInputs = [
      release # for ihaskell-lab, et cetera
      # release.passthru.ihaskellEnv # for ghc
      # release.passthru.nixpkgs.cabal-install # for cabal-install
      # release.passthru.haskellPackages.ihaskell-widgets.env # "ghc-shell-for-ihaskell-widgets" It provides ghc, but not cabal, and not ihaskell-widgets. It sets some environment variables like NIX_GHC.
    ];
    shellHook = ''
      echo 'Run'
      echo '  ihaskell-lab ihaskell-display/ihaskell-widgets/Examples'
      echo ""
    '';
  }

# Why is it that this recompiles ihaskell-widgets every time unless I first
# nix-build release-8.10.nix --arg packages "haskellPackages: [ haskellPackages.ihaskell-widgets ]"

# The ihaskell-lab command first runs 'ihaskell install' and then runs 'jupter lab'.

# release.passthru.haskellPackages.ihaskell-aeson          release.passthru.haskellPackages.ihaskell-inline-r
# release.passthru.haskellPackages.ihaskell-basic          release.passthru.haskellPackages.ihaskell-juicypixels
# release.passthru.haskellPackages.ihaskell-blaze          release.passthru.haskellPackages.ihaskell-magic
# release.passthru.haskellPackages.ihaskell-charts         release.passthru.haskellPackages.ihaskell-parsec
# release.passthru.haskellPackages.ihaskell-diagrams       release.passthru.haskellPackages.ihaskell-plot
# release.passthru.haskellPackages.ihaskell-display        release.passthru.haskellPackages.ihaskell-rlangqq
# release.passthru.haskellPackages.ihaskell-gnuplot        release.passthru.haskellPackages.ihaskell-static-canvas
# release.passthru.haskellPackages.ihaskell-graphviz       release.passthru.haskellPackages.ihaskell-widgets
# release.passthru.haskellPackages.ihaskell-hatex
# release.passthru.haskellPackages.ihaskell-hvega

