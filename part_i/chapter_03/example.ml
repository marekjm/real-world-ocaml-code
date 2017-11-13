(*
 * Find the example here:
 * https://github.com/janestreet/core_bench/wiki/Getting-Started-with-Core_bench
 *
 * Compile using:
 * 
 *      ocamlfind ocamlc -linkpkg -thread -package core -package core_bench \
 *          example.ml -o example.byte
 *
 * This program assumes Core and Core_bench packages to be installed in v0.9.0 version.
 *)

open Core
open Core_bench

let main () =
    Random.self_init ();
    let x = Random.float 10.0 in
    let y = Random.float 10.0 in
    Command.run (Bench.make_command [
        Bench.Test.create ~name:"Float add" (fun () ->
            ignore (x +. y));
        Bench.Test.create ~name:"Float mul" (fun () ->
            ignore (x *. y));
        Bench.Test.create ~name:"Float div" (fun () ->
            ignore (x /. y));
    ])


let () = main ()
