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

{- Dependent Types Intro -}

-- Types are first class and can be computed
StringList : Type
StringList = List String

IntList : Type
IntList = List Int

ListOfStringOrInt : (isString : Bool) -> Type

-- Types can also depend on values

combine : (isString : Bool)
       -> (xs : ListOfStringOrInt isString)
       -> (ys : ListOfStringOrInt isString)
       -> ListOfStringOrInt isString
