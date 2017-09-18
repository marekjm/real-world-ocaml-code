(*
 * Compile this file using ocamlc.
 *)


type running_sum = {
    mutable sum : float;
    mutable sum_sq : float; (* sum of squares *)
    mutable samples : int;
}

let mean rsum = rsum.sum /. float rsum.samples

let stdev rsum =
    let mean_sq = rsum.sum_sq /. float rsum.samples
    and mean = rsum.sum /. float rsum.samples
    in
    sqrt (mean_sq -. mean ** 2.)

let create () = { sum = 0. ; sum_sq = 0. ; samples = 0 }

let update rsum x =
    rsum.samples <- rsum.samples + 1;
    rsum.sum     <- rsum.sum +. x;
    rsum.sum_sq  <- rsum.sum_sq +. x *. x


(* Print out results. *)
let rsum = create ()
let numbers = [ 1. ; 3. ; 2. ; -7. ; 4. ; 5. ]

let () =
    List.iter (fun x -> update rsum x) numbers;
    print_endline (string_of_float (mean rsum));
    print_endline (string_of_float (stdev rsum))
