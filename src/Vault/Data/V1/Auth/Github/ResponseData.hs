module Vault.Data.V1.Auth.Github.ResponseData
  ( ResponseData(..)
  ) where

import Vault.Data.Types (URL)
import Vault.Data.V1.Auth.Github.Organization (Organization)
import Vault.Data.V1.Auth.TTL (TokenMaxTTL, TokenTTL)

data ResponseData =
  ResponseData
    { organization :: Organization
    , base_url :: URL
    , ttl :: TokenTTL
    , max_ttl :: TokenMaxTTL
    }
