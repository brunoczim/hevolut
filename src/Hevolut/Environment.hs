module Hevolut.Environment
  ( ResourceQuantity
  , Selection
  , Environment (..)
  ) where

import Hevolut.Organism (Organism)
import qualified Hevolut.Organism as Organism

type ResourceQuantity = Integer

type Selection = Organism -> Organism -> ResourceQuantity

data Environment = Environment
  { selection :: Selection
  , selectionName :: String
  , resources :: ResourceQuantity
  , organisms :: Organism.Registry
  }

instance Show Environment where
  show e = concat
    [ "Environment { selectionName = "
    , show (selectionName e)
    , ", resources = "
    , show (resources e)
    , ", organisms = "
    , show (organisms e)
    , " }"
    ]
