{ crossenv }:

crossenv.nixpkgs.stdenv.mkDerivation rec {
  name = "pdcurses-${version}-${crossenv.host}";

  version = "3.4";

  src = crossenv.nixpkgs.fetchurl {
    url = "mirror://sourceforge/pdcurses/PDCurses-${version}.tar.gz";
    sha256 = "0jz6l8552fnf1j542yhzifgknrdzrisxg158ks0l87g777a8zba6";
  };

  builder = ./builder.sh;

  buildInputs = [
    crossenv.gcc
    crossenv.binutils
  ];

  inherit (crossenv) host os;
}
