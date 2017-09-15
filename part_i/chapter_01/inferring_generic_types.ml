(* Compile using ocamlc. *)

let first_if_true test x y = if test x then x else y

let long_string s = String.length s > 6

let big_number x = x > 3

let is_a_multiple x y = x mod y = 0

let () =
    print_endline (first_if_true long_string "short" "loooooong");
    print_endline (string_of_int (first_if_true big_number 4 3));
    (* Uncomment the line below to trigger compiler error. *)
    (* print_endline (string_of_int (first_if_true big_number "short" "loooooong")); *)
    print_endline (string_of_bool (is_a_multiple 8 2));
    print_endline (string_of_bool (is_a_multiple 8 0))
