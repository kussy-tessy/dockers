import Data.Monoid

lengthCompareSimple :: String -> String -> Ordering
lengthCompareSimple x y = 
    let a = (length x `compare` length y)
        b = x `compare` y
    in if a == EQ then b else a

lengthCompareMonoid :: String -> String -> Ordering
lengthCompareMonoid x y =
    (length x `compare` length y) `mappend` (x `compare` y)

main = do
    print $ lengthCompareSimple "abc" "aaaf"
    print $ lengthCompareMonoid "abc" "aaaf"
    print $ lengthCompareSimple "abc" "aba"
    print $ lengthCompareMonoid "abc" "aba"
