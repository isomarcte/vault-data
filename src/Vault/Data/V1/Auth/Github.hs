module Vault.Data.V1.Auth.Github
  (
  ) where

import Data.Maybe (Maybe)
import Data.Text (Text)
import GHC.Generics (Generic)
import Generic.Random (genericArbitrarySingle)
import Prelude (Eq, Ord, Read, Show)
import Test.QuickCheck.Arbitrary (Arbitrary(arbitrary, shrink), genericShrink)
import Vault.Data.Internal (textGen)

data GithubAuthRequest =
  GithubAuthRequest
    { organization :: Text
    , base_url :: Maybe Text
    }
  deriving (Eq, Read, Ord, Show, Generic)

instance Arbitrary GithubAuthRequest where
  arbitrary = do
    organization <- textGen
    base_url <- 
  shrink = genericShrink
