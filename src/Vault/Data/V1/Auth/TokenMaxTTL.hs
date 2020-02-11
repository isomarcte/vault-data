module Vault.Data.V1.Auth.TokenMaxTTL
  ( TokenMaxTTL(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Prelude (Bounded, Enum, Eq, Integral, Num, Ord, Read, Real, Show)
import Vault.Data.V1.Auth.TTL (TTL)

newtype TokenMaxTTL =
  TokenMaxTTL TTL
  deriving (Enum, Eq, Num, Read, Bounded, Integral, Ord, Real, Show, Generic)

instance ToJSON TokenMaxTTL

instance FromJSON TokenMaxTTL
