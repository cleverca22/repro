with import <nixpkgs> {};

let
  hp = haskell.packages.ghc802.override {
    overrides = self: super: {
      acid-state = self.callPackage ./acid-state.nix {};
      repro-ver1 = self.callCabal2nix "reproduce" ./version1 {};
    };
  };
in hp
