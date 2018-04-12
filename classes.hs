data List a = Nil | Cons a (List a)

sizeList :: List a -> Int
sizeList Nil = 0
sizeList (Cons a rest) = 1 + (sizeList rest)

data Tree a = Empty | Node a (Tree a) (Tree a)

sizeTree :: Tree a -> Int
sizeTree Empty = 0
sizeTree (Node a l r) = 1 + (sizeTree l) + (sizeTree r)

countTotalSize :: Tree Int -> Tree String -> Int
countTotalSize x y = (size x) + (size y)

class Sizeable a where
  size :: a -> Int

instance Sizeable Int where
  size x = x

instance Sizeable (Tree a) where
  size = sizeTree

instance Sizeable (List a) where
  size = sizeList

-- class Pretty a where
--   pretty :: a -> String
--   prettyPrintLn :: a -> IO ()
--   prettyPrintLn a = putStrLn (pretty a)

class (Show a) => Pretty a where
  pretty :: a -> String
  pretty = show

convertTree :: Tree Int -> Tree String
convertTree Empty = Empty
convertTree (Node a l r) = Node (show a) (convertTree l) (convertTree r)

convertList :: (a -> b) -> List a -> List b
convertList f Nil = Nil
convertList f (Cons a rest) = Cons (f a) (convertList f rest)


data Bright = Blue | Red deriving (Read, Show)

darkBright :: Bright -> Bool
darkBright Blue = True
darkBright Red = False

lightenBright :: Bright -> Bright
lightenBright Blue = Red
lightenBright Red = Red

data Pastel = Turquoise | Tan deriving (Read, Show)

darkPastel :: Pastel -> Bool
darkPastel Turquoise = True
darkPastel Tan = False

lightenPastel :: Pastel -> Pastel
lightenPastel Turquoise = Tan
lightenPastel Tan = Tan

class Color a where
  dark :: a -> Bool
  lighten :: a -> a

instance Color Bright where
  dark = darkBright
  lighten = lightenBright

instance Color Pastel where
  dark = darkPastel
  lighten = lightenPastel
