(*
 * This does not work for several reasons.
 * Uncomment the code to learn why.
 *)
(*
let upcase_first_entry line =
    let (first :: rest) = String.split_on_char ',' line in
    String.concat "," (String.uppercase first :: rest)
*)


(* This works. *)
let upcase_first_entry line =
    match String.split_on_char ',' line with
    | [] -> assert false (* String.split returns at least one element *)
    | first :: rest -> String.concat "," (String.uppercase first :: rest)


let () =
    print_endline (upcase_first_entry "Hello, World!")
