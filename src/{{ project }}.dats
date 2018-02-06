%{^
#define STUB_H "hs/{{ Project }}_stub.h"
#define STG_INIT __stginit_{{ Project }}
%}

#include "$PATSHOMELOCS/hs-bind-0.4.2/runtime.dats"

extern
fun hs_hello_world() : void =
  "mac#hello_world"

implement main0(argc, argv) =
  { 
    val _ = hs_init(argc, argv)
    val _ = hs_hello_world()
    val _ = hs_exit()
  }
