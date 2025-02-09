{ lib
, stdenv
, fetchFromGitHub
, installShellFiles
, zigHook
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "linuxwave";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "linuxwave";
    rev = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-5c8h9bAe3Qv7PJ3PPcwMJYKPlWsmnqshe6vLIgtdDiQ=";
  };

  nativeBuildInputs = [
    installShellFiles
    zigHook
  ];

  postInstall = ''
    installManPage man/linuxwave.1
  '';

  meta = {
    homepage = "https://github.com/orhun/linuxwave";
    description = "Generate music from the entropy of Linux";
    changelog = "https://github.com/orhun/linuxwave/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ figsoda ];
    inherit (zigHook.meta) platforms;
  };
})
