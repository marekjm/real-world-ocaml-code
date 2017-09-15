(* Compile using ocamlc. *)

let languages = [ "OCaml"; "Perl"; "C" ]

let my_favourite_language languages =
    match languages with
    | first :: the_rest -> first
    | [] -> "OCaml" (* A good default. *)

let () =
    print_endline (my_favourite_language languages);
    print_endline (my_favourite_language [])
