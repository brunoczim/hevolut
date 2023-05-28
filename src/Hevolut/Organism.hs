module Hevolut.Organism
  ( Id
  , Organism (..)
  , Registry
  , unpopulated
  , bear
  , lookup
  , kill
  ) where

import Prelude hiding (id, lookup)
import Data.Map (Map)
import qualified Data.Map as Map
import Hevolut.NucleicAcid (NucleicAcid)

type Id = Integer

data Organism = Organism
  { nucleicAcid :: NucleicAcid
  } deriving (Show)

data Registry = Registry
  { idCounter :: Id
  , organisms :: Map Id Organism
  } deriving (Show)

unpopulated :: Registry
unpopulated = Registry { idCounter = 0, organisms = Map.empty }

bear :: Organism -> Registry -> (Id, Registry)
bear o r =
  ( idCounter r
  , Registry
    { idCounter = idCounter r + 1
    , organisms = Map.insert (idCounter r) o (organisms r)
    }
  )

lookup :: Id -> Registry -> Maybe Organism
lookup i = Map.lookup i . organisms

kill :: Id -> Registry -> (Maybe Organism, Registry)
kill i r = case lookup i r of
  Just o -> (Just o, r { organisms = Map.delete i (organisms r) })
  Nothing -> (Nothing, r)
