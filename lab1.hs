import Data.List

double :: Int -> Int
-- duble an integer
double x = x*2
-- double x = (*2) x
-- double = (\x -> x * 2)
-- double = (*2)

c2f :: Float -> Float
-- celsius to fahrenheir
c2f x = x*9/5 + 32

thd :: (a,b,c) -> c
-- get third el
thd (x,y,z) = z

reversenums :: String
-- reverse words and return the last that comes alphabetically
reversenums =
  let numbers = words "one two three four five six seven eight nine ten"
      backnums = map reverse numbers
  in last $ sort backnums

translateRomanDigit :: Char -> Int
-- map roman digit to integer
translateRomanDigit 'I' = 1
translateRomanDigit 'V' = 5
translateRomanDigit 'X' = 10
translateRomanDigit 'L' = 50
translateRomanDigit 'C' = 100

translateFromRoman :: String -> [Int]
-- return numbers in a list
translateFromRoman xs = map translateRomanDigit xs

applyNegationRule :: [Int] -> [Int]
-- negation rule to translate roman to arabic
applyNegationRule [x] = [x]
applyNegationRule (x:y:xs) = (if x < y then -x else x) : applyNegationRule (y:xs)

fromRoman :: String -> Int
-- roman to arabic converter
fromRoman = sum.applyNegationRule.translateFromRoman
