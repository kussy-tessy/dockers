module Lib
    ( someFunc
    ) where

import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code

lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!!"
    Just (state, code) -> if state /= Taken
        then Right code
        else Left $ "Locker " ++ show lockerNumber ++ " is already Taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100, (Taken, "ZD39I")),
    (101, (Free, "JAH3I")),
    (103, (Free, "IQSA9")),
    (105, (Free, "QOTSA"))]

someFunc :: IO ()

someFunc = do
    print (lockerLookup 101 lockers)
    print (lockerLookup 100 lockers)