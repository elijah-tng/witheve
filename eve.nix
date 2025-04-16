{pkgs}: let
  # fixme we want this, or something like it (do it later)
  #    sha256 = "sha256-HOX3ojJ5VvHaf8eI9F4u9dDhV+yislEmy7ei0//U3hA=";
  eveSrc = ./.;

  yarnModules = pkgs.mkYarnModules {
    pname = "eve";
    version = "0.3-alpha";
    packageJSON = "${eveSrc}/package.json";
    yarnLock = "${eveSrc}/yarn.lock";
    yarnNix = ./yarn.nix;
  };
in
  pkgs.stdenv.mkDerivation {
    pname = "eve";
    version = "0.3-alpha.git-f680d331d827c7dfe3eaeb79a2a7ce86710d930b";
    src = eveSrc;
    buildInputs = [pkgs.nodejs pkgs.yarn];
    nativeBuildInputs = [yarnModules];

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  }
