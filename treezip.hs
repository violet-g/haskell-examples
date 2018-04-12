-- AE 1

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show, Eq)

treezip :: (Tree a) -> (Tree b) -> (Tree (a,b))
-- This function takes two trees and combines elements at corresponding locations
-- to form a result tree of pairs of elements. (If the trees differ in sizes,
-- the result only contains elements from overlapping nodes.)
treezip Leaf Leaf = Leaf
treezip (Node _ _ _) Leaf = Leaf
treezip Leaf (Node _ _ _) = Leaf
treezip (Node a l1 r1) (Node b l2 r2) =
        let left = treezip l1 l2
            right = treezip r1 r2
        in Node (a,b) left right


treeunzip :: (Tree (a,b)) -> (Tree a, Tree b)
-- This function takes a tree of pairs and returns a pair of trees.
treeunzip Leaf = (Leaf, Leaf)
treeunzip (Node (a,b) left right) =
          (Node a l1 r1, Node b l2 r2)
          where (l1, l2) = treeunzip (left)
                (r1, r2) = treeunzip(right)

-- Functions can be tested with:
-- (treezip (fst (treeunzip x)) (snd (treeunzip x))) == x
-- -> needs to return True given x is a tree of pairs
