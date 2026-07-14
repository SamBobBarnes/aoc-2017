# Usage:
#   just run 1 2 true
# Runs: cabal run aoc2017 -- <day> <part> <test>

run day part test:
    cabal run aoc2017 -- {{ day }} {{ part }} {{ test }}
