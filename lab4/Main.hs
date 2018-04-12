{-# LANGUAGE OverloadedStrings #-}

module Main where

import Text.LaTeX
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
--
--
main :: IO()
-- main = readCsvFile
main = writeCsvFile
-- main =
--   do text <- execLaTeXT doc
--      renderFile "test.tex" text

doc :: Monad m => LaTeXT m ()
doc =
  do thePreamble
     document theBody

thePreamble :: Monad m => LaTeXT m ()
thePreamble =
  do documentclass [] article
     author "Jeremy Singer"
     title "Table Example"

theBody :: Monad m => LaTeXT m ()
theBody =
  do maketitle
     center $ tabular Nothing [RightColumn,VerticalLine,LeftColumn] $
       do textbf "Name" & textbf "Job"
          lnbk -- this is a linebreak, like \\ in LaTeX
          hline
     do textit "Jeremy"
        &
        textit "Foo"

readCsvFile :: IO ()
readCsvFile = do
  csvData <- BL.readFile "test.csv"
  let res = (decode NoHeader csvData) :: (Either String (V.Vector (String,String)))
  case res  of
    (Left err) -> putStrLn err
    -- (Right v) -> print (Data.Vector.length v)
    (Right v) -> V.forM_ v $ \(x,y) -> (putStrLn $ x ++ "'s favourite colour is " ++ y)

writeCsvFile :: IO()
writeCsvFile = do
  let s = encode [("Fred"::String, 27::Int), ("Wilma", 28)]
  putStrLn $ "writing data to example file ... " ++ (show s)
  BL.writeFile "example.csv" s
