import System.IO

main = do
    todoItem <- getLine
    appendFileLn "todo.txt" todoItem

appendFileLn :: String -> String -> IO ()
appendFileLn filePath str = appendFile filePath $ str ++ "\n"