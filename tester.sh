#!/usr/bin/env bash
# shellcheck ignore=SC2048

trigger="$(Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome)"

pull_the() {
  watchexec --watch "rc.lua" $trigger
}
