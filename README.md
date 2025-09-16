# aster-void.dev

## Usage

Access <https://aster-void.dev>

## Development

### Running Package

1. running locally

```sh
bun install
bun dev
```

2. running as a flake

```sh
nix run github:aster-void/aster-void.dev
```

3. install as a systemd service

```nix
# nixos configuration
{
  imports = [ inputs."aster-void.dev".nixosModules.default ];

  services."aster-void.dev" = {
    enable = true;
    port = 3000;
  };
}
```
