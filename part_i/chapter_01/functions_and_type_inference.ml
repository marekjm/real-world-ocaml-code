(* Functions and Type Inference *)

(*
 * Compile this file using the following command:
 *
 *      ocamlfind ocamlc -linkpkg -thread -package core functions_and_type_inference.ml -o functions_and_type_inference.byte
 *
 * You can run into problems described here[1] if you use glibc >= 2.26.
 * In such case just copy-paste this code into utop.
 *
 * [1] https://github.com/janestreet/core/issues/95
 *)

let square x = x * x

let ratio x y = Core.Float.of_int x /. Core.Float.of_int y

let () =
    print_endline (string_of_int (square 2));
    print_endline (string_of_int (square (square 2)));
    print_endline (string_of_float (ratio 4 7))
