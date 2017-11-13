(*
 * Chapter 3: Lists and Patterns
 *  Using the List Module Effectively
 *
 * Pages: 55 - 58.
 *)


let max_width header rows =
    (*
     * The book uses old version of List.map.
     * Current interface has no named arguments, and
     * has the following type:
     *      ('a -> 'b) -> 'a list -> 'b list
     *)
    let lengths l = List.map String.length l in
    (*
     * The book uses List.fold.
     * The interface for List.fold_left is a bit different, i.e.
     * all arguments are mandatory.
     *)
    List.fold_left
        (*
         * The book uses old List.map2_exn function which no longer exists.
         *)
        (fun acc row -> List.map2 Core.Int.max acc (lengths row))
        (lengths header)
        rows


let render_separator widths =
    let pieces = List.map (fun w -> String.make (w + 2) '-') widths in
    (*
     * The book uses old version of String.concat which allows to pass sep
     * as a labeled argument.
     *)
    "|" ^ String.concat "+" pieces ^ "|"


let pad s length =
    " " ^ s ^ (String.make (length - String.length s + 1) ' ')


let render_row row widths =
    let padded = List.map2 pad row widths in
    "|" ^ String.concat "|" padded ^ "|"


let render_table header rows =
    let widths = max_width header rows in
    String.concat "\n"
        (render_row header widths
         :: render_separator widths
         :: List.map (fun row -> render_row row widths) rows
    )


let main () = Printf.printf "%s\n"
    (render_table
        [ "language"; "architect"; "first release" ]
        [
            [ "List";   "John McCarthy";    "1958" ];
            [ "C";      "Dennis Ritchie";   "1969" ];
            [ "ML";     "Robin Milner";     "1973" ];
            [ "OCaml";  "Xaier Leroy";      "1996" ]
        ])


let () = main ()
