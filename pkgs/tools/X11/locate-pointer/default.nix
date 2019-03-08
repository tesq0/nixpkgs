{ stdenv, gcc, cairo, libX11, fetchurl, pkg-config }:

stdenv.mkDerivation rec {

	name = "locate-pointer";

  src = fetchurl {
    url = "https://gist.githubusercontent.com/sneetsher/d6d35b6181aa70c27a85/raw/dd874ac535d511c675724fa30d9e12ba5b810c37/locate-pointer.c";
    sha256 = "98732d5523ebd598039ec4217b0bdd701cfcbdff87546f8d46ee00af3d6ce076";
  };
  
	unpackPhase = "true";

  buildInputs = [ cairo libX11 gcc pkg-config ];

  buildPhase = ''
    gcc `pkg-config --cflags x11 cairo` $src -o locate-pointer `pkg-config --libs x11 cairo` -lm
  '';

  installPhase = ''
    mkdir -p $out/bin
    chmod +x locate-pointer
    mv locate-pointer $out/bin
  '';

  meta = with stdenv.lib; {
    description = "Simple program to locate the mouse pointer";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = with maintainers; [ tesq0 ];
  };
  
}
