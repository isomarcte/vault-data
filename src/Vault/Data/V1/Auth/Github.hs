module Vault.Data.V1.Auth.Github
  (
  ) where

import Data.Maybe (Maybe)
import Data.Text (Text)
import GHC.Generics (Generic)
import Generic.Random (genericArbitrarySingle)
import Prelude (Eq, Ord, Read, Show)
import Test.QuickCheck.Arbitrary (Arbitrary(arbitrary, shrink), genericShrink)
import Vault.Data.Internal.Text (aTextValue, textGen)

data GithubAuthRequest t =
  GithubAuthRequest
    { organization :: t
    , base_url :: Maybe t
    }
  deriving (Eq, Read, Ord, Show, Generic)

instance Arbitrary t => Arbitrary (GithubAuthRequest t) where
  arbitrary = do
    organization <- arbitrary
    base_url <- arbitrary
    return GithubAuthRequest {organization = organization, base_url = base_url}
  shrink = genericShrink
