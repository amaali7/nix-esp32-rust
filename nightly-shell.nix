{ pkgs, ... }:
with pkgs;
stdenv.mkDerivation {
  name = "esp32-rust-env";
  buildInputs = [
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      extensions = [ "rust-src" "llvm-tools-preview" ];
      targets = [ "riscv32imc-unknown-none-elf" ];
    }))

    # Add some extra dependencies from `pkgs`
    libgudev.dev
    udev.dev
    pkg-config
    stdenv
    local.espflash
    cargo-binutils
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;
}
