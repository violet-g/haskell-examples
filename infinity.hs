ones:: [Int]
ones = 1 : ones

headList :: Int
headList = head ones

takefromList :: Int -> [Int]
takefromList x = take x ones

-- Do not terminate:
-- tail ones
-- drop 3 ones
-- ones

f :: Int -> Int -> Int
f x y = y

bot :: a
bot = bot

-- f bot 42 terminates
-- f 42 bot does not terminate

fibs = 1:1:(zipWith (+) fibs (tail fibs))
facts = map (\x -> (foldl (*) 1 [1..x])) [1..]

properfactors :: Int -> [Int]
properfactors x = filter (\y -> (x `mod` y == 0)) [2..(x-1)]

numproperfactors :: Int -> Int
numproperfactors x = length (properfactors x)

primes :: [Int]
primes = filter (\x -> (numproperfactors x == 0)) [2..]
