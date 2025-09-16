{
  mkBunDerivation,
  lib,
  bun,
  bash,
}: let
  pname = "aster-void.dev";
in
  mkBunDerivation
  {
    src = ./.;
    bunNix = ./nix/bun.nix;
    packageJson = ./package.json;
    buildPhase = ''
      runHook preBuild
      bun run build
      runHook postBuild
    '';
    installPhase = ''
      mkdir -p "$out"
      rm -r "$out/build" "$out/node_modules" || true
      cp build node_modules "$out" -r

      install -Dm755 /dev/stdin "$out/bin/${pname}" <<EOF
      #!${lib.getExe bash}
      cd "$out/build"
      ${lib.getExe bun} start
      EOF
    '';
  }
