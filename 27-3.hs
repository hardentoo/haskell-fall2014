data Tree = Empty | Node Char Tree Tree deriving Show

subtree :: String -> (Tree, String)
subtree ('e':str) = (Empty, str)
subtree ('n':v:str) = let l = subtree str
                          r = subtree (snd l)
                          in (Node v (fst l) (fst r), snd r)

fromStr :: String -> Tree
fromStr str = fst (subtree str)
