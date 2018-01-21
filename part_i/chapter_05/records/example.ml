open Core
open Core_extended

module Hostinfo : sig
    type t
    val to_string : t -> string
    val make : unit -> t
end = struct
    type t = {
        hostname    : string;
        os_name     : string;
        cpu_arch    : string;
        timestamp   : Time.t;
    }

    let make () = let sh = Shell.sh_one_exn in {
        hostname = sh "hostname";
        os_name = sh "uname -s";
        cpu_arch = sh "uname -m";
        timestamp = Time.now ();
    }

    let to_string { hostname = h; os_name = os; cpu_arch = c; timestamp = ts; } =
        let timezone = Lazy.force Time.Zone.local in
        let ts = Time.to_sec_string ts ~zone:timezone in
        sprintf "%s (%s / %s, on %s)" h os c ts
end

let () = print_endline (Hostinfo.to_string (Hostinfo.make ()))
