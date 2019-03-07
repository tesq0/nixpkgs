{ stdenv
, fetchFromGitHub
, tk
, makeWrapper
}:

stdenv.mkDerivation rec {

  name = "logcatch";
  version = "master";

  outputs = [ "out" ];

  src = fetchFromGitHub {
      owner = "pikey8706";
      repo = "LogCatch";
      rev = "master";
      sha256 = "0dddjhfilnx3j7f6rk3xv678qgx7nh82xy2b3cirp3hcar45w129";
  };

  buildInputs = [ makeWrapper ];

	dontBuild = true;
  
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/src
    cp -r $src/* $out/src
    chmod +x $out/src/runOnShell
    makeWrapper $out/src/runOnShell $out/bin/logcatch \
    --prefix PATH : "${tk}/bin"
  '';

  meta = with stdenv.lib; {
    description = "android adb logcat viewer for Linux/Mac/Windows";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = with maintainers; [ tesq0 ];
  };

}
