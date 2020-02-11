module Vault.Data.Internal.Text
  ( AText(..)
  , textGen
  ) where

import Control.Arrow ((>>^), (^>>))
import Data.Functor (fmap)
import Data.Monoid (Monoid)
import Data.Semigroup (Semigroup)
import Data.String (IsString(fromString), String)
import Data.Text (Text, unpack)
import Prelude (Eq, Ord, Read, Show)
import Test.QuickCheck (Arbitrary(arbitrary, shrink), Gen)

newtype AText =
  AText
    { aTextValue :: Text
    }
  deriving (Show, Eq, Ord, Read, Semigroup, Monoid, IsString)

unpackAText :: AText -> String
unpackAText (AText t) = unpack t

instance Arbitrary AText where
  arbitrary = fmap fromString arbitrary
  shrink = unpackAText ^>> shrink >>^ fmap fromString

textGen :: Gen Text
textGen = fmap aTextValue arbitrary
