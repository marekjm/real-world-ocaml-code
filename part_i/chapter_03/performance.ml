(*
 * Compile using:
 * 
 *      ocamlfind ocamlc -linkpkg -thread -package core -package core_bench \
 *          example.ml -o example.byte
 *
 * This program assumes Core and Core_bench packages to be installed in v0.9.0 version.
 *)

open Core
open Core_bench

let plus_one_match x =
    match x with
    | 0 -> 1
    | 1 -> 2
    | 2 -> 3
    | _ -> x + 1

let plus_one_if x =
    if      x = 0 then 1
    else if x = 1 then 2
    else if x = 2 then 3
    else x + 1


let main () = Command.run (Bench.make_command [
    Bench.Test.create ~name:"plus_one_match" (fun () ->
        ignore (plus_one_match 10));
    Bench.Test.create ~name:"plus_one_if" (fun () ->
        ignore (plus_one_if 10));
])


let () = main ()

(*
let run_bench tests =
    Bench.bench
        ~ascii_table:true
        ~display:Textutils.Ascii_table.Display.column_titles
        tests
;;


[ Bench.Test.create ~name:"plus_one_match" (fun () ->
    ignore (plus_one_match 10))
; Bench.Test.create ~name:"plus_one_if" (fun () ->
    ignore (plus_one_if 10)) ]
|> run_bench
;;
*)
