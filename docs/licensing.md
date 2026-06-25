# Licensing

Added on 2026-06-25.

## Why

The repository shipped without any license declaration — no `LICENSE` file and
no mention in the README. With nothing stated, the default is "all rights
reserved", which is awkward for a Homebrew tap whose whole purpose is to be
tapped, installed, and forked by others.

## How

This is a Homebrew tap: it contains only packaging metadata (the `Casks/phi.rb`
cask definition, the `update-cask.yml` GitHub Actions workflow, and the docs),
not the application itself. It is licensed under the **MIT License**, copyright
**Phinomenon Inc.** (2026).

MIT was chosen over CC BY-NC-SA 4.0 (used for the Help Center's documentation
content) on purpose:

- CC licenses are not intended for software, and this repository is code and
  configuration, not prose content.
- A tap exists to be installed and forked; a NonCommercial term would work
  against that. The proprietary part is the Phi Browser app the cask points to,
  not the packaging metadata here.
- MIT is the conventional choice for Homebrew taps and matches the code license
  used in the Help Center repository.

The MIT license covers only the metadata in this repository. The Phi Browser
application remains a separate, proprietary product, and the "Phi" / "Phi
Browser" names and logos are trademarks of Phinomenon Inc. — noted in the
README rather than carved out in the license text, since the tap does not
redistribute those assets.

Files added/changed:

- `LICENSE` — the MIT License text.
- `README.md` — a `## License` section with the trademark / proprietary-app
  note.

## Open issues

None.
