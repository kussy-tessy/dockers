module YesNo
    ( yesnoFunc
    ) where

-- YesNoという型クラスを定義する
-- その型クラスの型は、yesnoという関数を持ちそれはBoolを返す
class YesNo a where
    yesno :: a -> Bool

-- Int型にYesNo型クラスの振る舞いをもたせる
-- yesno関数に0を渡すとFalse、それ以外はTrueを返す
instance YesNo Int where
    yesno 0 = False
    yesno _ = True


-- リスト型にYesNo型クラスの振る舞いをもたせる
-- yesno関数に空リストを渡すとFalse、それ以外はTrueを返す
instance YesNo [a] where
    yesno [] = False
    yesno _ = True

-- 他にBool自身、Maybe型もYesNo型クラスのインスタンスとしていたが、省略

-- 関数を定義
yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal trueResult falseResult = if yesno yesnoVal
                                            then trueResult
                                            else falseResult 

yesnoFunc :: IO ()

yesnoFunc = do
    let int = 0 ::Int
    print $ yesnoIf int "true!" "false!"
    let ls = [1, 2, 3]
    print $ yesnoIf ls "true!" "false!"