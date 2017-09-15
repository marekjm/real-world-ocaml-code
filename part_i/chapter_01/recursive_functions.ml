(* Compile with ocamlc. *)

let rec sum l =
    match l with
    | [] -> 0   (* base case *)
    | hd :: tl -> hd + sum tl   (* inductive case *)


let () =
    print_endline (string_of_int (sum [1; 2; 3]))
