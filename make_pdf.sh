#!/bin/bash

for file in dsn-comic??.svg
do
	inkscape --export-pdf="${file%%.svg}.pdf" "$file"
	inkscape --export-png="${file%%.svg}.png" "$file"
	convert "${file%%.svg}.png" "${file%%.svg}.jpg"
	rm "${file%%.svg}.png"
done

pdftk dsn-comic??.pdf cat output dsn-comic.pdf

# clean up intermediate PDF files
for file in dsn-comic??.pdf
do
	rm $file
done

