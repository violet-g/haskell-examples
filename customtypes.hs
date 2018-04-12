import Data.List

data Color = Red | Blue | Yellow
color = Red
action = case color of
  Red -> print("Red")
  Blue -> print("Blue")
  Yellow -> print("Yellow")

data SimpleNum = One | Two | Many deriving Show

convert :: Int -> SimpleNum
convert 1 = One
convert 2 = Two
convert _ = Many

data Move = MyUp | MyDown | MyLeft | MyRight
type Pos = (Int,Int)

moveIt :: Move -> Pos -> Pos
-- move horizontally or vertically in
-- a 2d cartesian coordinate space
moveIt MyUp    (x,y) = (x,y+1)
moveIt MyDown  (x,y) = (x,y-1)
moveIt MyLeft  (x,y) = (x-1,y)
moveIt MyRight (x,y) = (x+1,y)

-- Simple battleships game - like "guess the square"
attack :: Pos -> [Pos] -> [Pos]
-- fire at a square, possibly sink a ship
-- the ships' Positions are specified by the
-- input list, before firing ... the surviving
-- ships' positions are in the output list
attack _ [] = []
attack fire ships =
  Data.List.filter (/=fire) ships

data Vehicle = Car Bool Int | Plane Int | Bicycle Int deriving Show

-- how environmentally friendly is your vehicle?
youAreGreen :: Vehicle -> Bool
youAreGreen (Bicycle _) = True
youAreGreen (Plane _) = False
youAreGreen (Car x _) = (not x) -- x indicates diesel engine

data Shape = Circle Float | Rectangle Float Float deriving (Show,Eq)

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rectangle x y) = x*y

data List  = Nil | Cons Int List deriving (Show,Eq)

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show,Eq)

contains :: Eq a => a -> (Tree a) -> Bool
-- returns true if the element is in the tree
contains _ Leaf = False
contains x (Node y t1 t2) =
  x==y ||(contains x t1) || (contains x t2)
  -- if x == y then True
  --   else (contains x t1) || (contains x t2)

data Pet = Cat | Dog | Fish | Parrot String

helloPet :: Pet -> String
helloPet x =
  case x of
    Cat -> "meeow"
    Dog -> "woof"
    Fish -> "bubble"
    Parrot name -> "pretty " ++ name
    -- _ -> "grunt"
