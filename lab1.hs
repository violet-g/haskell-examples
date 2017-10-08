import Data.Maybe (fromJust)

double :: Int -> Int
double x = x*2

c2f :: Float -> Float
c2f x = x*9/5 + 32

thd :: (a,b,c) -> c
thd (x,y,z) = z

romanToInt :: String -> Int
romanToInt = fst .foldr (\p (t,s) -> if p >= s
                                    then (t+p,p)
                                    else (t-p,p))
                        (0,0)
                 .map (fromJust . flip lookup (zip "IVXLC" [1,5,10,50,100]))
