module Lib.InternalSpec
  ( prop_whitespaceInvariant
  , prop_punctuationInvariant
  , prop_preProcessInvariant
  )
where

import           Data.Char                      ( isPunctuation
                                                , isSpace
                                                )
import           Data.Text                     as T
import           Lib.Internal

prop_whitespaceInvariant text = stripWhiteSpace text == cleanText
  where cleanText = T.filter (not . isSpace) text

prop_punctuationInvariant text = stripPunctuation text == cleanText
  where cleanText = T.filter (not . isPunctuation) text

prop_preProcessInvariant text = preProcess text == cleanText
 where
  cleanText =
    (T.filter (not . isSpace) . T.filter (not . isPunctuation) . T.toLower) text