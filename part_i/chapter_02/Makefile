all: functions_and_type_inference.byte

%.byte: %.ml
	ocamlfind ocamlc -linkpkg -thread -package core $^ -o $@

clean:
	rm -f *.cm*
	rm -f *.out
	rm -f *.byte
	rm -f *.o
