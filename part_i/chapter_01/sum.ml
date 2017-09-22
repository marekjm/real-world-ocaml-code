(* The book uses `open Core.Std` but it is deprecated. *)
(* open Core *)

(*
 * The below code will not work if you have glibc 2.26.
 * It appears that Core is broken with this version of glibc.
 *)
(*
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
    | Some x -> read_and_accumulate (accum +. float_from_string x)
    | None -> accum
*)

(*
 * Use this if you have glibc 2.26.
 *)
let float_from_string s =
    try
        let f = float_of_string s in Some f
    with
    | Failure _ -> None

let get_line =
    try
        let s = read_line () in Some s
    with
    | End_of_file -> None

let rec read_and_accumulate accum =
    (*
     * The book uses unqualified In_channel (probably because In_channel
     * was part of Core) but now it must be used through Stdio.
     * You could use `open Stdio`, but I chose not to.
     *)
    let line = get_line in
    match line with
    | Some x -> (print_endline "well, hello there"; match float_from_string x with
                | Some f -> read_and_accumulate (accum +. f)
                | None -> accum)
    | None -> accum

let () =
    Stdio.printf "Total: %F\n" (read_and_accumulate 0.)
