{ mkDerivation, array, base, bytestring, cereal, containers
, criterion, directory, extensible-exceptions, fetchgit, filelock
, filepath, mtl, network, random, safecopy, stdenv, stm
, system-fileio, system-filepath, template-haskell, th-expand-syns
, unix
}:
mkDerivation {
  pname = "acid-state";
  version = "0.14.2";
  src = fetchgit {
    url = "https://github.com/input-output-hk/acid-state";
    sha256 = "0lgw3r3hlimrdrimdczfaznhpsyz1vklqw6yyymrcb068v21qh59";
    rev = "d601339c95d7b79be3a58a192fc8c394f0b7fc94";
  };
  libraryHaskellDepends = [
    array base bytestring cereal containers directory
    extensible-exceptions filelock filepath mtl network safecopy stm
    template-haskell th-expand-syns unix
  ];
  benchmarkHaskellDepends = [
    base criterion directory mtl random system-fileio system-filepath
  ];
  homepage = "http://acid-state.seize.it/";
  description = "Add ACID guarantees to any serializable Haskell data structure";
  license = stdenv.lib.licenses.publicDomain;
}
