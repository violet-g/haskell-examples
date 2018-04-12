import Control.Applicative

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show, Eq)

-- function that maps a function f over the elements of a tree
treemap :: (a -> b) -> Tree a -> Tree b
treemap f Leaf = Leaf
treemap f (Node a t1 t2) = Node (f a) (treemap f t1) (treemap f t2)

instance Functor (Tree) where
  fmap = treemap

type Phonedir = [(String, String)]
lecturers = [("singer","3638"),("storer", "4970")]

phonedirlookup :: String -> Phonedir -> Maybe String
phonedirlookup str [] = Nothing
phonedirlookup str ((name, num):lecturers) =
  if (str == name) then Just num
  else phonedirlookup str lecturers

uniprefix :: String -> String
uniprefix ext = "0141 330 " ++ ext

externalLookup :: String -> Phonedir -> Maybe String
externalLookup str phonedir = (Just uniprefix) <*> (phonedirlookup str phonedir)

getSum :: IO ()
getSum =
  do x <- getLine
     y <- getLine
     let num1 = read x :: Int
     let num2 = read y :: Int
     print (num1 + num2)
