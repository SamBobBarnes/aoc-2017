-- | Minimal test-suite: checks each registered day against the AoC 2017
-- worked examples from the puzzle text. Extend with more cases as days
-- are solved.
module Main (main) where

import Control.Monad (unless)
import Day (Day (..))
import qualified Days.Day01 as Day01
import System.Exit (exitFailure)

data Case = Case { caseName :: String, expected :: String, actual :: String }

main :: IO ()
main = do
  let cases =
        [ Case "Day01 part1 example" "3" (part1 Day01.solution "1122")
        , Case "Day01 part1 example 2" "4" (part1 Day01.solution "1111")
        , Case "Day01 part1 example 3" "0" (part1 Day01.solution "1234")
        , Case "Day01 part1 example 4" "9" (part1 Day01.solution "91212129")
        , Case "Day01 part2 example" "6" (part2 Day01.solution "1212")
        , Case "Day01 part2 example 2" "0" (part2 Day01.solution "1221")
        ]
      failures = [c | c <- cases, expected c /= actual c]
  mapM_ report cases
  unless (null failures) exitFailure

report :: Case -> IO ()
report c
  | expected c == actual c = putStrLn ("OK   " ++ caseName c)
  | otherwise = putStrLn ("FAIL " ++ caseName c ++ ": expected " ++ expected c ++ ", got " ++ actual c)
