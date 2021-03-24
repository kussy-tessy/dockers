module IO
    ( ioFunc
    ) where

import Control.Monad

ioFunc :: IO()

ioFunc = do
    -- line <- getLine
    -- if null line
    --     then return ()
    --     else do
    --         putStrLn $ reverseWords line
    --         ioFunc
    -- colors <- forM [1, 2, 3, 4] $ \a -> do
    --     putStrLn $ "Which color do you associate the number" ++ show a ++ "?"
    --     getLine
    --     -- color <- getLine
    --     -- return color
    -- putStrLn "The colors that you associate 1, 2, 3, and 4 are: "
    -- mapM_ putStrLn colors
    colors <- mapM bindcolor [1, 2, 3, 4]
    putStrLn "The colors that you associate 1, 2, 3, and 4 are: "
    mapM_ putStrLn colors

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

bindcolor :: Int -> IO String
bindcolor a = do
    putStrLn $ "Which color do you associate the number" ++ show a ++ "?"
    getLine