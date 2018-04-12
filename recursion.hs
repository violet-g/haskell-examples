fact :: Int -> Int
fact 0 = 1
fact n = n * fact(n-1)
-- fact n = if n == 0 then 1 else n*fact(n-1)

fib :: Int -> Int
fib 0 = 0  -- a base case
fib 1 = 1 -- another base case
fib n = fib (n-1) + fib (n-2)  -- recursive case, note double recursion

greenBottles :: Int -> String
greenBottles 0 = "there'll be no green bottles, standing on the wall\n"
greenBottles 1 = "one green bottle, standing on a wall\n" ++ greenBottles 0
greenBottles n = (show n) ++ "green bottles, standing on a wall\n" ++ greenBottles (n-1)  -- (++) is list (or string) concatenation

ack :: (Integer, Integer) -> Integer
ack (0, n) = n + 1
ack (m, 0) = ack(m-1, 1)
ack (m, n) = ack(m-1, ack(m, n-1))

rocketLaunch :: Int -> String
rocketLaunch 0 = "blastoff!"
rocketLaunch n = show n ++ " ... " ++ (rocketLaunch $ n-1)

sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs
-- sumList (x:xs) = x + theRest
--                     where theRest = sumList xs

lenList :: [a] -> Int
lenList [] = 0
lenList (_:xs) = 1 + lenList xs

mapList :: (a -> b) -> [a] -> [b]
mapList _ [] = []
mapList f (x:xs) = (f x) : (mapList f xs)

filterList :: (a -> Bool) -> [a] -> [a]
filterList pred [] = []
filterList pred (x:xs)
  | pred x = x : (filterList pred xs)
  | otherwise = filterList pred xs

myfoldl :: (b->a->b) -> b -> [a] -> b
myfoldl f z [] = z
myfoldl f z (x:xs) = myfoldl f acc xs
  where acc = (f z x)

foldsum :: [Int] -> Int
foldsum l = myfoldl (+) 0 l

foldlen :: [a] -> Int
foldlen l = myfoldl (\x y-> x+1) 0 l

myfoldr :: (a->b->b) -> b -> [a] -> b
myfoldr f z [] = z
myfoldr f z (x:xs) = myfoldr f acc xs
  where acc = (f x z)
