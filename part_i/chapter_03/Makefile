OCAMLCC=ocamlfind ocamlc
OCAML_PACKAGES=-package core -package core_bench
OCAML_FLAGS=-linkpkg -thread $(OCAML_PACKAGES)

all: example.byte performance.byte performance_sum.byte render_table.byte

clean:
	rm -f *.cm*
	rm -f *.out
	rm -f *.byte
	rm -f *.o

%.byte: %.ml
	$(OCAMLCC) $(OCAML_FLAGS) $^ -o $@
