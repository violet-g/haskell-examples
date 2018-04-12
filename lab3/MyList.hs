module MyList
  (List(..)
  , empty
  , insert
  , mapList
  , printList
  ) where

  data List a = Empty | Cons a (List a) deriving Show

  empty :: List a -> Bool
  empty Empty = True
  empty (Cons x list) = False

  insert :: a -> List a -> List a
  insert x Empty = (Cons x Empty)
  insert x (Cons y list) = (Cons x (insert y list))

  mapList :: (a -> b) -> List a -> List b
  mapList f Empty = Empty
  mapList f (Cons x list) = Cons (f x) (mapList f list)

  printList :: Show a => List a -> IO ()
  printList x =
    do print x

  destroy :: List a -> List a
  destroy Empty = Empty
  destroy (Cons x list) = Empty
