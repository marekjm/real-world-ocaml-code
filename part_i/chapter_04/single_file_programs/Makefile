# This Makefile was generated at Wed 15 Nov 19:35:50 GMT 2017

OCAMLCC=ocamlfind ocamlc
OCAML_PACKAGES=-package core
OCAML_FLAGS=-linkpkg -thread $(OCAML_PACKAGES)

# Put you default targets here, like this:
# all: \
#     first_target.byte \
#     second_target.byte \
#     nth_target.byte
all: freq.byte

clean:
	rm -f *.cm*
	rm -f *.out
	rm -f *.byte
	rm -f *.o

%.byte: %.ml
	$(OCAMLCC) $(OCAML_FLAGS) $^ -o $@
