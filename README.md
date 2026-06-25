# Phi Browser Homebrew tap

Official [Homebrew](https://brew.sh) tap for [Phi Browser](https://phibrowser.com/),
a Chromium-based macOS web browser with a built-in AI assistant.

## Install

```sh
brew install --cask phibrowser/tap/phi
```

The two-step form is equivalent:

```sh
brew tap phibrowser/tap
brew install --cask phi
```

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

## Notes

This cask installs the same signed, Apple-notarized build distributed from
<https://phibrowser.com/>. The download URL and version are kept in sync with the
Sparkle appcast at `https://ota.phibrowser.com/mac-public/appcast/v2/PhiBrowserMacUpdate.xml`.

## License

The tap's packaging metadata — the cask definition, the GitHub Actions
workflow, and the docs — is licensed under the [MIT License](LICENSE),
copyright Phinomenon Inc.

This license covers only the packaging metadata in this repository. The Phi
Browser application it installs is a separate, proprietary product, and the
"Phi" and "Phi Browser" names and logos are trademarks of Phinomenon Inc.
