import Control.Monad

greet :: IO ()
greet = do
  planet <- getLine
  home <- getLine
  putStrLn("Greetings "++ planet ++ "ling.")
  putStrLn("I am from " ++ home ++ ".")
  putStrLn("Take me to your leader.")

-- data Maybe a = Just a | Nothing
--
myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:xs) = Just x

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (x:xs) = Just xs
--
-- instance Monad Maybe where
--   return = Just
--   Nothing >>= f = Nothing
--   (Just x) >>= f = f x
--   fail _ = Nothing

-- return third element of a list using the Maybe type
foo :: [a] -> Maybe a
foo xs =
  case myTail xs of
    Nothing -> Nothing
    Just a -> case myTail a of
      Nothing -> Nothing
      Just b -> myHead b

-- same operation using the Maybe monad
bar :: [a] -> Maybe a
-- bar xs = myTail xs >>= (\a -> myTail a >>= (\b -> myHead b))
-- bar xs =
--   myTail xs >>= (\a ->
--   myTail a >>= (\b ->
--   myHead b))
-- bar xs =
--   myTail xs >>= \a ->
--   myTail a >>= \b ->
--   myHead b
bar xs = do
  a <- myTail xs
  b <- myTail a
  myHead b

data Thing a = CoolThing a | UncoolThing deriving Show

instance Functor Thing where
  fmap _ UncoolThing = UncoolThing
  fmap f (CoolThing x) = CoolThing (f x)

data MagicBox a = MagicBox a deriving (Read, Show, Eq, Ord)

instance Functor MagicBox where
  fmap f (MagicBox x) = MagicBox (f x)
