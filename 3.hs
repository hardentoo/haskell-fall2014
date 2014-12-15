data Tree = Empty | Node Int Tree Tree

findInLeaves :: Tree -> (Int -> Bool) -> Int -> Int
findInLeaves Empty f err = err
findInLeaves (Node v left right) f err = if f v then v
                                         else findInLeaves left f (findInLeaves right f err) 


test1 = findInLeaves (Node 4 (Node 6 Empty Empty) Empty) (\x -> x > 5) 333 -- 6
test2 = findInLeaves (Node 4 (Node 2 Empty Empty) Empty) (\x -> x > 5) 333 -- 333
