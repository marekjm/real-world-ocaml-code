(* Compile with ocamlc. *)

let rec sum l =
    match l with
    | [] -> 0   (* base case *)
    | hd :: tl -> hd + sum tl   (* inductive case *)

let rec sum_tail_impl l acc =
    match l with
    | [] -> acc     (* base case *)
    | hd :: tl -> sum_tail_impl tl (acc + hd)   (* inductive case *)

let sum_tail l = sum_tail_impl l 0


let () =
    print_endline (string_of_int (sum [1; 2; 3]));
    print_endline (string_of_int (sum_tail [1; 2; 3]))
