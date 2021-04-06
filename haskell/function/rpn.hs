main = do
    input <- getLine
    putStrLn $ show $ solveRPN $ words input

solveRPN :: [String] -> Double
solveRPN = head . foldl calc []
    where calc (x:y:xs) "+" = (y + x):xs
          calc (x:y:xs) "-" = (y - x):xs
          calc (x:y:xs) "*" = (y * x):xs
          calc (x:y:xs) "/" = (y / x):xs
          calc xs numberStr = read numberStr:xs