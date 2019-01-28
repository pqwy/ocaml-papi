(* Copyright (c) 2019 David Kaloper Meršinjak. All rights reserved.
   See LICENSE.md *)


(* let _ = *)
(*   Format.printf "counters: %d\ncomponents: %d\n%!" *)
(*     (Papi.counters ()) (Papi.components ()) *)

let counters = Papi.[L1_DCM; L1_ICM; L1_TCM]

let trap f = try f () with Papi.Error (e, n) as exn ->
  Format.printf "%s: %a\n%!" n Papi.pp_error e; raise exn

let _ = Papi.init ()

let create ?(counters = []) () =
  let set = Papi.create () in
  ( try List.iter (Papi.add set) counters with Papi.Error _ as exn ->
      Papi.cleanup set; Papi.destroy set; raise exn );
  set

let _ = trap @@ fun () ->
  let set = create ~counters () in
  let res = Array.create_float (Papi.num_events set) in
  for i = 0 to Papi.num_events set - 1 do res.(i) <- 0. done;
  Papi.start set;
  for _ = 0 to 1_000 do
    Papi.read set res;
    Fmt.(pr "%a\n%!" (Dump.array float) res)
  done;
  Papi.(stop set; cleanup set; destroy set)
