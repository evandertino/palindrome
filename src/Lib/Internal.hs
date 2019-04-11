module Lib.Internal
  ( stripWhiteSpace
  , stripPunctuation
  , preProcess
  )
where

import           Data.Text                     as T
import           Data.Char                      ( isSpace
                                                , isPunctuation
                                                )

stripWhiteSpace :: T.Text -> T.Text
stripWhiteSpace = T.filter (not . isSpace)

stripPunctuation :: T.Text -> T.Text
stripPunctuation = T.filter (not . isPunctuation)

preProcess :: T.Text -> T.Text
preProcess = stripWhiteSpace . stripPunctuation . T.toLower
