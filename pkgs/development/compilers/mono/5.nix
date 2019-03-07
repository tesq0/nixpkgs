{ callPackage, Foundation, libobjc }:

callPackage ./generic.nix (rec {
  inherit Foundation libobjc;
  version = "5.18.0.268";
  sha256 = "135vn6k2gci2bd73danv24rbdrz94whjxyg2nxxf7wxjh8a0ivh4";
  enableParallelBuilding = false;
})
