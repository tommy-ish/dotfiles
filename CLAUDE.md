# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is Tomohiro Ishii's personal dotfiles repository, managed entirely through
[mise](https://mise.jdx.dev)'s dotfiles/bootstrap feature. There is no build, lint, or test
tooling — the repo just holds config files and a manifest telling `mise` how to symlink them
into place and which packages to install.

## Structure

- `mise/config.toml` — the single source of truth. It has three sections:
  - `[bootstrap.packages]` — Homebrew packages/casks to install (`brew:*`, `brew-cask:*`), pinned
    to `"latest"`.
  - `[bootstrap.repos]` — repos to clone on a fresh machine, keyed by destination path, with
    `url`/`ref`.
  - `[dotfiles]` — maps destination paths (e.g. `~/.gitconfig`) to their source file in this repo
    (e.g. `~/src/dotfiles/.gitconfig`). This is how `mise` symlinks repo files into the home
    directory.
- `.gitconfig` — the actual dotfile content that gets linked to `~/.gitconfig`.

When adding a new dotfile, the pattern is: add the real file to the repo, then add a
corresponding `"~/.destination" = "~/src/dotfiles/source"` entry under `[dotfiles]` in
`mise/config.toml`.

## Applying changes

Changes to this repo take effect on the machine via `mise`'s dotfiles sync (not a build step in
this repo itself). There is no local command to "run" or "test" this repository beyond letting
`mise` re-link/install per `mise/config.toml`.
