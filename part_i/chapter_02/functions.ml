let () =
    print_endline (string_of_int ( (fun x -> x + 1) 7))


let string_of_int_list l =
    "[" ^ (String.concat "; " (List.map string_of_int l)) ^ "]"

let () =
    let l = List.map (fun x -> x + 1) [1; 2; 3] in
    let s = string_of_int_list l in
    print_endline s
