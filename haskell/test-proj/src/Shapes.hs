module Shapes
( Point (..)
, Shape(..)
, area
, move) where

data Point = Point Float Float deriving (Show)

data Shape = Circle Point Float |
             Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2)) 
    = (abs $ x2 - x1) * (abs $ y2 - y1)

move :: Shape -> Float -> Float -> Shape
move (Circle (Point x y) r) x_delta y_delta = Circle (Point (x+x_delta) (y+y_delta) ) r
move (Rectangle (Point x1 y1) (Point x2 y2)) x_delta y_delta 
    = Rectangle (Point (x1+x_delta) (y1+y_delta)) (Point (x2+x_delta) (y2+y_delta))