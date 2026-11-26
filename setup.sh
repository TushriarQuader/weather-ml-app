#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y ansible

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ansible-playbook -c local -i "localhost," "${SCRIPT_DIR}/prodservconf.yaml"
