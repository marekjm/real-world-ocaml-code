(*
 * Build using `corebuild example.byte' and
 * run using `./example.byte'.
 *)


module Interval = struct
    type t = | Interval of int * int
             | Empty

    let create low high =
        if high < low then Empty else Interval (low, high)
end

module Extended_interval = struct
    include Interval

    let contains t x =
        match t with
        | Empty -> false
        | Interval (low, high) -> x >= low && x <= high
end

let () =
    match Extended_interval.contains (Extended_interval.create 3 10) 11 with
    | true -> print_endline "true"
    | false -> print_endline "false"
