import           Test.QuickCheck
import           Test.QuickCheck.Instances
import           Data.Char                      ( isPunctuation
                                                , isSpace
                                                )
import           Data.Text                     as T
import           Lib.Palindrome
import           Lib.Internal

main :: IO ()
main = do
  putStrLn "Running tests..."
  putStrLn ""
  quickCheck prop_whitespaceInvariant
  quickCheckWith stdArgs { maxSuccess = 1000 } prop_punctuationInvariant
  quickCheck prop_preProcessInvariant
  quickCheck prop_isPalindromeInvariant
  putStrLn ""
  putStrLn "done!"

prop_whitespaceInvariant text = stripWhiteSpace text == cleanText
  where cleanText = T.filter (not . isSpace) text

prop_punctuationInvariant text = stripPunctuation text == cleanText
  where cleanText = T.filter (not . isPunctuation) text

prop_preProcessInvariant text = preProcess text == cleanText
 where
  cleanText =
    (T.filter (not . isSpace) . T.filter (not . isPunctuation) . T.toLower) text

prop_isPalindromeInvariant text = isPalindrome text == isAPalindrome
 where
  cleanPalindrome =
    T.filter (not . isSpace) . T.filter (not . isPunctuation) . T.toLower
  isAPalindrome = (T.reverse . cleanPalindrome) text == cleanPalindrome text
