{ stdenv, lib, autoreconfHook, xorg, libbsd, pkg-config, python310}:

stdenv.mkDerivation rec {
  name = "libxcb-errors-${version}";
  version = "0.0.0";

  buildInputs = [ autoreconfHook xorg.libxcb xorg.libXau xorg.libXdmcp libbsd xorg.utilmacros pkg-config python310 xorg.xcbproto ];

  src = ./.;

  meta = {
    description = "Allow XCB errors to print less opaquely";
    homepage = https://github.com/SimulaVR/libxcb-errors;
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
