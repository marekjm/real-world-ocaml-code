(*
 * Compile this file with ocamlc.
 *)

let permute array =
    let length = Array.length array in
    for i = 0 to length - 2 do
        (* pick a j to swap with *)
        let j = i + Random.int (length - i) in
        (* Swap i and j *)
        let tmp = array.(i) in
        array.(i) <- array.(j);
        array.(j) <- tmp
    done

let string_of_int_array array =
    let list = Array.to_list array in
    let list = List.map (fun el -> string_of_int el) list in
    "[" ^ (String.concat " ; " list) ^ "]"


let ar = Array.init 20 (fun i -> i)
let () =
    permute ar;
    print_endline (string_of_int_array ar)


let find_first_negative_entry array =
    let pos = ref 0 in
    while !pos < Array.length array && array.(!pos) >= 0 do
        pos := !pos + 1
    done;
    if !pos = Array.length array then None else Some !pos

let string_of_int_option x =
    match x with
    | None -> "None"
    | Some n -> "Some " ^ (string_of_int n)

let () =
    print_endline (string_of_int_option (find_first_negative_entry [| 1; 2; 0; 3 |]));
    print_endline (string_of_int_option (find_first_negative_entry [| 1; -2; 0; 3 |]))

(*
 * The "broken example" from the book is not included here.
 *)
