module Hevolut.NucleicAcid
  ( Nucleobase (..)
  , Nucleotide (..)
  , Gene
  , NucleicAcid
  ) where

data Nucleobase = A | G | C | T | U deriving (Show, Eq, Ord, Enum, Bounded)

data Nucleotide = Single Nucleobase | Double Nucleobase Nucleobase
  deriving (Show, Eq, Ord)

type Gene = [Nucleotide]

type NucleicAcid = [Gene]
