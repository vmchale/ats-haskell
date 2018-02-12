let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default.dhall
in
let dbin = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-bin.dhall

in pkg //
  { bin =
    [
      dbin //
      { src = "src/{{ project }}.dats"
      , target = "target/{{ project }}"
      , hsDeps = [ { cabalFile = "hs/{{ project }}.cabal", objectFile = "hs/{{ ProjectCamelCase }}.o", projectFile = ([] : Optional Text) } ]
      , hs2ats = [ { hs = "hs/{{ ProjectCamelCase }}.hs", ats = ".atspkg/hs2ats/gen.sats", cpphs = False } ]
      }
    ]
    , dependencies = [ "hs-bind" ]
    , ccompiler = "ghc-8.2.2"
    , cflags = ["-optc-O2", "-optc-flto", "-optc-mtune=native", "hs/{{ ProjectCamelCase }}"]
  }
