module Vault.Data.V1.Auth.Github.Organization
  ( Organization(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Prelude (Eq, Monoid, Ord, Read, Semigroup, Show)

newtype Organization =
  Organization Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)
