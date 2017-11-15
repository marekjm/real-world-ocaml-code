(*
 * Chapter 3: Lists and Patterns
 *  Tail Recursion
 *
 * Pages: 61 - 63.
 *)

let rec length_n l n =
    match l with
    | [] -> n
    | _ :: tl -> length_n tl (n + 1)

let length l = length_n l 0

let make_list n = Core.List.init n ~f:(fun x -> x)

let () =
    print_int (length (make_list 10_000_000));
    print_newline ()
