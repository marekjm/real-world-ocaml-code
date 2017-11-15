(*
 * Chapter 3: Lists and Patterns
 *  Terser and Faster Patterns
 *
 * Pages: 63 - ??.
 *)


(*
 * Here's the implementation from "Recursive list functions" on page 14.
 *)
let rec destutter l =
    match l with
    | [] -> []
    | [hd] -> [hd]
    | hd :: hd' :: tl ->
      if hd = hd' then destutter (hd' :: tl)
      else hd :: destutter (hd' :: tl)


(*
 * A better version.
 * More concise, and more performant.
 *)
let rec destutter = function
    | [] as l -> l
    | [_] as l -> l
    | hd :: hd' :: tl ->
      if hd = hd' then destutter (hd' :: tl)
      else hd :: destutter (hd' :: tl)


(*
 * Even better version.
 *)
let rec destutter = function
    | [] | [_] as l -> l    (* Note the usage of an Or pattern here. *)
    | hd :: hd' :: tl ->
      if hd = hd' then destutter (hd' :: tl)
      else hd :: destutter (hd' :: tl)


(*
 * Oh boy, an *even terser* version...
 * And with a "when" clause? Now you're talking!
 *)
let rec destutter = function
    | [] | [_] as l -> l    (* Note the usage of an Or pattern here. *)
    | hd :: (hd' :: _ as tl) when hd = hd' -> destutter tl
    | hd :: tl -> hd :: destutter tl
