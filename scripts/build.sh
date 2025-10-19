#!/usr/bin/env bash
set -euo pipefail
# Convenience wrapper if you dislike Makefiles.
: "${JEMDOC:=vendor/jemdoc/jemdoc.py}"
python3 "$JEMDOC" -c src/mysite.conf -o . src/index.jemdoc src/about.jemdoc
