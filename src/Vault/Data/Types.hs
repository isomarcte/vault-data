module Vault.Data.Types
  ( URL(..)
  , TokenPolicy
  , TokenBoundCidr
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Prelude (Eq, Monoid, Ord, Read, Semigroup, Show)

newtype URL =
  URL Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype TokenPolicy =
  TokenPolicy Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype TokenBoundCidr =
  TokenBoundCidr Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)
