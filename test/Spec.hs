import           Test.QuickCheck
import           Test.QuickCheck.Instances
import           Data.Char                      ( isPunctuation
                                                , isSpace
                                                )
import           Data.Text                     as T
import           Lib.Palindrome
import           Lib.PalindromeSpec
import           Lib.Internal
import           Lib.InternalSpec

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