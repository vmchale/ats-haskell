let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default.dhall
in
let dbin = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-bin.dhall

in pkg //
  { bin =
    [
      dbin //
      { src = "src/{{ project }}.dats"
      , target = "target/{{ project }}"
      , hsDeps = [ { cabalFile = "hs/{{ project }}.cabal", objectFile = "hs/{{ Project }}.o" } ]
      , hs2ats = [ { hs = "hs/{{ Project }}.hs", ats = ".atspkg/hs2ats/gen.sats" } ]
      }
    ]
    , dependencies = [ https://raw.githubusercontent.com/vmchale/hs-bind/master/pkg.dhall ]
    , ccompiler = "ghc-8.2.2"
    , cflags = ["-package-db", "hs/dist-newstyle/packagedb/ghc-8.2.2/", "-optc-O2", "-optc-flto", "-optc-mtune=native", "hs/{{ Project }}"]
  }
