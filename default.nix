{mkBunDerivation}: let
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
      #!/usr/bin/env bash
      cd "$out/build"
      bun start
      EOF
    '';
  }
