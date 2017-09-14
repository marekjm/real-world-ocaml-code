(* Functions and Type Inference *)

(* Run this code in utop. *)

let square x = x * x

let ratio x y = Core.Float.of_int x /. Core.Float.of_int y

let () =
    print_endline (string_of_int (square 2));
    print_endline (string_of_int (square (square 2)));
    print_endline (string_of_float (ratio 4 7))
