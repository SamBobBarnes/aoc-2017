-- | Minimal test-suite: checks each registered day against the AoC 2017
-- worked examples from the puzzle text. Extend with more cases as days
-- are solved.
module Main (main) where

import Control.Monad (unless)
import System.Exit (exitFailure)

data Case = Case { caseName :: String, expected :: String, actual :: String }

main :: IO ()
main = do
  let cases = []
      failures = [c | c <- cases, expected c /= actual c]
  mapM_ report cases
  unless (null failures) exitFailure

report :: Case -> IO ()
report c
  | expected c == actual c = putStrLn ("OK   " ++ caseName c)
  | otherwise = putStrLn ("FAIL " ++ caseName c ++ ": expected " ++ expected c ++ ", got " ++ actual c)
