# Build jemdoc pages to the repo root for GitHub Pages user sites.
# Usage:
#   export JEMDOC=vendor/jemdoc/jemdoc.py
#   make
#
# Change PAGES to include all your .jemdoc pages (without extension).

SHELL := /bin/bash

JEMDOC ?= vendor/jemdoc/jemdoc.py
SRC    := src
OUT    := .

# List pages without extension; they must exist in $(SRC)/
PAGES  := index about

all: $(PAGES:%=$(OUT)/%.html)

$(OUT)/%.html: $(SRC)/%.jemdoc $(SRC)/mysite.conf $(SRC)/menu.conf $(JEMDOC)
	@echo "Building $@"
	python3 $(JEMDOC) -c $(SRC)/mysite.conf -o $(OUT) $<

clean:
	rm -f $(OUT)/*.html
