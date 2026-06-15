#!/usr/bin/env bash

# Build will fail if any command below fails.
set -e

Rscript _theme/R/build-quarto-yml.R
quarto render