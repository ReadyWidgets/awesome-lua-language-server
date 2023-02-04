#!/usr/bin/env bash

MODULE="$1"
DIR="$2"

cd "$DIR" || exit 1

echo "---@meta ${MODULE}"
echo
echo "---@class ${MODULE}"

for f in [A-Z]*.lua; do
	echo "---@field ${f%.lua} ${MODULE}.${f%.lua}"
done

echo
