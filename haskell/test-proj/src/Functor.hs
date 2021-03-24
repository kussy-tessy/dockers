module Functor
    ( functorFunc
    ) where

-- 木とは、空の木、もしくはNodeと左側と右側にそれぞれ木を持つものである
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- それ以下の葉がない木を作る関数
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- -- 要素を木に挿入し挿入した木を返す関数
treeInsert :: (Ord a) => a -> Tree a -> Tree a
-- パターンマッチで関数を定義
treeInsert x EmptyTree = singleton x
-- ガードで場合分けをする
treeInsert x (Node a left right)
    | x == a = Node x left right -- 挿入したい値が根と一致していたらそのまま返す
    | x < a  = Node a (treeInsert x left) right -- 挿入したい値が根より小さければ、左の木に挿入してできた部分木と右の木からなる木を返す
    | x > a  = Node a left (treeInsert x right) -- その逆

functorFunc :: IO ()

functorFunc = do
    let nums = [8, 6, 4, 1, 7, 3, 5]
    -- foldr 関数 初期値(アキュムレータ) 値(適用対象)
    -- let numsTree = foldl (\acc x -> treeInsert x acc) EmptyTree nums
    let numsTree = foldr (\x acc -> treeInsert x acc) EmptyTree nums
    -- let numsTree = foldr treeInsert EmptyTree nums
    -- treeInsertは値, 木を引数に取り木を返す、すなわちa->b->bの関数なのでfoldrのが書きやすい
    -- foldr (a->b->b) -> b ->[a] -> b
    -- foldl (a->b->a) -> a ->[b] -> a
    print numsTree