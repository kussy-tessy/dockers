module AskForNumber
    ( callAskForNumber
    ) where

import System.Random
import Control.Monad(when)

callAskForNumber = do
    gen <- getStdGen
    let (num, newGen) = getRandomNumber gen
    askForNumber num newGen

getRandomNumber :: StdGen -> (Int, StdGen)
getRandomNumber gen = randomR (1, 100) gen

askForNumber :: Int -> StdGen -> IO ()
askForNumber answer gen = do
    putStrLn "Which number in the range from 1 to 100 am I thinking of?"
    -- putStrLn $ show answer
    numberString <- getLine
    when (not $ null numberString) $ do
        let number = read numberString
        case () of
            _
                | number < answer -> showWrongMessage "No! answer is larger than " answer number gen
                | number > answer -> showWrongMessage "No! answer is smaller than " answer number gen
                | otherwise -> showCorrectMessageAndNext gen

showWrongMessage :: String -> Int -> Int -> StdGen -> IO ()
showWrongMessage message answer number gen = do
    putStrLn $ message ++ show number
    askForNumber answer gen

showCorrectMessageAndNext :: StdGen -> IO ()
showCorrectMessageAndNext gen = do
    putStrLn "Correct! Next Problem!"
    let (num, newGen) = getRandomNumber gen
    askForNumber num newGen