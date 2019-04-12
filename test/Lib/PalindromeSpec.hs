module Lib.PalindromeSpec
  ( prop_isPalindromeInvariant
  )
where

import           Data.Char                      ( isPunctuation
                                                , isSpace
                                                )
import           Data.Text                     as T
import           Lib.Palindrome

prop_isPalindromeInvariant text = isPalindrome text == isAPalindrome
 where
  cleanPalindrome =
    T.filter (not . isSpace) . T.filter (not . isPunctuation) . T.toLower
  isAPalindrome = (T.reverse . cleanPalindrome) text == cleanPalindrome text