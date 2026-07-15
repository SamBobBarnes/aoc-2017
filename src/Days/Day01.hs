module Days.Day01
  ( solution
  ) where

import Day (Day (..))

solution :: Day
solution = Day
  { part1 = p1
  , part2 = p2
  }

p1 :: String -> String
p1 s = s ++ "!"

p2 :: String -> String
p2 s = s ++ "?"
