module Vault.Data.V1.Auth.TTL
  ( TTL(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Word (Word)
import GHC.Generics (Generic)
import Prelude (Bounded, Enum, Eq, Integral, Num, Ord, Read, Real, Show)
import Test.QuickCheck.Arbitrary (Arbitrary)

newtype TTL =
  TTL Word
  deriving ( Enum
           , Eq
           , Num
           , Read
           , Bounded
           , Integral
           , Ord
           , Real
           , Show
           , Generic
           , Arbitrary
           )

instance ToJSON TTL

instance FromJSON TTL
