module Vault.Data.V1.Auth.Github
  ( GithubAuthRequest(..)
  ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Maybe (Maybe)
import Data.Vector (Vector)
import GHC.Generics (Generic)
import Prelude (Eq, Ord, Read, Show)
import Vault.Data.Types (TokenBoundCidr, TokenPolicy, URL)
import Vault.Data.V1.Auth.Github.Organization (Organization)
import Vault.Data.V1.Auth.TTL (TokenExplicitMaxTTL, TokenMaxTTL, TokenTTL)

data GithubAuthRequest =
  GithubAuthRequest
    { organization :: Organization
    , base_url :: Maybe URL
    , token_ttl :: Maybe TokenTTL
    , token_max_ttl :: Maybe TokenMaxTTL
    , token_policies :: Maybe (Vector TokenPolicy)
    , token_bound_cidrs :: Maybe (Vector TokenBoundCidr)
    , token_explicit_max_ttl :: Maybe TokenExplicitMaxTTL
    }
  deriving (Eq, Read, Ord, Show, Generic)

instance ToJSON GithubAuthRequest

instance FromJSON GithubAuthRequest
