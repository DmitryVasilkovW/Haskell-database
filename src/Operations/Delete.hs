module Operations.Delete (deleteFromDatabase) where

import Database.Core (Database, deleteRecord)

deleteFromDatabase :: Database -> String -> Database
deleteFromDatabase = deleteRecord
