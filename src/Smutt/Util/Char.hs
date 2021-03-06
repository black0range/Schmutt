
module Smutt.Util.Char where

import Data.ByteString.Internal as BI

import Data.Word

class (Eq c) => IsChar c where
  fromChar :: Char -> c
  toChar   :: c -> Char
 
instance IsChar Char where
  fromChar = id
  toChar = id

instance IsChar Word8 where
  fromChar = BI.c2w
  toChar = BI.w2c


