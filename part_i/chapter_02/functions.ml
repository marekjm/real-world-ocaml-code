(*
 * Here is an example of simple anonymous function.
 *)
let () =
    print_endline (string_of_int ( (fun x -> x + 1) 7))


(* This is just a helper function. *)
let string_of_int_list l =
    "[" ^ (String.concat "; " (List.map string_of_int l)) ^ "]"

let () =
    let l = List.map (fun x -> x + 1) [1; 2; 3] in  (* First create an int list. *)
    let s = string_of_int_list l in                 (* Then convert the list to a string... *)
    print_endline s                                 (* ...and print the string. *)

let () =
    let increments = [ (fun x -> x + 1); (fun x -> x + 2) ] in  (* Create a list of functions. *)
    let l = List.map (fun g -> g 5) increments in               (* Then, map each of these functions to 5.
                                                                 * This gives us an int list in return. *)
    let s = string_of_int_list l in
    print_endline s
