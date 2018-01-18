open Core

(*
 * Example copied verbatim from the book does not work.
 * Both List.Assoc.find and List.assoc.add need an argument 'equal' of
 * type ('a -> 'a -> bool).
 *
 * So here it is.
 *)
let comparator a b = a = b

type t = (string * int) list

let empty = []

let to_list x = x

let touch t s =
    let count =
        (* Note the use of comparator. Original example did not have it. *)
        match List.Assoc.find ~equal:comparator t s with
        | None -> 0
        | Some x -> x
    in
    (* Note the use of comparator. Original example did not have it. *)
    List.Assoc.add ~equal:comparator t s (count + 1)
