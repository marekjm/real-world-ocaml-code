open Core
open Core_extended

type host_info = {
    hostname    : string;
    os_name     : string;
    cpu_arch    : string;
    timestamp   : Time.t;
}

let my_host =
    let sh = Shell.sh_one_exn in {
        hostname = sh "hostname";
        os_name = sh "uname -s";
        cpu_arch = sh "uname -m";   (* The book uses `uname -p' but it did not work
                                     * on my machine (returned "unknown").
                                     * The `-m' switch works better.
                                     *)
        timestamp = Time.now ();
}

let to_string h =
    h.hostname ^ " " ^ h.os_name ^ " " ^ h.cpu_arch

let () = print_endline (to_string my_host)
