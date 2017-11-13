(*
 * Compile using:
 * 
 *      ocamlfind ocamlc -linkpkg -thread -package core -package core_bench \
 *          %.ml -o %.byte
 *
 * This program assumes Core and Core_bench packages to be installed in v0.9.0 version.
 *)

open Core
open Core_bench


let rec sum l =
    match l with
    | [] -> 0
    | hd :: tl -> hd + sum tl

let rec sum_if l =
    if List.is_empty l then 0
    else List.hd_exn l + sum_if (List.tl_exn l)


let make_command = let numbers = List.range 0 1000 in Bench.make_command [
        Bench.Test.create ~name:"sum_if" (fun () ->
            ignore (sum_if numbers));
        Bench.Test.create ~name:"sum" (fun () ->
            ignore (sum numbers));
    ]

let main () =
    Command.run make_command


let () = main ()
