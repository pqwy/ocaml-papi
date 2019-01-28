#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
#require "ocb-stubblr.topkg"
open Topkg

let build = Pkg.build ~cmd:Ocb_stubblr_topkg.cmd ()

let () =
  Pkg.describe ~build "papi" @@ fun c ->
  Ok [ Pkg.mllib "src/papi.mllib";
       Pkg.clib "src/libpapi_stubs.clib";
       Pkg.test "test/test"; ]
