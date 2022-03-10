(* Copyright (c) 2019 David Kaloper Meršinjak. All rights reserved.
   See LICENSE.md *)

#if OCAML_VERSION >= (4,14,0)
let _ = Toploop.use_silently Format.err_formatter (Toploop.File "papi_top_init.ml")
#else
let _ = Toploop.use_silently Format.err_formatter "papi_top_init.ml"
#endif
