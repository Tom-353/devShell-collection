# Nix devShell collection

This is a nix flake containing some of my commonly used nix devShells.
I mostly use these with [nix-direnv](https://github.com/nix-community/nix-direnv).

## Included devShells

- C (for C and C++)
- rust
- [jaculus](https://jaculus.org/)

## Example usage

Open a nix development shell.
```sh
nix develop github:Tom-353/devShell-collection#C
```

Create a direnv `.envrc` file
```sh
echo 'use flake github:Tom-353/devShell-collection#C' > .envrc
direnv allow
```
