module IO
    ( ioFunc
    ) where

ioFunc :: IO()

ioFunc = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            ioFunc

reverseWords :: String -> String
reverseWords = unwords . map reverse . words