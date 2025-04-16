{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "eve";
  version = "0.3-alpha";

  src = pkgs.fetchFromGitHub {
    owner = "witheve";
    repo = "Eve";
    rev = "f2b7f1c4d9c1c6c6e3c2b9e8e0b9e6b0e2c4c4c4"; # Replace with latest commit or tag
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with actual hash
  };

  buildInputs = [ pkgs.nodejs pkgs.yarn ];

  buildPhase = ''
    yarn install --frozen-lockfile
  '';

  installPhase = ''
    mkdir -p $out
    cp -r . $out/
  '';

  meta = with pkgs.lib; {
    description = "Eve programming language (v0.3 alpha)";
    homepage = "https://github.com/witheve/Eve";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
  };
}
