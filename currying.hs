gen_add_n :: Int -> (Int -> Int)
gen_add_n = (\n -> (\x -> x+n))

add_3 :: Int -> Int
add_3 = gen_add_n 3

add_7 :: Int -> Int
add_7 = gen_add_n 7

gen_op_n :: (Int -> Int -> Int) -> Int -> (Int -> Int)
gen_op_n = (\op n -> (\x -> x `op` n))

add_4 :: Int -> Int
add_4 = gen_op_n (+) 4

mult_2 :: Int -> Int
mult_2 = gen_op_n (*) 2

f :: Int -> Int -> Int
f x y = 2*x + y

-- g = f 3
-- g 10
-- >16
