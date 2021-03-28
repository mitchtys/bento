#!/usr/bin/env sh
set -eux
_base=$(basename "$0")
_dir=$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P || exit 126)
export _base _dir

zypper --non-interactive --no-gpg-checks addrepo https://download.opensuse.org/repositories/Cloud:Tools/openSUSE_Leap_15.2/Cloud:Tools.repo
zypper --non-interactive --gpg-auto-import-keys refresh
zypper --non-interactive install cloud-init

systemctl enable cloud-init
