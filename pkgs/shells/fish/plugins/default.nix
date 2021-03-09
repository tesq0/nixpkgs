{ lib, newScope }:

lib.makeScope newScope (self: with self; {

  buildFishPlugin = callPackage ./build-fish-plugin.nix { };

  clownfish = callPackage ./clownfish.nix { };

  fishtape = callPackage ./fishtape.nix { };

  foreign-env = callPackage ./foreign-env { };

  pure = callPackage ./pure.nix { };

})
