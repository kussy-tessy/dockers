module Lib
    ( someFunc
    ) where

import Records

someFunc :: IO ()
someFunc = do
    let p = Person {firstName="Kondo", lastName="Manabu", age=28, height=162, phoneNumber="25-1547"}
    print p