module Vault.Data.V1.Auth.TTL
  ( TTL(..)
  , TTLLabel(..)
  , TokenTTL'(..)
  , TokenTTL
  , TokenMaxTTL
  , TokenExplicitMaxTTL
  , tokenTTL
  , tokenMaxTTL
  , tokenExplicitMaxTTL
  ) where

import Control.Applicative (empty)
import Control.Monad (forM)
import Data.Aeson (FromJSON, ToJSON)
import Data.Function ((.))
import Data.Functor (fmap)
import Data.String (String)
import Data.Word (Word)
import GHC.Generics (Generic)
import Language.Haskell.TH
import Prelude (Bounded, Enum, Eq, Integral, Num, Ord, Read, Real, Show)

ttlLabels :: [Name]
ttlLabels =
  fmap mkName ["TokenTTLLabel", "TokenMaxTTLLabel", "TokenExplicitMaxTTLLabel"]

mkTTLLabels :: Dec
mkTTLLabels =
  let clauses = [ConT (mkName "Show")]
   in DataD
        empty
        (mkName "TTLLabel2")
        empty
        empty
        (fmap (\n -> NormalC n empty) ttlLabels)
        [DerivClause empty clauses]

$(mkTTLLabels)

newtype TTL =
  TTL Word
  deriving (Enum, Eq, Num, Read, Bounded, Integral, Ord, Real, Show, Generic)

instance ToJSON TTL

instance FromJSON TTL

data TTLLabel
  = TokenTTLLabel
  | TokenMaxTTLLabel
  | TokenExplicitMaxTTLLabel
  deriving (Show, Eq, Enum, Ord, Generic)

newtype TokenTTL' (ttlLabel :: TTLLabel) =
  TokenTTL' TTL
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
           , FromJSON
           , ToJSON
           )

type TokenTTL = TokenTTL' 'TokenTTLLabel

type TokenMaxTTL = TokenTTL' 'TokenMaxTTLLabel

type TokenExplicitMaxTTL = TokenTTL' 'TokenExplicitMaxTTLLabel

tokenTTL :: Word -> TokenTTL
tokenTTL = TokenTTL' . TTL

tokenMaxTTL :: Word -> TokenTTL
tokenMaxTTL = TokenTTL' . TTL

tokenExplicitMaxTTL :: Word -> TokenTTL
tokenExplicitMaxTTL = TokenTTL' . TTL
