(* The book uses `open Core.Std` but it is deprecated. *)
(* open Core *)

let float_from_string = Core.Float.of_string
let get_line = Stdio.In_channel.input_line Stdio.In_channel.stdin

let rec read_and_accumulate accum =
    (*
     * The book uses unqualified In_channel (probably because In_channel
     * was part of Core) but now it must be used through Stdio.
     * You could use `open Stdio`, but I chose not to.
     *)
    let line = get_line in
    match line with
    | None -> accum
    | Some x -> read_and_accumulate (accum +. float_from_string x)

(*
let get_line () =
    try
        let s = read_line () in Some s
    with
    | End_of_file -> None

let () =
    let s = get_line () in
    match s with
    | Some s -> print_endline s
    | None -> ()
    *)

let () =
    Stdio.printf "Total: %F\n" (read_and_accumulate 0.)
