-- | Entry point: @cabal run aoc2017 -- <day> [part] [test]@
--
-- Reads puzzle input from @inputs\/dayNN.txt@ (NN zero-padded) and prints
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

usage :: IO a
usage = do
  hPutStrLn stderr "Usage: aoc2017 <day> [part] [test]"
  exitFailure

run :: Int -> [String] -> IO ()
run n rest = case Map.lookup n days of
  Nothing -> hPutStrLn stderr ("No solution registered for day " ++ show n) >> exitFailure
  Just Day { part1 = p1, part2 = p2 } -> do
    (partArg, testMode) <- parseArgs rest
    input <- readFile (inputPath n testMode)
    case partArg of
      Just "1" -> putStrLn (p1 input)
      Just "2" -> putStrLn (p2 input)
      Just _ -> usage
      Nothing -> do
        printf "Part 1: %s\n" (p1 input)
        printf "Part 2: %s\n" (p2 input)

parseArgs :: [String] -> IO (Maybe String, Bool)
parseArgs [] = pure (Nothing, False)
parseArgs [part] = pure (Just part, False)
parseArgs [part, testArg]
  | isTrue testArg = pure (Just part, True)
  | isFalse testArg = pure (Just part, False)
  | otherwise = usage
parseArgs _ = usage

isTrue :: String -> Bool
isTrue s = s == "true" || s == "1" || s == "yes"

isFalse :: String -> Bool
isFalse s = s == "false" || s == "0" || s == "no"

inputPath :: Int -> Bool -> FilePath
inputPath n isTest
  | isTest = printf "inputs/day%02d-test.txt" n
  | otherwise = printf "inputs/day%02d.txt" n
