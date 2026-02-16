# homebrew-tap

Homebrew tap for Rocky CLI tools.

## Install

```sh
brew tap i-rocky/tap
brew install dockerx
```

## How updates work

This tap updates itself by scanning the latest GitHub release for:

- `i-rocky/dockerx`

The updater workflow runs on a schedule and on manual dispatch, regenerates
`Formula/dockerx.rb` from release assets and checksums, and commits changes.
