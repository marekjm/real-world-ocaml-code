type point2d = { x : float; y : float }

let p = { x = 3. ; y = -4. }

(* First version. *)
let magnitude { x = x_pos ; y = y_pos } =
    sqrt (x_pos ** 2. +. y_pos ** 2.)

(* Version with "name punning". *)
let magnitude { x; y } =
    sqrt (x ** 2. +. y ** 2.)

let distance v1 v2 =
    magnitude { x = v1.x -. v2.x ; y = v1.y -. v2.y }


type circle_desc = { center : point2d ; radius : float }
type rect_desc = { lower_left : point2d ; width : float ; height : float }
type segment_desc = { endpoint1 : point2d ; endpoint2 : point2d }

type scene_element =
    | Circle of circle_desc
    | Rect of rect_desc
    | Segment of segment_desc


let is_inside_scene_element point scene_element =
    match scene_element with
    | Circle { center ; radius } ->
            distance center point < radius
    | Rect { lower_left ; width ; height } ->
            point.x > lower_left.x && point.x < (lower_left.x +. width)
            && point.y > lower_left.y && point.y < (lower_left.y +. height)
    | Segment { endpoint1 ; endpoint2 } -> false

(*
 * This function had to be changed to work.
 * In the book its body is:
 *
 *      List.exists scene
 *          ~f:(fun el -> is_inside_scene_element point el)
 *
 * The order of parameters had to be changed.
 *)
let is_inside_scene point scene =
    List.exists (fun el -> is_inside_scene_element point el) scene


let () =
    let radius = 0.5    (* Notice the suspiciously small radius... *)
    in
    let is = is_inside_scene { x = 3. ; y = 4. } [ Circle { center = { x = 4. ; y = 4. } ; radius = radius } ]
    in
    print_endline (string_of_bool is)

let () =
    let radius = 5.0    (* With bigger radius the point will not be inside the scene. *)
    in
    let is = is_inside_scene { x = 3. ; y = 4. } [ Circle { center = { x = 4. ; y = 4. } ; radius = radius } ]
    in
    print_endline (string_of_bool is)
