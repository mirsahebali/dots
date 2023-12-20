#! /usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ghcup install ghc cabal stack hls
