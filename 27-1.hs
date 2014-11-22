data Tree = Empty | Node Char Tree Tree

toStr :: Tree -> String
toStr Empty = "e"
toStr (Node v l r) = "n" ++ [v] ++ (toStr l) ++ (toStr r)