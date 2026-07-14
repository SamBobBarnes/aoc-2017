-- | Day 1: Inverse Captcha
-- https://adventofcode.com/2017/day/1
module Days.Day01
  ( solution
  ) where

import Data.Char (digitToInt, isDigit)
import Day (Day (..))

solution :: Day
solution = Day { part1 = show . solve 1, part2 = show . solve2 }

-- | Sum digits that match the digit offset positions ahead (wrapping).
solve :: Int -> String -> Int
solve offset raw = sum [ d | (d, d') <- zip ds (drop offset (cycle ds)), d == d' ]
  where ds = digits raw

solve2 :: String -> Int
solve2 raw = solve (length (digits raw) `div` 2) raw

digits :: String -> [Int]
digits = map digitToInt . filter isDigit
