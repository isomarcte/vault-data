module Vault.Data.V1.Auth.TokenTTL
  ( TokenTTL(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Word (Word)
import GHC.Generics (Generic)
import Prelude (Bounded, Enum, Eq, Integral, Num, Ord, Read, Real, Show)
import Test.QuickCheck.Arbitrary (Arbitrary)
import Vault.Data.V1.Auth.TTL (TTL)

newtype TokenTTL =
  TokenTTL TTL
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

instance ToJSON TokenTTL

instance FromJSON TokenTTL
