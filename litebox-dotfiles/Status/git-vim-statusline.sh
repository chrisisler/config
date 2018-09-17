#!/bin/bash

# Error if any subcommand fails.
set -e

# Import functions.
. "~/Code/Status/git.sh" --source-only

gitUnaddedChanges
gitAddedChanges
