module Operations.Add (addToDatabase) where

import Database.Core (Database, addRecord)

addToDatabase :: Database -> String -> Database
addToDatabase = addRecord
