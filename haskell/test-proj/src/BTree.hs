module BTree
    ( bTreeTestFunc
    ) where

-- 木とは、空の木、もしくはNodeと左側と右側にそれぞれ木を持つものである
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- それ以下の葉がない木を作る関数
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- -- 要素を木に挿入し挿入した木を返す関数
treeInsert :: (Ord a) => a -> Tree a -> Tree a
-- パターンマッチで関数を定義 -- ガードで場合分けをする
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

let nums = [8, 6, 4, 1, 7, 3, 5]
-- foldr 関数 初期値(アキュムレータ) 値(適用対象)
let numsTree = foldr treeInsert EmptyTree nums

bTreeTestFunc :: IO ()

bTreeTestFunc = do
    -- print numsTree
    print 5