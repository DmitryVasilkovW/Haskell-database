module Database.Core (
    Database,
    initDatabase,
    addRecord,
    searchRecords,
    deleteRecord
) where

import Database.Types (Database)

initDatabase :: Database
initDatabase = []

addRecord :: Database -> String -> Database
addRecord db record = record : db

searchRecords :: Database -> String -> [String]
searchRecords db query = filter (== query) db

deleteRecord :: Database -> String -> Database
deleteRecord db record = filter (/= record) db
