module Lib.Palindrome (
  isPalindrome
) where

import Data.Text as T
import Lib.Internal ( stripWhiteSpace, stripPunctuation, preProcess )

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where cleanText = preProcess text