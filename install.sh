#!/bin/sh
ln -s .Brewfile ~/.Brewfile
brew bundle
npm install -g @anthropic-ai/claude-code
