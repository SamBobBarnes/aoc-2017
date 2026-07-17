{-# LANGUAGE BlockArguments #-}

module Days.Day01
  ( solution,
  )
where

import Day (Day (..))
import Debug.Trace (trace)

solution :: Day
solution =
  Day
    { part1 = p1,
      part2 = p2
    }

p1 :: String -> String
p1 s = s

countMatchingPairs :: [Char] -> Int -> Int
countMatchingPairs [] _ = 0

{- pseudocode
for i in 0..length(xs) - 1:
  let a = i
  let b = i + 1
  if b == length(xs):
    b = 0
  if doAAndBMatch(xs, i, i + 1):
      count += 1

-}

doAAndBMatch :: [Char] -> Int -> Int -> Bool
doAAndBMatch [] _ _ = False
doAAndBMatch xs a b
  | a < 0 || b < 0 = False
  | a >= length xs || b >= length xs = False
  | otherwise = (xs !! a) == (xs !! b)

p2 :: String -> String
p2 s = s ++ "?"
