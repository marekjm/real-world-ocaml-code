(* Compile using ocamlc. *)

let concat ?sep x y =
    let sep = match sep with None -> "" | Some x -> x in
    x ^ sep ^ y

(* An optional argument. *)
let () =
    print_endline (concat "Hello" "World!");
    print_endline (concat ~sep:" " "Hello" "World!")


let concat ?(sep="") x y = x ^ sep ^ y

(* An optional argument with a default value. *)
let () =
    print_endline (concat ~sep:":" "foo" "bar");
    print_endline (concat ?sep:(Some ":") "foo" "bar")

let () =
    print_endline (concat "foo" "bar");
    print_endline (concat ?sep:(None) "foo" "bar")


(************************************)

(*
 * First version.
 * Not that good because it has to remember to match sep with sep of
 * concat.
 *)
let uppercase_concat ?(sep="") a b = concat ~sep (String.uppercase_ascii a) b

let () =
    print_endline (uppercase_concat "foo" "bar");
    print_endline (uppercase_concat "foo" "bar" ~sep:":")

(*
 * Second version.
 * Better, because it just passes the optional argument to concat and
 * lets concat decide what to do.
 *)
let uppercase_concat ?sep a b = concat ~sep (String.uppercase_ascii a) b

let () =
    print_endline (uppercase_concat "foo" "bar");
    print_endline (uppercase_concat "foo" "bar" ~sep:":")
