{-# OPTIONS_GHC -Weverything #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE TemplateHaskell    #-}


module Main where

import Data.Acid (Update, Query, makeAcidic, openLocalStateFrom, query, update, AcidState)
import           Data.SafeCopy        (base, deriveSafeCopy)
import           System.Environment   (getArgs)

data Database = Database [ Row ]

data Row = Row {
    field :: String
  }


addRows :: Row -> Update Database ()
addRows entry = do
  Database entries <- get
  put $ Database (entry:entries)

getRows :: Query Database [Row]
getRows = do
  get

$(deriveSafeCopy 0 'base ''Database)
$(deriveSafeCopy 0 'base ''Row)

$(makeAcidic ''Database ['addRows, 'getRows])

main :: IO ()
main = do
  database <- openLocalStateFrom "db-path" (Database [])
  args <- getArgs
  case args of
    [ "addrow", value ] -> update database $ AddRows value
