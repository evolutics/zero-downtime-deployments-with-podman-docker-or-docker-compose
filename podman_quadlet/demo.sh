#!/bin/bash

set -o errexit -o nounset -o pipefail

ln --symbolic hi@.container ~/.config/containers/systemd/hi@A.container
systemctl --user daemon-reload

systemctl --user start reverse-proxy.service
systemctl --user start hi@A.service

echo 'Waiting until file "test.log" exists as trigger to switch from A to B.'
until [[ -f test.log ]]; do
  sleep 0.01s
done
sleep 2s

ln --symbolic hi@.container ~/.config/containers/systemd/hi@B.container
rm ~/.config/containers/systemd/hi@A.container
systemctl --user daemon-reload

systemctl --user start hi@B.service
sleep 2s
systemctl --user stop hi@A.service
