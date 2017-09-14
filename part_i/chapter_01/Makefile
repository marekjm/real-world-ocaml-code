all: functions_and_type_inference.byte

functions_and_type_inference.byte: functions_and_type_inference.ml
	ocamlfind ocamlc -linkpkg -thread -package core $^ -o $@

clean:
	rm -f *.cm*
	rm -f *.out
	rm -f *.byte
	rm -f *.o
