import Control.Monad
import Data.Char

main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes = unlines . map(\x -> if isPal x then "pal" else "not pal") . lines

isPal :: String -> Bool
isPal xs = xs == reverse xs
