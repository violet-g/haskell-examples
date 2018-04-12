module Main where
  import MyList

  main :: IO ()
  main = do
    let list = foldr insert Empty [1..10]
    printList list
