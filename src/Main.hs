module Main where

import qualified Operations.Add as Add
import qualified Operations.Search as Search
import qualified Operations.Delete as Delete
import Database.Core (Database, initDatabase)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
    let db = initDatabase
    putStrLn "Welcome to Haskell Database"
    mainLoop db

mainLoop :: Database -> IO ()
mainLoop db = do
    putStrLn "Choose an option: "
    putStrLn "1. Add record"
    putStrLn "2. Search record"
    putStrLn "3. Delete record"
    putStrLn "4. Exit"
    putStr "> "
    hFlush stdout
    option <- getLine
    case option of
        "1" -> do
            db' <- addRecordFlow db
            mainLoop db'
        "2" -> do
            searchRecordFlow db
            mainLoop db
        "3" -> do
            db' <- deleteRecordFlow db
            mainLoop db'
        "4" -> putStrLn "Exiting..."
        _   -> do
            putStrLn "Invalid option. Try again."
            mainLoop db

addRecordFlow :: Database -> IO Database
addRecordFlow db = do
    putStrLn "Enter record to add: "
    record <- getLine
    let db' = Add.addToDatabase db record
    putStrLn "Record added."
    return db'

searchRecordFlow :: Database -> IO ()
searchRecordFlow db = do
    putStrLn "Enter record to search: "
    record <- getLine
    let results = Search.searchInDatabase db record
    putStrLn $ "Found records: " ++ show results

deleteRecordFlow :: Database -> IO Database
deleteRecordFlow db = do
    putStrLn "Enter record to delete: "
    record <- getLine
    let db' = Delete.deleteFromDatabase db record
    putStrLn "Record deleted."
    return db'
