module Vault.Data.Types
  ( URL(..)
  , TokenPolicy(..)
  , TokenBoundCidr(..)
  , RequestId(..)
  , LeaseId(..)
  , LeaseDuration(..)
  , Renewable(..)
  , VaultWarning(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Bool (Bool)
import Data.Eq (Eq)
import Data.Monoid (Monoid)
import Data.Ord (Ord)
import Data.Semigroup (Semigroup)
import Data.Text (Text)
import Data.UUID (UUID)
import Data.Word (Word)
import Prelude (Bounded, Enum, Integral, Num, Real)
import Text.Read (Read)
import Text.Show (Show)

newtype URL =
  URL Text
  deriving newtype (Eq, Monoid, Ord, Semigroup, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype TokenPolicy =
  TokenPolicy Text
  deriving newtype (Eq, Monoid, Ord, Semigroup, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype TokenBoundCidr =
  TokenBoundCidr Text
  deriving newtype (Eq, Monoid, Ord, Semigroup, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype RequestId =
  RequestId UUID
  deriving newtype (Eq, Ord, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype LeaseId =
  LeaseId Text
  deriving newtype (Eq, Monoid, Ord, Semigroup, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype LeaseDuration =
  LeaseDuration Word
  deriving newtype ( Eq
                   , Ord
                   , Enum
                   , Num
                   , Real
                   , Bounded
                   , Integral
                   , ToJSON
                   , FromJSON
                   )
  deriving  (Show, Read)

newtype Renewable =
  Renewable Bool
  deriving (Eq, Ord, Enum, Bounded, ToJSON, FromJSON)
  deriving  (Show, Read)

newtype VaultWarning =
  VaultWarning Text
  deriving (Eq, Monoid, Ord, Semigroup, ToJSON, FromJSON)
  deriving  (Show, Read)
