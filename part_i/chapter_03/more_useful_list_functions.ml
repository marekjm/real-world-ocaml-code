(*
 * Chapter 3: Lists and Patterns
 *  More Useful List Functions
 *
 * Pages: 58 - 61.
 *)

(*
 * Run this under utop, line by line.
 *)

(*
 * Combining list elements with List.reduce.
 * Pages: 58 - 59.
 *)
Core.List.reduce [1; 2; 3; 4; 5] ~f:(+);;


(*
 * Filtering with List.filter and Core.List.filter_map
 * Pages: 59 - 59.
 *)
List.filter (fun x -> x mod 2 = 0) [1; 3; 3; 4; 5];;  (* This is non-Core version of List.filter *)

Core.List.filter_map (Core.Sys.ls_dir ".") ~f:(fun fname ->
    match Core.String.rsplit2 ~on:'.' fname with
    | None | Some("",_) -> None
    | Some(_, ext) -> Some ext)
|> Core.List.dedup
;;


(*
 * Partitioning with Core.List.partition_tf.
 * Pages: 60 - 60.
 *)
let is_ocaml_source s =
    match Core.String.rsplit2 s ~on:'.' with
    | Some (_, ("ml"|"mli")) -> true
    | _ -> false

let (ml_files, other_files) =
    Core.List.partition_tf (Core.Sys.ls_dir ".") ~f:is_ocaml_source;;


(*
 * Combining lists
 * Pages: 60 - 61.
 *)
List.append [1; 2; 3] [4; 5; 6];;   (* Use a function... *)
[1; 2; 3] @ [4; 5; 6];;             (* ...or an operator. *)

List.concat [ [1; 2]; [3; 4; 5]; [6]; [] ];;    (* Use List.concat if you need to concatenate
                                                 * many lists. Similarly to String.concat.
                                                 *)

let rec ls_rec s =
    if Core.Sys.is_file_exn ~follow_symlinks:true s
    then [s]
    else
        Core.Sys.ls_dir s
        |> List.map (fun sub -> ls_rec (Core.Filename.concat s sub))    (* We could use ^/ here if
                                                                         * we opened Core.
                                                                         *)
        |> List.concat
;;

(*
 * This version of ls_rec is functionally equivallent to the previous one.
 * It uses Core.List.concat_map instead of List.map and then List.concat.
 *)
let rec ls_rec s =
    if Core.Sys.is_file_exn ~follow_symlinks:true s
    then [s]
    else
        Core.Sys.ls_dir s
        |> Core.List.concat_map ~f:(fun sub -> ls_rec (Core.Filename.concat s sub))
;;
