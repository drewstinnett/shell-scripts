#!/usr/bin/env bash

## Adapted from: https://github.com/charmbracelet/gum#tutorial

which gum &>/dev/null || { echo "gum not found. Please install gum. gum freakin rulez 🍬"; exit 1; }

## Add some styling here that's better with Solarized Light
TYPE=$(gum choose --item.foreground=136 --selected.foreground=166 --cursor.foreground=160 "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
SCOPE=$(gum input --placeholder "scope")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change")

# Commit these changes
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"