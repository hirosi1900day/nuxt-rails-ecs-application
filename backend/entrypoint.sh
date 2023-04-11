#!/bin/bash
set -e

# DBへの変更があった際反映
bundle exec rails db:create
bundle exec rails db:migrate


# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"