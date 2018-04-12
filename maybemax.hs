-- find the max value in an Int list

maxhelper :: Int -> [Int] -> Int
maxhelper x [] = x
maxhelper x (y:ys) = maxhelper next ys
  where next = if x>y then x else y

maxfromlist :: [Int] -> Maybe Int
maxfromlist [] = Nothing
maxfromlist (x:xs) = Just (maxhelper x xs)
