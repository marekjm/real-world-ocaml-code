(* Compile with ocamlc. *)

let rec destutter list =
    match list with
    | [] -> []
    | [hd] -> [hd]
    | hd1 :: hd2 :: tl ->
        if hd1 = hd2 then destutter (hd2 :: tl)
        else hd1 :: destutter (hd2 :: tl)

(* A very simple list-of-string to string conversion. *)
let string_of_string_list l =
    String.concat "" ([ "[" ] @ [String.concat " ; " l] @ [ "]" ])

let () =
    print_endline (string_of_string_list (destutter ["hey"; "hey"; "hey"; "man!"]))
