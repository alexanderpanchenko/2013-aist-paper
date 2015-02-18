#!/bin/bash
echo "Generating PDF from the following EPS files:" 
find . -name "*.eps"
echo "from directory"
pwd
echo "Normalizing EPS files..."
find . -name "*.eps" -exec eps2eps '{}' '{}.tmp' \; -exec rm -f '{}' \; -exec mv '{}.tmp' '{}'  \;
echo "Generating PDF files..."
find . -name "*.eps" -exec epstopdf '{}' \;
echo "Done!"
