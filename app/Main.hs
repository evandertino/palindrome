{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.Text                     as T
import           Data.Text.IO                  as TIO
import           Lib.Palindrome                 ( isPalindrome )

main :: IO ()
main = do
  TIO.putStrLn "Enter a word, and i will tell you if its a palindrome or not"
  text <- TIO.getLine
  let response = if isPalindrome text then "it is!" else "it's not!"
  TIO.putStrLn response
