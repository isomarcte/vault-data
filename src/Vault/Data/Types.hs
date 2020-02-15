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
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype TokenPolicy =
  TokenPolicy Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype TokenBoundCidr =
  TokenBoundCidr Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype RequestId =
  RequestId UUID
  deriving (Eq, Ord, Show, Read, ToJSON, FromJSON)

newtype LeaseId =
  LeaseId Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)

newtype LeaseDuration =
  LeaseDuration Word
  deriving ( Eq
           , Ord
           , Show
           , Read
           , Enum
           , Num
           , Real
           , Bounded
           , Integral
           , ToJSON
           , FromJSON
           )

newtype Renewable =
  Renewable Bool
  deriving (Eq, Ord, Show, Read, Enum, Bounded, ToJSON, FromJSON)

newtype VaultWarning =
  VaultWarning Text
  deriving (Eq, Monoid, Ord, Semigroup, Show, Read, ToJSON, FromJSON)
