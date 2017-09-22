(* The book uses `open Core.Std` but it is deprecated. *)
open Core

let rec read_and_accumulate accum =
    (*
     * The book uses unqualified In_channel (probably because In_channel
     * was part of Core) but now it must be used through Stdio.
     * You could use `open Stdio`, but I chose not to.
     *)
    let line = Stdio.In_channel.input_line Stdio.In_channel.stdin in
    match line with
    | Some x -> read_and_accumulate (accum +. Float.of_string x)
    | None -> accum


let () =
    Stdio.printf "Total: %F\n" (read_and_accumulate 0.)
