(* Compile and run using:
 * 
 *      ]$ ocamlc sum_if_true.ml
 *      ]$ ./a.out
 *
 *)

let sum_if_true test first second =
    (if test first then first else 0) + (if test second then second else 0)

let sum_if_true_annot (test : int -> bool) (x : int) (y : int) =
    (if test x then x else 0) + (if test y then y else 0)

let even x =
    x mod 2 = 0


let () =
    print_endline (string_of_int (sum_if_true even 3 4));
    print_endline (string_of_int (sum_if_true even 2 4));
    print_endline (string_of_int (sum_if_true_annot even 3 4));
    print_endline (string_of_int (sum_if_true_annot even 2 4))
