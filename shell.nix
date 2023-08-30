{ pkgs, ... }:
with pkgs;
stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    (rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" ];
      targets = [ "riscv32imc-unknown-none-elf" ];
    })

    # Add some extra dependencies from `pkgs`
    libgudev.dev
    udev.dev
    pkg-config
    stdenv
    local.espflash
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;
}

