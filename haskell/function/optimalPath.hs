import Data.List

-- Aの道路上の交差点へのコスト、Bの道路上の交差点へのコスト、道路をまたぐときのコストの3タプルのデータ型
data Section = Section { costA :: Int, costB :: Int, costC :: Int } deriving (Show)

-- 道路網とはSectionのリストである
type RoadSystem = [Section]

-- A、B、Cのラベルを定義
data Label = A | B | C deriving (Show)

-- 経路とはラベルと整数（経路）のタプルからなるリストである
type Path = [(Label, Int)]

main = do
    contents <- getContents -- コンテンツ読み込み
    let threes = groupsOf 3 (map read $ lines contents) -- 3つずつチャンク
        roadSystem = map (\[a, b, c] -> Section a b c) threes -- 道路網に変換
        path = optimalPath roadSystem -- 最適経路算出
        pathStr = concat $ map (show . fst) path
        -- map (\pathItem -> show (fst pathItem))をポイントフリースタイルにしている
        pathTime = sum $ map snd path
    putStrLn $ "The best path to take is " ++ pathStr
    putStrLn $ "The taken time is " ++ show pathTime

-- roadStepとは[Aの交差点までの最適経路、Bの交差点までの最適経路]と次のSectionを受け取り、そのSectionの[Aの交差点までの最適経路、Bの交差点までの最適経路]を返す関数である。
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    let timeA = sum (map snd pathA)
        timeB = sum (map snd pathB)
        forwardTimeToA = timeA + a
        crossTimeToA = timeB + b + c
        forwardTimeToB = timeB + b
        crossTimeToB = timeA + a + c
        newPathToA = if forwardTimeToA <= crossTimeToA
                        then (A, a):pathA
                        else (C, c):(B, b):pathB
        newPathToB = if forwardTimeToB <= crossTimeToB
                        then (B, b):pathB
                        else (C, c):(A, a):pathA
    in (newPathToA, newPathToB)

-- 畳み込みをしながらA、Bへの最適経路を求め、よりよい方を返す
optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (bestAPath, bestBPath) = foldl roadStep ([], []) roadSystem
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
        then reverse bestAPath
        else reverse bestBPath

-- リストを受け取って、n個ずつに切る（chunk）する関数
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined -- コーナーケース対応用？
groupsOf _ [] = [] -- コーナーケース対応用？
groupsOf n xs = take n xs : groupsOf n (drop n xs)


