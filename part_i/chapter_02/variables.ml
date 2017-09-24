let languages = "OCaml,Python,C++,C"

let dashed_languages =
    let language_list = String.split languages ~on:',' in
    String.concat ~sep:"-" language_list

let area_of_ring inner_radius outer_radius =
    let pi = acos (-1.) in
    let area_of_circle r = pi *. r *. r in
    area_of_circle outer_radius -. area_of_circle inner_radius

let () =
    print_endline dashed_languages;
    print_endline (string_of_float (area_of_ring 1. 3.))
