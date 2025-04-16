{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "eve";
  version = "0.3-alpha";

  src = pkgs.fetchFromGitHub {
    owner = "witheve";
    repo = "Eve";
    rev = "f680d331d827c7dfe3eaeb79a2a7ce86710d930b";
    sha256 = "sha256-HOX3ojJ5VvHaf8eI9F4u9dDhV+yislEmy7ei0//U3hA=";
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
