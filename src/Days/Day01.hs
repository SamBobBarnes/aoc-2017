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
p1 s =
  let arr = getPairs s
   in trace
        ("getPairs=" ++ show arr)
        s
        let arr2 = take (length arr - 1) arr
         in trace ("arr2=" ++ show arr2) s

getPairs :: [Char] -> [[Char]]
getPairs (s : xs) = getFirstPair 0 2 (s : xs) : getPairs xs
getPairs [] = []

getFirstPair :: Int -> Int -> [Char] -> [Char]
getFirstPair start end xs = take (end - start) (drop start xs)

p2 :: String -> String
p2 s = s ++ "?"
