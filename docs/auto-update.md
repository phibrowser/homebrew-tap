# Cask auto-update

## Why

`Casks/phi.rb` pins two values that change on every release: `version` (e.g.
`1.5.1,609`) and `sha256`. Phi Browser ships new builds through its Sparkle
appcast at
`https://ota.phibrowser.com/mac-public/appcast/PhiBrowserMacUpdate.xml`. Keeping
the cask in sync by hand is easy to forget and tends to lag behind the actual
release, so `brew upgrade --cask phi` would hand users stale metadata.

The goal is zero-touch sync: a scheduled job watches the appcast and, whenever a
newer build appears, updates the cask, opens a PR, and auto-merges it to `main`.

## How

The workflow `.github/workflows/update-cask.yml` runs daily at 08:00 UTC (16:00
Beijing time; GitHub cron is always UTC) — and on manual `workflow_dispatch` — on
`macos-latest`: casks can only be linted/audited on macOS, and the runner already
ships `brew`, `gh`, `xmllint`, and `shasum`.

Steps:

1. **Resolve latest** — fetch the appcast, take the item with the highest
   `sparkle:version` (build number, order-independent) and its
   `sparkle:shortVersionString`. The cask version string is `<short>,<build>`.
2. **Compare** — read the current `version` line from `Casks/phi.rb`. If it
   already matches, the job exits cleanly without opening a PR (no empty churn).
3. **Compute sha256** — the appcast only carries a Sparkle EdDSA `edSignature`,
   **not** a sha256, so the job downloads the release zip (~311 MB) and runs
   `shasum -a 256` itself.
4. **Update** — `sed` rewrites only the `version` and `sha256` lines.
5. **Validate** — `brew style Casks/phi.rb` gates the merge. It runs in the same
   job *before* the PR is created, so a broken edit never reaches `main`.
6. **PR + auto-merge** — push an `autobump/phi-<version>` branch, `gh pr create`,
   then `gh pr merge --auto --squash --delete-branch`. Uses the default
   `GITHUB_TOKEN`; no PAT is required because the branch lives in this repo.

### Single source of truth for the download URL

The appcast enclosure URL is
`.../releases/Phi_<short>_<build>.zip`, identical to the cask's own
`url "...Phi_#{version.csv.first}_#{version.csv.second}.zip"` template. The
workflow therefore reconstructs the download URL from `<short>`/`<build>` instead
of parsing `<enclosure>`, keeping the cask template as the single source of truth.

## Required repository setting (one-time)

Before the first real update can merge, enable **Settings → General → Pull
Requests → Allow auto-merge**. Without it, `gh pr merge --auto` fails. Recommended
to also enable **Automatically delete head branches** (the workflow already passes
`--delete-branch` as a fallback).

## Open issues / not covered

- **`minimumSystemVersion` changes** — the appcast currently advertises `14.0`,
  matching the cask's `depends_on macos: :sonoma`. If a future release raises the
  minimum macOS version, the workflow will **not** update `depends_on`; it must be
  changed by hand. Resolve by parsing `sparkle:minimumSystemVersion` and mapping it
  to the Homebrew symbol if this ever becomes a recurring need.
- **Release URL naming** — the workflow assumes the
  `Phi_<short>_<build>.zip` naming scheme. If the release host changes its layout,
  both the cask `url` template and this workflow must be updated together.

## Verifying

Trigger the workflow manually from the Actions tab (`Run workflow`). On the
current latest version it should resolve the version, detect no change, and exit
without opening a PR. When a genuinely newer build is published, it should open and
auto-merge a PR bumping `version` + `sha256`.
