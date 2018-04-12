type FavColor = String
-- data Person = Human String String Int FavColor deriving Show

data Person = Person { firstname :: String,
                       lastname :: String,
                       age :: Int,
                       favColor :: FavColor
                     } deriving Show

data Result' = Result' String Float Float Float

data Result = Result { studentname :: String,
                       coursework1 :: Float,
                       coursework2 :: Float,
                       exam :: Float
                     }

myRes = Result "jeremy" 1 1 2
myOtherRes = Result { studentname = "fred",
                      coursework1 = 5,
                      coursework2 = 10,
                      exam = 99
                    }

calculateOverallScore :: Result -> Float
calculateOverallScore res = coursework1 res + coursework2 res + exam res

cheatAtMyExam :: Result -> Result
cheatAtMyExam res = res { exam = 100 }
