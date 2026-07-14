-- | Entry point: @cabal run aoc-2017 -- <day> [part]@
--
-- Reads puzzle input from @input\/dayNN.txt@ (NN zero-padded) and prints
-- the answer(s) for the requested day.
module Main (main) where

import qualified Data.Map.Strict as Map
import Days (days)
import Day (Day (..))
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (hPutStrLn, stderr)
import Text.Printf (printf)

main :: IO ()
main = do
  args <- getArgs
  case args of
    (dayArg:rest) -> run (read dayArg) rest
    [] -> usage

usage :: IO ()
usage = do
  hPutStrLn stderr "Usage: aoc-2017 <day> [part]"
  exitFailure

run :: Int -> [String] -> IO ()
run n rest = case Map.lookup n days of
  Nothing -> hPutStrLn stderr ("No solution registered for day " ++ show n) >> exitFailure
  Just Day { part1 = p1, part2 = p2 } -> do
    input <- readFile (inputPath n)
    case rest of
      ["1"] -> putStrLn (p1 input)
      ["2"] -> putStrLn (p2 input)
      _ -> do
        printf "Part 1: %s\n" (p1 input)
        printf "Part 2: %s\n" (p2 input)

inputPath :: Int -> FilePath
inputPath n = printf "input/day%02d.txt" n
