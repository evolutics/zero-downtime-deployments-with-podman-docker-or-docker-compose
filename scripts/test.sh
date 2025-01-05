#!/bin/bash

set -o errexit -o nounset -o pipefail

cd -- "$(dirname -- "$0")/.."

travel-kit

scripts/demo.sh docker caddy
scripts/demo.sh docker caddy/dynamic
scripts/demo.sh docker caddy/static
scripts/demo.sh docker haproxy
scripts/demo.sh docker nginx

scripts/demo.sh podman caddy
scripts/demo.sh podman caddy/dynamic
scripts/demo.sh podman caddy/static
scripts/demo.sh podman haproxy
scripts/demo.sh podman nginx
