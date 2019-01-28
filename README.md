# papi — Performance Application Programming Interface for OCaml

%%VERSION%%

papi is a binding for PAPI, the
[Performance Application Programming Interface][papi-home].
It gives access to hardware performance counters in a way that is portable
across architectures and operating systems.

The bindings closely follow PAPI's [own interface][papi-docs]. As a consequence,
the multitude of errors that PAPI can signal are propagated to OCaml. User is
advised to at least skim the PAPI documentation.

papi is distributed under the ISC license.

Homepage: https://github.com/pqwy/ocaml-papi

[papi-home]: http://icl.cs.utk.edu/papi
[papi-docs]: http://icl.cs.utk.edu/projects/papi/wiki/Main_Page

## Documentation

Interface files or [online][doc].

[doc]: https://pqwy.github.io/ocaml-papi/doc
