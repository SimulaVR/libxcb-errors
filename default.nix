{
  stdenv,
  lib,
  autoreconfHook,
  xorg,
  libbsd,
  pkg-config,
  python310,
}:

stdenv.mkDerivation rec {
  pname = "libxcb-errors";
  version = "0.0.0";

  src = ./.;

  nativeBuildInputs = [
    pkg-config
    python310
    autoreconfHook
  ];

  buildInputs = [
    xorg.libxcb
    xorg.libXau
    xorg.libXdmcp
    libbsd
    xorg.utilmacros
    xorg.xcbproto
  ];

  meta = {
    description = "Allow XCB errors to print less opaquely";
    homepage = "https://github.com/SimulaVR/libxcb-errors";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
