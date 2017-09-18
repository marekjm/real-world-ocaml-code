(*
 * Compile this file with ocamlc.
 *)

let x = { contents = 0 }

(* A very simplistic ref printer.
 * It is sufficient only to print an int ref.
 *)
let string_of_ref r =
    "{contents = " ^ (string_of_int r.contents) ^ "}"

let () =
    x.contents <- x.contents + 1;
    print_endline (string_of_ref x)


let x = ref 0   (* create a ref, i.e., { contents = 0 } *)
let () =
    print_endline (string_of_int !x);   (* get the contents of a ref, i.e., x.contents *)
    x := !x + 1;    (* assignment, i.e., x.contents <- ... *)
    print_endline (string_of_int !x)


(* Reimplementation of ref type. *)

type 'a ref = { mutable contents : 'a }
let ref x = { contents = x }
let (!) r = r.contents
let (:=) r x = r.contents <- x

(* Imperative version of sum function. *)
let sum list =
    let sum = ref 0 in
    List.iter (fun x -> sum := !sum + x) list;
    !sum

let () =
    let numbers = [1; 2; 3; 4] in
    print_endline (string_of_int (sum numbers))
