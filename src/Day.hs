-- | Common type used by every day's solution module.
module Day
  ( Day (..)
  ) where

-- | A single day's puzzle: two parts, each mapping raw input to an answer.
data Day = Day
  { part1 :: String -> String
  , part2 :: String -> String
  }
