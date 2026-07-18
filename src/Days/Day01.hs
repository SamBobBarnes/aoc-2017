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

-- Part 1
p1 :: String -> String
p1 s = show $ countMatchingPairs s 0 0

-- ([Char] xs, Int count, Int i) -> Int
countMatchingPairs :: [Char] -> Int -> Int -> Int
countMatchingPairs [] _ _ = 0
countMatchingPairs xs count i =
  if i == ((length xs) - 1)
    then
      if doAAndBMatch xs i 0
        then count + (getValOfChar (xs !! i))
        else count
    -- return count
    else
      if doAAndBMatch xs i (i + 1) -- recurse
        then countMatchingPairs xs (count + (getValOfChar (xs !! i))) (i + 1)
        else countMatchingPairs xs count (i + 1)

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

getValOfChar :: Char -> Int
getValOfChar c = (fromEnum c) - (fromEnum '0')

-- Part 2
p2 :: String -> String
p2 s = s ++ "?"
