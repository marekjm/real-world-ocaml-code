(* Compile and run using:
 * 
 *      ]$ ocamlc sum_if_true.ml
 *      ]$ ./a.out
 *
 *)

let sum_if_true test first second =
    (if test first then first else 0) + (if test second then second else 0)

let even x =
    x mod 2 = 0


let () =
    print_endline (string_of_int (sum_if_true even 3 4));
    print_endline (string_of_int (sum_if_true even 2 4))
