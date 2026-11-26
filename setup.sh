#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y ansible git

if [ ! -d /home/ubuntu/weather-ml-app/.git ]; then
  git clone https://github.com/TushriarQuader/weather-ml-app.git /home/ubuntu/weather-ml-app
fi

cd /home/ubuntu/weather-ml-app
git fetch origin main
git checkout main
git pull --ff-only origin main

ansible-playbook -c local -i "localhost," prodservconf.yaml
