import System.Environment
import System.IO
import System.Directory
import Data.List
import Control.Exception

dispatch :: String -> [String] ->IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove

main = do
    (command:argList) <- getArgs
    dispatch command argList

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
    tasks <- getTasks fileName
    putStrLn "These are your Todo items:"
    mapM_ putStrLn $ map formatTasks tasks

remove :: [String] -> IO ()
remove [fileName] = do
    view [fileName]
    tasks <- getTasks fileName
    putStrLn "Which one do you want to remove? type number"
    numberString <- getLine
    let number = read numberString
        newTodoItems = unlines $ map (\(x, y) -> y) $ delete (tasks !! number) tasks
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)
        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile "todo.txt"
            renameFile tempName "todo.txt")

getTasks :: String -> IO [(Int, String)]
getTasks fileName = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numbers = [0..]
    return $ zip numbers todoTasks

formatTasks :: (Int, String) -> String
formatTasks (x, y) = show x ++ " - " ++ y