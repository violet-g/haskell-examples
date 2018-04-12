module ListWithLength

%default covering

{- Intermezzo -}

-- A way to think about numbers. Also called Nats
data Whole = Zero | Next Whole

%name Whole a,b

One : Whole
One = Next Zero

Two : Whole
Two = Next $ One

Three : Whole
Three = Next $ Next One

-- We can even define operations on them.
plus : (a : Whole)
    -> (b : Whole)
    -> Whole

minus : (a : Whole)
     -> (b : Whole)
     -> Whole

{- Lists with Length -}

data Vect : (size   : Whole)
         -> (elemTy : Type)
         -> Type
  where
    Empty : Vect Zero a
    Cons : {a : Type}  -- Curly brackets provide implicit arguments.
        -> {l : Whole}
        -> (elem : a)
        -> (rest : Vect l a)
        -> Vect (Next l) a

{- Appending two vectors together -}

append : ?append_type_sig

{- Mapping over a vector -}

map : ?map_type_sig

{- Zipping two vectors together -}

zip : ?zip_type_sig

{- Matrix -}

testMatrix : Vect Three (Vect One Int)
testMatrix = Cons (Cons 1 Empty)
           $ Cons (Cons 2 Empty)
           $ Cons (Cons 3 Empty)
           $ Empty

transpose : Vect rows (Vect cols elemTy)
         -> Vect cols (Vect rows elemTy)


{- Exercise: Write safe head and tail for Vect -}

head : ?head_type_sig
tail : ?tail_type_sig

-- EOF
