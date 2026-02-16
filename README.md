# homebrew-tap

Homebrew tap for Rocky CLI tools.

## Install

```sh
brew tap i-rocky/tap
brew install dockerx
brew install caffeinate
```

## How updates work

This tap updates itself by scanning the latest GitHub release for:

- `i-rocky/dockerx`
- `i-rocky/caffeinate`

The updater workflow runs on a schedule and on manual dispatch, regenerates
`Formula/*.rb` from release assets and checksums, and commits changes.
