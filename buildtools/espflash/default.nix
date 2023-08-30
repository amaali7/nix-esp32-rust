{pkgs, stdenv, ...}:pkgs.rustPlatform.buildRustPackage rec {
  pname = "espflash";
  version = "v1.6.0";

  nativeBuildInputs = [

    # Example Build-time Additional Dependencies
    pkgs.pkg-config
  ];
  buildInputs = [ 
    #pkgs.pkg-config 
    pkgs.udev.dev 
  ];

  src = pkgs.fetchFromGitHub {
    owner = "esp-rs";
    repo = pname;
    rev = version;
    sha256 = "YQ621YbdEy2sS4uEYvgnQU1G9iW5SpWNObPH4BfyeF0=";
  };

  cargoSha256 = "7pKLbsVOezsvTmjA3E6Oa9aHYR8w/mb8U4Dymdy4zRs=";

  #meta = with stdenv.lib; {
    #description = "A fast line-oriented regex search tool, similar to ag and ack";
    #homepage = "https://github.com/BurntSushi/ripgrep";
    #license = licenses.unlicense;
    #maintainers = [ maintainers.tailhook ];
  #};
}

