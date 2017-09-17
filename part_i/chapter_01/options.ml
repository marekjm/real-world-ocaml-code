(*
 * Compile this file using ocamlfind command.
 * This is needed because the log_entry function uses Core modules.
 * The command to use is:
 *
 *      ocamlfind ocamlc -linkpkg -thread -package core options.ml -o options.byte
 *
 *)


(* This one is easy and just taken from the book. *)
let divide x y =
    if y = 0 then None else Some (x / y)


(*
 * This function required some changes (from the source code included in the book) to make it work.
 *
 * The first, most obvious one was to prepend 'Core.' to some types.
 *
 * The second, less obvious, was that the Core library changed in the period between
 * printing the book, and now.
 * For example, function Core.Time.to_sec_string (Time.to_sec_string in the book) requires
 * two parameters, not one.
 *)
let log_entry maybe_time message =
    let time =
        match maybe_time with
        | Some x -> x
        | None -> Core.Time.now ()
    and timezone = Lazy.force Core.Time.Zone.local
    in
    Core.Time.to_sec_string time ~zone:timezone ^ " -- " ^ message
