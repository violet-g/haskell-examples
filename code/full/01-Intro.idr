module Introduction

{- We've seen primitive types -}

answer : Int
answer = 42

hworld : String
hworld = "Hello World"

{- We've seen algebraic types -}

data Pair   a b = MkPair a b
data Maybe  a   = Nothing | Just a
data Either e a = Left e  | Right a

data CList a = Empty | Cons a (CList a)


{- Dependent Types -}

-- Types are first class and can be computed
StringList : Type
StringList = List String

IntList : Type
IntList = List Int

-- Types can also depend on values

ListOfStringOrInt : (isString : Bool) -> Type
ListOfStringOrInt False = IntList
ListOfStringOrInt True = StringList

combine : (isString : Bool)
       -> (xs : ListOfStringOrInt isString)
       -> (ys : ListOfStringOrInt isString)
       -> ListOfStringOrInt isString
combine False xs ys = append xs ys
combine True xs ys = append xs ys
