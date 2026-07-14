-- | Registry mapping day numbers to their solutions.
--
-- Add a new day by:
--   1. Creating @src\/Days\/DayNN.hs@.
--   2. Adding the module to @exposed-modules@ in the .cabal file.
--   3. Importing it here and adding it to the 'days' map.
module Days
  ( days
  ) where

import qualified Data.Map.Strict as Map
import Day (Day)

days :: Map.Map Int Day
days =
  Map.empty
