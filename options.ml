open Core.Time
open Lazy

let log_entry maybe_time message =
    let time =
        match maybe_time with
        | Some x -> x
        | None -> Core.Time.now ()
    and timezone = Lazy.force Core.Time.Zone.local
    in
    Core.Time.to_sec_string time ~zone:timezone ^ " -- " ^ message
