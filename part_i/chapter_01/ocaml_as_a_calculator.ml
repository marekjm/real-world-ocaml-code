(* OCaml as a calculator *)

(*
 * This is the very first example.
 *)
let () =
    print_endline (string_of_int ( 3 + 4 ));
    print_endline (string_of_int ( 8 / 2 ));
    print_endline (string_of_float ( 3.5 +. 6. ));
    print_endline (string_of_int ( 30_000_000 / 300_000 ));
    print_endline (string_of_float (sqrt 9.))

(*
 * This is the second example.
 *
 * The 'let ... in' construct is introduced a bit later, but
 * it allows me to just write the code here easier.
 *)
let () =
    let x = 3 + 4 in
    let y = x + x in
    let x' = x + 1 in
    print_endline (string_of_int x);
    print_endline (string_of_int y);
    print_endline (string_of_int x')
