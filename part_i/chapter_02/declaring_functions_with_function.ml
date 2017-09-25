(*
 * Compile using:
 *      ocamlfind ocamlc -linkpkg -thread -package core declaring_functions_with_function.ml
 *)

let some_or_zero = function
    | Some x -> x
    | None -> 0

let () =
    List.map some_or_zero [Some 3; None; Some 5]
    |> List.map string_of_int
    |> Core.List.iter ~f:print_endline

let some_or_default default = function
    | Some x -> x
    | None -> default

let () =
    print_endline (string_of_int (some_or_default 42 None));
    print_endline (string_of_int (some_or_default 3 (Some 5)))

let () =
    List.map (some_or_default 100) [Some 3; None; Some 5]
    |> List.map string_of_int
    |> Core.List.iter ~f:print_endline
