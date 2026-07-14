# Advent of Code 2017 — Haskell

Solutions to [Advent of Code 2017](https://adventofcode.com/2017) in Haskell,
using Cabal.

## Setup

Requires GHC + Cabal (managed here via [ghcup](https://www.haskell.org/ghcup/)).

```
cabal build
```

## Running a day

Put your puzzle input at `inputs/dayNN.txt` (e.g. `inputs/day01.txt`), then:

```
cabal run aoc2017 -- 1                # prints both parts for day 1
cabal run aoc2017 -- 1 1              # prints only part 1
cabal run aoc2017 -- 1 2              # prints only part 2
cabal run aoc2017 -- 1 2 true         # uses inputs/day01-test.txt
cabal run aoc2017 -- 1 2 false        # uses inputs/day01.txt
```

### Using Just

```
just run 1 2 true
```

## Running tests

```
cabal test
```

## Adding a new day

1. Copy `src/Days/Day01.hs` to `src/Days/DayNN.hs` and implement `part1`/`part2`.
2. Add the module to `exposed-modules` in `aoc2017.cabal`.
3. Import it in `src/Days.hs` and add an entry to the `days` map.
4. Add example-based test cases to `test/Spec.hs`.
5. Save your personal puzzle input to `inputs/dayNN.txt` (not committed).

## Layout

```
src/Main.hs         -- CLI entry point
src/Day.hs          -- shared Day type (part1/part2 functions)
src/Days.hs          -- registry of all days
src/Days/DayNN.hs    -- one module per day
test/Spec.hs         -- example-based regression tests
inputs/              -- puzzle inputs (gitignored)
```
