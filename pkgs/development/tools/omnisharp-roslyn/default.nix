{ stdenv
, fetchurl
, mono
, makeWrapper
}:

stdenv.mkDerivation rec {

  name = "omnisharp-roslyn-${version}";
  version = "1.32.7";

  outputs = [ "out" ];

  src = fetchurl {
    url = "https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${version}/omnisharp-mono.tar.gz";
    sha256 = "1fsgjvmfzj69jn8rmkbn7ci6c46r396hl1snlrsx5pm6zy8n3wh0";
  };

  buildInputs = [ makeWrapper ];

  preUnpack = ''
    mkdir src
    cd src
    sourceRoot=.
  '';

  installPhase = ''
    mkdir -p $out/bin
    cd ..
		cp -r src $out/
    ls -al $out/src
    makeWrapper ${mono}/bin/mono $out/bin/omnisharp \
    --add-flags "$out/src/OmniSharp.exe"
  '';

  meta = with stdenv.lib; {
    description = "OmniSharp based on roslyn workspaces";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = with maintainers; [ tesq0 ];
  };

}
