let string_of_int_array arr =
    "[| " ^ (String.concat " ; " (List.map string_of_int (Array.to_list arr))) ^ " |]"

let numbers = [| 1; 2; 3; 4 |]

let () =
    print_endline (string_of_int_array numbers);
    numbers.(2) <- 4;
    print_endline (string_of_int_array numbers)
