module Vault.Data.V1.Auth.TTL
  ( TTL(..)
  , TTLLabel(..)
  , TokenTTL
  , TokenMaxTTL
  , TokenExplicitMaxTTL
  , tokenTTL
  , tokenMaxTTL
  , tokenExplicitMaxTTL
  , tokenTTLValue
  ) where

import Control.Applicative ((<*), pure)
import Control.Monad.Fail (fail)
import Data.Aeson.Types (typeMismatch)
import Data.Either (either)
import Data.Function (($), (.))
import Data.Ord ((>=))
import Data.Scientific (Scientific)
import Data.Semigroup ((<>))
import GHC.Generics (Generic)

import qualified Data.Aeson as DA
import qualified Data.Attoparsec.Text as DAT
import qualified Prelude as P

newtype TTL =
  TTL Scientific
  deriving (P.Eq, P.Num, P.Read, P.Ord, P.Real, P.Show, Generic)

instance DA.ToJSON TTL where
  toJSON (TTL w) = DA.toJSON . P.show $ w

instance DA.FromJSON TTL where
  parseJSON (DA.String t) =
    either
      fail
      (pure . TTL)
      (DAT.parseOnly (DAT.scientific <* DAT.endOfInput) t)
  parseJSON (DA.Number s)
    | s >= 0 = pure . TTL $ s
    | P.otherwise =
      fail $ "TTLs must be non-negative integral values: " <> (P.show s)
  parseJSON otherwise = typeMismatch "Number" otherwise

data TTLLabel
  = TokenTTLLabel
  | TokenMaxTTLLabel
  | TokenExplicitMaxTTLLabel
  deriving (P.Show, P.Eq, P.Enum, P.Ord, Generic)

newtype TokenTTL' (ttlLabel :: TTLLabel) =
  TokenTTL'
    { tokenTTLValue :: TTL
    }
  deriving ( P.Eq
           , P.Num
           , P.Read
           , P.Ord
           , P.Real
           , P.Show
           , Generic
           , DA.FromJSON
           , DA.ToJSON
           )

type TokenTTL = TokenTTL' 'TokenTTLLabel

type TokenMaxTTL = TokenTTL' 'TokenMaxTTLLabel

type TokenExplicitMaxTTL = TokenTTL' 'TokenExplicitMaxTTLLabel

tokenTTL :: Scientific -> TokenTTL
tokenTTL = TokenTTL' . TTL

tokenMaxTTL :: Scientific -> TokenTTL
tokenMaxTTL = TokenTTL' . TTL

tokenExplicitMaxTTL :: Scientific -> TokenTTL
tokenExplicitMaxTTL = TokenTTL' . TTL
