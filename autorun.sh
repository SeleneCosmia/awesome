#!/usr/bin/env bash

run() {
  if ! pgrep -f "$1"; then
    "$@"&
  fi
}

run /usr/lib/polkit-kde-authentication-agent-1
run /usr/lib/xdg-desktop-portal-gtk
