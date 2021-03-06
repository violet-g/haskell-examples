module ProofsAndPredicates

%default total

%hide List

{- Reminder of lists -}
data List : (elemTy : Type) -> Type where
  Empty : List elemTy
  Cons  : (x : elemTy) -> (rest : List elemTy) -> List elemTy

MyList : List Int
MyList = (Cons 1 (Cons 2 (Cons 3 Empty)))

{- Q: Can we write a 'safe' head for list? -}

unSafeHead : List a -> a

{- Q: What does it mean for `head` to be 'safe'? -}

{- How to provide evidence that the given list is non-empty? -}

hasElements : List a -> Bool
hasElements Empty      = False
hasElements (Cons _ _) = True

{- How to use this function at the type-level? -}

{- Predicates -}

{- Simple Equality predicate. -}

data Equal : (a : ty) -> (b : ty) -> Type where
   AreEqual : Equal a a

-- A 'safe' version of head for `List`.
safeHead' : ?safeHead1_type_sig







{- This is cumbersome, better to provide a custom predicate to capture that a list has elements. -}

data ListHasElements : (xs : List a) -> Type
  where
    HasElements : ListHasElements (Cons x rest)

example0 : ListHasElements (Cons 1 Empty)
example0 = HasElements


safeHead'' : ?safeHead2_type_sig











{- Q: How to provide evidence that the returned element is in the list? -}

data ElementOf : (value : elemTy)
              -> (list  : List elemTy)
              -> Type
  where
    Here : ElementOf value (Cons value rest)
    There : (later : ElementOf value rest)
         -> ElementOf value (Cons not_value rest)




{- Example -}

example1 : ElementOf 1 MyList

example2 : ElementOf 3 MyList




{- Can also use this predicate to perform safe operations on lists. -}

remove : ?remove_type_sig


{- Q: How do we describe that an element *is* the head of the list? -}

data ElementIsHead : (value : elemTy)
                  -> (list  : List elemTy)
                  -> Type
  where
    IsHead : ElementIsHead value (Cons value rest)

example3 : ElementIsHead 1 MyList








{- Q: How to provide evidence a value satisfies a given predicate? -}

{- Dependent Pairs -}

data Proof : (valTy  : Type)
          -> (predTy : valTy -> Type )
          -> Type
  where
    MkProof : {Predicate : ty -> Type}
           -> (value : ty)
           -> (suchThat : Predicate value)
           -> Proof ty Predicate


example4 : Proof (List Int) (\xs => ListHasElements xs)
example4 = MkProof MyList HasElements

example5 : Proof Int
                 (\x => ElementOf x MyList)
example5 = MkProof 2 (There Here)








{- Q: How to build a 'safe' version of head -}

head : ?head_type_sig
