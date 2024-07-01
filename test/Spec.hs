import Test.Hspec
import Database.Core (Database, initDatabase, addRecord, searchRecords, deleteRecord)

main :: IO ()
main = hspec $ do
    describe "Database.Core" $ do
        it "initializes an empty database" $ do
            let db = initDatabase
            db `shouldBe` []

        it "adds a record to the database" $ do
            let db = addRecord initDatabase "Record 1"
            db `shouldBe` ["Record 1"]

        it "searches for a record in the database" $ do
            let db = addRecord initDatabase "Record 1"
            searchRecords db "Record 1" `shouldBe` ["Record 1"]

        it "deletes a record from the database" $ do
            let db = addRecord initDatabase "Record 1"
            let db' = deleteRecord db "Record 1"
            db' `shouldBe` []
