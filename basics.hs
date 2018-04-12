import Data.Map

hello :: String -> String
hello name = "Hello, " ++ name

f :: Int -> Int -> Int
f = \x y -> x*y + x  + y

first :: (a, b) -> a
first (x, _) = x

second :: (a, b) -> b
second (_, y) = y

roots :: Float -> Float -> Float -> [Float]
roots a b c =
  let
    det2 = b*b - 4*a*c;
    det = sqrt(det2);
    rootp = (-b + det)/(2*a);
    rootm = (-b - det)/(2*a);
  in [rootm, rootp]

maxInt :: Int -> Int -> Int
maxInt x y =
  if x > y
    then x
    else y

set :: Data.Map.Map String Integer
set = Data.Map.insert "Answer" 42 Data.Map.empty

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."

shapeName :: Int -> String
shapeName 3 = "triangle"
shapeName 4 = "rectangle"
shapeName 5 = "pentagon"
shapeName 6 = "hexagon"
shapeName _ = "polygon"

mknoble :: Bool -> String -> String
mknoble female name = (if female then "Dame " else "Sir ") ++ name

journeyCost :: Float -> Float -> Float
journeyCost miles fuelcostperlitre =
  let milespergallon = 35
      litrespergallon = 4.55
      gallons = miles/milespergallon
  in gallons*litrespergallon*fuelcostperlitre

squareplusone :: Int -> Int
squareplusone x = xsquared + 1
  where xsquared = x * x

cel2fahr :: Float -> Float
cel2fahr x = (x * scalingfactor) + freezingpoint
  where scalingfactor = 9.0/5.0
        freezingpoint = 32

doubleList :: [Int] -> [Int]
-- doubleList xs = map (2*) xs
-- doubleList = map (2*)
-- doubleList xs = map (*2) xs
-- doubleList = map (*2)
doubleList xs = map (\x -> x * 2) xs
-- doubleList = map (\x -> x * 2)
