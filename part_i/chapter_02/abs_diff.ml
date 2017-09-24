let abs_diff x y = abs (x - y)

let abs_diff =
    (fun x -> (fun y -> abs (x - y)))
