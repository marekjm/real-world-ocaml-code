let rec find_first_stutter list =
    match list with
    | [] | [_] ->
        (* only zero or one elements, so no repeats *)
        None
    | x :: y :: tl ->
            if x = y then Some x else find_first_stutter (y :: tl)

let () =
    match find_first_stutter [1; 3; 5; 7; 11; 13; 17; 19; 29; 31; 37; 42; 42] with
    | Some n -> print_endline (string_of_int n)
    | None -> print_endline "OH NOES!"


(*
 * WARNING!
 * This function is *horribly* inefficient!
 *)
let rec is_even x =
    if x = 0 then true else is_odd (x - 1)
and is_odd x =
    if x = 0 then false else is_even (x - 1)



(* This is just a helper function. *)
let string_of_bool_list l =
    "[" ^ (String.concat "; " (List.map string_of_bool l)) ^ "]"

let () =
    let l = List.map is_even [0; 1; 2; 3; 4; 5] in  (* This line is from the book. *)
    let s = string_of_bool_list l in
    print_endline s;
    let l = List.map is_odd [0; 1; 2; 3; 4; 5] in  (* This line too! *)
    let s = string_of_bool_list l in
    print_endline s;
