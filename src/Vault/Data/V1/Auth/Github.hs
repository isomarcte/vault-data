module Vault.Data.V1.Auth.Github
  (
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Maybe (Maybe)
import Data.Text (Text)
import GHC.Generics (Generic)
import Prelude (Eq, Ord, Read, Show)
import Vault.Data.V1.Auth.TTL (TokenMaxTTL, TokenTTL)

data GithubAuthRequest =
  GithubAuthRequest
    { organization :: Text
    , base_url :: Maybe Text
    , token_ttl :: Maybe TokenTTL
    , token_max_ttl :: Maybe TokenMaxTTL
    }
  deriving (Eq, Read, Ord, Show, Generic)

instance ToJSON GithubAuthRequest

instance FromJSON GithubAuthRequest
