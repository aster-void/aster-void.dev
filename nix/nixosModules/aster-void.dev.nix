# flake-level args `pkgs.callPackage`
{self}:
# nixos-level args (module system)
{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types;
  cfg = config.services."aster-void.dev";
in {
  options = {
    services."aster-void.dev" = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
      port = mkOption {
        type = types.port;
        default = 3300;
      };
      package = mkOption {
        type = types.package;
        default = self.packages.${pkgs.system}.default;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    systemd.services."aster-void.dev" = {
      description = "Aster Void personal website";
      wantedBy = ["multi-user.target"];
      after = ["network.target"];

      environment = {
        PORT = toString cfg.port;
        NODE_ENV = "production";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = lib.getExe' cfg.package "aster-void.dev";
        Restart = "always";
        RestartSec = 5;

        # Working directory
        WorkingDirectory = "/var/lib/aster-void.dev";
        StateDirectory = "aster-void.dev";

        # Resource limits
        MemoryMax = "512M";
        CPUQuota = "50%";

        # Security Handling
        DynamicUser = true;
        NoNewPrivileges = true;
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
        PrivateDevices = true;
        ProtectHostname = true;
        ProtectClock = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        RestrictAddressFamilies = ["AF_UNIX" "AF_INET" "AF_INET6"];
        RestrictNamespaces = true;
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RemoveIPC = true;
      };
    };
  };
}
