module Operations.Search (searchInDatabase) where

import Database.Core (Database, searchRecords)

searchInDatabase :: Database -> String -> [String]
searchInDatabase = searchRecords
