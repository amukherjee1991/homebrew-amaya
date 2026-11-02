# homebrew-amaya

Homebrew tap for [Amaya Browser](https://github.com/amukherjee1991/amaya-browser), a
privacy-first browser built on Firefox's Gecko engine.

```sh
brew install --cask amukherjee1991/amaya/amaya
```

or

```sh
brew tap amukherjee1991/amaya
brew install --cask amaya
```

## Status

Apple Silicon (arm64) only, **unsigned preview build** — no Apple Developer ID
yet, so macOS Gatekeeper blocks it until you clear the quarantine flag once
(the cask prints the exact command after install). Intel support and a
signed, notarized build are next; see
[docs/PLATFORMS_PLAN.md](https://github.com/amukherjee1991/amaya-browser/blob/main/docs/PLATFORMS_PLAN.md)
in the browser repo.
