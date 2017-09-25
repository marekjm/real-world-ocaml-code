(*
 * Compile this example using:
 *
 *      ocamlfind ocamlc -linkpkg -thread -package core dedup.ml -o dedup.byte
 *
 *)

let (|>) x f = f x

let path = "/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin"

let () =
    String.split_on_char ':' path
    |> Core.List.dedup ~compare:String.compare
    |> Core.List.iter ~f:print_endline
