#!/bin/bash

sh -c "$(curl -fsLS https://get.chezmoi.io/)" -- -b $HOME/bin init --apply rowanmanning
