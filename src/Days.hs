-- | Registry mapping day numbers to their solutions.
--
-- Add a new day by:
--   1. Creating @src\/Days\/DayNN.hs@ (copy Day01.hs as a starting point).
--   2. Adding the module to @exposed-modules@ in the .cabal file.
--   3. Importing it here and adding it to the 'days' map.
module Days
  ( days
  ) where

import qualified Data.Map.Strict as Map
import Day (Day)
import qualified Days.Day01 as Day01

days :: Map.Map Int Day
days =
  Map.fromList
    [ (1, Day01.solution)
    ]
