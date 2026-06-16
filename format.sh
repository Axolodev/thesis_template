#!/bin/bash
# Format all LaTeX files with lines under 80 characters

tex-fmt --recursive -q;

echo "✓ All .tex and .bib files formatted"
