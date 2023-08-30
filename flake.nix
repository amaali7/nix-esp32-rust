{
  description = "Rust Enveronment for ESP32";

  inputs = {
    # NixPkgs (nixos-22.11)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    rust-overlay.url = "github:oxalica/rust-overlay";

  };

  outputs = { self, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem ["x86_64-linux" ] (system:
      let
        overlays = with inputs; [
          (self: super: { local = import ./buildtools { pkgs = super; }; })
          rust-overlay.overlays.default
        ];
        pkgs = import inputs.nixpkgs {
          inherit system overlays; config.allowUnfree = true;
        };
      in
      {
        devShells = {
          default = import ./shell.nix { inherit pkgs; };
          nightly = import ./nightly-shell.nix { inherit pkgs; };
        };
      }
    );
}
