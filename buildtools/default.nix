{ pkgs, ... }:
with pkgs; {
  espflash = callPackage ./espflash { inherit pkgs; };
}

