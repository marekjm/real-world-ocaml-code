#!/usr/bin/env bash

set -e

PART=$1
CHAPTER=$2

if [[ "$PART" == '' ]]; then
    echo "error: need part (a Roman number)"
    echo "note: syntax: $0 <part> <chapter>"
    exit 1
fi
if [[ "$CHAPTER" == '' ]]; then
    echo "error: need chapter (a decimal integer)"
    echo "note: syntax:  $0 <part> <chapter>"
    echo "note: example: $0 $PART 42"
    exit 1
fi

CHAPTER_PATH="./part_$PART/chapter_$CHAPTER"

if [[ -d $CHAPTER_PATH ]]; then
    echo "Reinitialising chapter $CHAPTER of part $PART"
else
    echo "Initialising chapter $CHAPTER of part $PART"
fi

mkdir -p $CHAPTER_PATH

echo "# This Makefile was generated at $(date)

OCAMLCC=ocamlfind ocamlc
OCAML_PACKAGES=-package core -package core_bench
OCAML_FLAGS=-linkpkg -thread \$(OCAML_PACKAGES)

# Put you default targets here, like this:
# all: \\
#     first_target.byte \\
#     second_target.byte \\
#     nth_target.byte
all:

clean:
	rm -f *.cm*
	rm -f *.out
	rm -f *.byte
	rm -f *.o

%.byte: %.ml
	ocamlfind ocamlc -linkpkg -thread -package core \$^ -o \$@
" > $CHAPTER_PATH/Makefile
