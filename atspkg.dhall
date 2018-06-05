let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { bin =
    [
      prelude.bin ⫽
      { src = "src/{{ project }}.dats"
      , target = "target/{{ project }}"
      , hsDeps = [ { cabalFile = "hs/{{ project }}.cabal", objectFile = "hs/{{ ProjectCamelCase }}.o", projectFile = ([] : Optional Text) } ]
      , hs2ats = [ { hs = "hs/{{ ProjectCamelCase }}.hs", ats = ".atspkg/hs2ats/gen.sats", cpphs = False } ]
      }
    ]
    , dependencies = prelude.mapPlainDeps [ "hs-bind" ]
    , ccompiler = "ghc"
    , cflags = ["-optc-O2", "-optc-flto", "-optc-mtune=native", "hs/{{ ProjectCamelCase }}"]
  }
