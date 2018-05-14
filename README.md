with nixpkgs rev 6c064e6b1f3

```
[nix-shell:~/iohk/repro/version1]$ runhaskell Setup.hs build
Building reproduce-0.1.0.0...
Preprocessing executable 'reproduce' for reproduce-0.1.0.0...
[1 of 1] Compiling Main             ( Main.hs, dist/build/reproduce/reproduce-tmp/Main.o )
ghc: panic! (the 'impossible' happened)
  (GHC version 8.0.2 for x86_64-unknown-linux):
        initTc: unsolved constraints
  WC {wc_insol =
        [W] get_a394 :: t_a393[tau:1] (CHoleCan: get)
        [W] get_a39m :: t_a39l[tau:1] (CHoleCan: get)
        [W] put_a39r :: t_a39q[tau:1] (CHoleCan: put)}

Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug
```
