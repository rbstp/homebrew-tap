# rbstp/homebrew-tap

Homebrew casks for my own projects.

| Cask | |
| --- | --- |
| [`heed`](https://github.com/rbstp/heed) | Focus follows mouse for macOS |

```sh
brew install --cask rbstp/tap/heed
```

`Casks/heed.rb` is generated: its `version` and `sha256` are committed here by the release workflow
in [rbstp/heed](https://github.com/rbstp/heed/blob/master/.github/workflows/release.yml) when a `v*`
tag is pushed. Editing those two lines by hand only invites the cask and the release disagreeing.

## Collie

The signed desktop downloads require Apple silicon and macOS 26 or newer.

```sh
brew install rbstp/tap/collied
collied-install --replace
brew install --cask rbstp/tap/colliebar
```

The explicit adoption command installs or updates the daemon at `~/.cargo/bin/collied` and preserves existing service arguments, state and user data. On first install, add `~/.cargo/bin` to PATH and run `collied setup`. After `brew upgrade collied`, run `collied-install --replace` again. Do not use `brew services`.

See the [desktop release guide](https://collie.rbstp.dev/reference/desktop-releases.html) for verification, service removal and app uninstall details.
