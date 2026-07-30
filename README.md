# Phi Browser Homebrew tap

Official [Homebrew](https://brew.sh) tap for [Phi Browser](https://phibrowser.com/),
a Chromium-based macOS web browser with a built-in AI assistant.

| | Install |
|---|---|
| **Phi Browser** — the app | `brew install --cask phibrowser/tap/phi` |
| **phi-cli** — command-line automation for it | `brew install phibrowser/tap/phi-cli` |

## Install the browser

```sh
brew install --cask phibrowser/tap/phi
```

The two-step form is equivalent:

```sh
brew tap phibrowser/tap
brew install --cask phi
```

## Install the CLI

```sh
brew install phibrowser/tap/phi-cli
```

Installs the `phi` command (and `phibrowser` as an alias for it), which drives
a *running* Phi Browser over the app's authenticated CDP socket — open pages,
snapshot them with element refs, click and fill, manage Spaces and bookmarks:

```sh
phi open https://example.com
phi click @2
phi snapshot --diff
```

It is a client, not a browser: it needs the app installed (2.4.0 or newer) with
**Settings ▸ Developer ▸ Remote debugging ▸ "Allow agents to control Phi (CDP)"**
enabled. Depends on `node`. Source and docs:
<https://github.com/phibrowser/phibrowser-cli>.

## Update

Phi updates itself via Sparkle, so `brew upgrade` is not normally needed. To pin
the Homebrew metadata to the latest release anyway:

```sh
brew upgrade --cask phi
```

## Uninstall

```sh
brew uninstall --cask phi          # remove the app
brew uninstall --zap --cask phi    # also remove local data (caches, preferences)
```

## Requirements

- macOS 14 (Sonoma) or later.
- `phi-cli` additionally needs Node 22+ (pulled in by Homebrew as `node`) and
  Phi Browser 2.4.0+.

## Notes

The `phi` cask installs the same signed, Apple-notarized build distributed from
<https://phibrowser.com/>. The download URL and version are kept in sync with the
Sparkle appcast at `https://ota.phibrowser.com/mac-public/appcast/v2/PhiBrowserMacUpdate.xml`.

The `phi-cli` formula installs the published `@phibrowser/cli` npm tarball, so
`brew install phi-cli` and `npm install -g @phibrowser/cli` deliver identical
bytes.

## License

The tap's packaging metadata — the cask and formula definitions, the GitHub
Actions workflow, and the docs — is licensed under the [MIT License](LICENSE),
copyright Phinomenon Inc.

This license covers only the packaging metadata in this repository. The Phi
Browser application it installs is a separate, proprietary product, and the
"Phi" and "Phi Browser" names and logos are trademarks of Phinomenon Inc.
