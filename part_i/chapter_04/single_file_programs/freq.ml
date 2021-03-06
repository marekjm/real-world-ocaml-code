open Core

(*
 * Example copied verbatim from the book does not work.
 * Both List.Assoc.find and List.assoc.add need an argument 'equal' of
 * type ('a -> 'a -> bool).
 *
 * So here it is.
 *)
let comparator a b = a = b

let build_counts () =
    (*
     * Note the use of `In_channel.stdin` instead of bare `stdin`.
     * Using bare `stdin` is deprecated in v0.9.0 of Core.
     *)
    In_channel.fold_lines In_channel.stdin ~init:Counter.empty ~f:Counter.touch

let () =
    build_counts ()
    |> Counter.to_list
    |> List.sort ~cmp:(fun (_, x) (_, y) -> Int.descending x y)
    |> (fun l -> List.take l 10)
    |> List.iter ~f:(fun (line, count) -> printf "%3d: %s\n" count line)
