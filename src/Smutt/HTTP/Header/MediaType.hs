 {-# LANGUAGE OverloadedStrings #-}

module Smutt.HTTP.Header.MediaType (
  MediaType (..)
  , readMediaType
  ) where

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T

import Control.Arrow
import Control.Monad 

data MediaType = MediaType {
  majorType :: Text
  , subType :: Text
  , parameters :: [(Text,Text)]
  } deriving (Eq)


readMediaType :: Text -> Maybe MediaType
readMediaType "" = Nothing
readMediaType str =
  if T.null subType
  then Nothing
  else Just $ MediaType majorType subType parameters
  where
    (mediaType: parameterStrings) =  T.split (==';') str
    (majorType, subType) = join (***) T.toCaseFold $ T.drop 1 <$> T.break (=='/') mediaType 
    parameters = map fixParamaterString parameterStrings

    fixParamaterString = join (***) T.strip . (T.drop 1 <$>) . T.break (=='=')


      
    
    
            
